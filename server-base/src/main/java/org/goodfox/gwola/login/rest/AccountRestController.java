package org.goodfox.gwola.login.rest;

import org.goodfox.gwola.notify.service.IMessageSenderService;
import org.goodfox.gwola.sys.service.BaseTemplateEOService;
import org.goodfox.gwola.user.constant.VerifyCodeTypeEnum;
import org.goodfox.gwola.user.entity.UserInfoEO;
import org.goodfox.gwola.user.service.UserInfoEOService;
import org.goodfox.gwola.util.constant.GlobalConfig;
import org.goodfox.gwola.util.exception.GwolaBaseException;
import org.goodfox.gwola.util.http.CookieUtils;
import org.goodfox.gwola.util.http.ResponseMessage;
import org.goodfox.gwola.util.http.Result;
import org.goodfox.gwola.util.utils.RandomUtils;
import org.goodfox.gwola.util.utils.RedisUtil;
import org.goodfox.gwola.util.utils.StringUtils;
import org.goodfox.gwola.util.utils.UUID;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.goodfox.gwola.util.utils.StringUtils;
import org.goodfox.gwola.util.utils.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "${restPath}/account")
@Api(description = "账户接口")
public class AccountRestController {

    private static final Logger logger = LoggerFactory.getLogger(AccountRestController.class);

    private static final String RESET_PASSWORD_USER_ID = VerifyCodeTypeEnum.RESET_PASSWORD.getCode() + "_USER_ID";
    private static final String RESET_PASSWORD_AUTH_CODE = VerifyCodeTypeEnum.RESET_PASSWORD.getCode() + "_AUTH_CODE";

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private IMessageSenderService iMessageSenderService;

    @Autowired
    private UserInfoEOService userInfoEOService;

    @Autowired
    private BaseTemplateEOService baseTemplateEOService;

    public void validVerifyCode(HttpServletRequest request, String captcha) {
        String cookieValue = CookieUtils.getCookieValue(request);
        String validCode = redisUtil.get(cookieValue + "_" + VerifyCodeTypeEnum.LOGIN.getCode());
        if (StringUtils.isEmpty(captcha) || !captcha.toUpperCase().equals(validCode)) {
            throw new GwolaBaseException("0001", "验证码错误.");
        }
        redisUtil.remove(cookieValue + "_" + VerifyCodeTypeEnum.LOGIN.getCode());
    }

    @ApiOperation(value = "验证用户帐户，验证通过发送一个验证码到用户邮箱")
    @GetMapping(value = "/validAccount")
    public ResponseMessage validAccount(HttpServletRequest request, HttpServletResponse response,
                                        String account, String captcha) throws IOException {
        // 验证验证码是否正确
        validVerifyCode(request, captcha);

        // 验证系统中是否有该用户
        UserInfoEO userInfoEO = userInfoEOService.getUserByLoginName(account);
        if (userInfoEO == null) {
            return Result.error("0002", "用户不存在");
        }
        if (StringUtils.isEmpty(userInfoEO.getUserContactInfo().getEmail())) {
            return Result.error("0002", "用户未设置邮箱，请联系管理员重置密码");
        }

        // 生成验证码
        String validCode = RandomUtils.randomNumberString(6);
        logger.info("Send ValidCode: {}", validCode);

        // 获取Cookie并缓存验证码
        String cookieValue = CookieUtils.getCookieValueIfNullThenSetCookie(request, response);
        redisUtil.set(cookieValue + "_" + VerifyCodeTypeEnum.RESET_PASSWORD.getCode(), validCode, GlobalConfig.getRegistryCodeExpireTime());

        // 存储USER＿ID以便第三步重置密码的时候使用（半个小时有效期）
        redisUtil.set(cookieValue + "_" + RESET_PASSWORD_USER_ID, userInfoEO.getUserId(), GlobalConfig.getRegistryCodeExpireTime());

        // 发送邮件通知用户
        Map<String, Object> placeholderMap = new HashMap<>();
        placeholderMap.put("registryCode", validCode);
        placeholderMap.put("expireTime", String.valueOf(GlobalConfig.getRegistryCodeExpireTime() / 60));
        placeholderMap.put("companyName", GlobalConfig.getCompanyName());
        iMessageSenderService.sendEmail(userInfoEO.getUserContactInfo().getEmail(), "重置密码", baseTemplateEOService.fillTemplateByCode("003", placeholderMap));

        return Result.success(StringUtils.fuzzyEmail(userInfoEO.getUserContactInfo().getEmail()));
    }

    @ApiOperation(value = "验证用户输入的验证码")
    @GetMapping(value = "/validVerifyCode")
    public ResponseMessage validVerifyCode(HttpServletRequest request, HttpServletResponse response, String verifyCode) {
        // 验证
        if (StringUtils.isEmpty(verifyCode)) {
            return Result.error("0003", "请输入验证码");
        }
        String cookieValue = CookieUtils.getCookieValue(request);
        String validCodeRedis = redisUtil.get(cookieValue + "_" + VerifyCodeTypeEnum.RESET_PASSWORD.getCode());
        if (StringUtils.isEmpty(validCodeRedis)) {
            return Result.error("0003", "验证码已经失效");
        }
        if (!validCodeRedis.equals(verifyCode)) {
            return Result.error("0003", "请输入正确的验证码");
        }

        // 验证通过清除验证码
        redisUtil.remove(cookieValue + "_" + VerifyCodeTypeEnum.RESET_PASSWORD.getCode());

        // 设置标识表示验证通过了（没什么意义，就是一个标识）
        redisUtil.set(cookieValue + "_" + RESET_PASSWORD_AUTH_CODE, UUID.randomUUID(), GlobalConfig.getRegistryCodeExpireTime());
        return Result.success();
    }

    @ApiOperation(value = "重置密码")
    @GetMapping(value = "/resetPassword")
    public ResponseMessage resetPassword(HttpServletRequest request, HttpServletResponse response, String password) {
        if (StringUtils.isEmpty(password)) {
            return Result.error("0001", "密码不能为空");
        }

        String cookieValue = CookieUtils.getCookieValue(request);
        String authCode = redisUtil.get(cookieValue + "_" + RESET_PASSWORD_AUTH_CODE);
        String userId = redisUtil.get(cookieValue + "_" + RESET_PASSWORD_USER_ID);
        if (StringUtils.isEmpty(authCode) || StringUtils.isEmpty(userId)) {
            return Result.error("0001", "重置密码失败，请重试");
        }

        userInfoEOService.updatePassword(userId, password);

        // 修改成功清除缓存
        redisUtil.remove(cookieValue + "_" + RESET_PASSWORD_AUTH_CODE,
                cookieValue + "_" + RESET_PASSWORD_USER_ID);
        return Result.success();
    }
}
