package io.gwola.boot.controller.common;

import io.gwola.boot.common.utils.CreateVerifyCode;
import io.gwola.boot.common.utils.ResultUtil;
import io.gwola.boot.common.vo.Captcha;
import io.gwola.boot.common.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @author sunyu1984
 */
@Api(description = "验证码接口")
@RequestMapping("${gwola.restPath}/common/captcha")
@RestController
public class CaptchaController {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @RequestMapping(value = "/init",method = RequestMethod.GET)
    @ApiOperation(value = "初始化验证码")
    public Result<Object> initCaptcha() {

        String captchaId = UUID.randomUUID().toString().replace("-","");
        String code = new CreateVerifyCode().randomStr(4);
        Captcha captcha = new Captcha();
        captcha.setCaptchaId(captchaId);
        //缓存验证码
        redisTemplate.opsForValue().set(captchaId,code,3L, TimeUnit.MINUTES);
        return new ResultUtil<Object>().setData(captcha);
    }

    @RequestMapping(value = "/draw/{captchaId}", method = RequestMethod.GET)
    @ApiOperation(value = "根据验证码ID获取图片")
    public void drawCaptcha(@PathVariable("captchaId") String captchaId, HttpServletResponse response) throws IOException {

        //得到验证码 生成指定验证码
        String code=redisTemplate.opsForValue().get(captchaId);
        CreateVerifyCode vCode = new CreateVerifyCode(116,36,4,10,code);
        vCode.write(response.getOutputStream());
    }
}
