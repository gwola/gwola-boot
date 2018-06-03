package org.goodfox.gwola.weixin.rest;

import org.goodfox.gwola.base.utils.LoginUserUtils;
import org.goodfox.gwola.sys.util.DictUtils;
import org.goodfox.gwola.user.constant.UserInfoTypeEnum;
import org.goodfox.gwola.user.entity.UserInfoEO;
import org.goodfox.gwola.user.service.UserInfoEOService;
import org.goodfox.gwola.util.http.ResponseMessage;
import org.goodfox.gwola.util.http.Result;
import org.goodfox.gwola.util.utils.DateUtils;
import org.goodfox.gwola.util.utils.RequestUtils;
import org.goodfox.gwola.util.utils.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.goodfox.gwola.util.utils.RequestUtils;
import org.goodfox.gwola.util.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "${restPath}/weixin")
@Api(description = "初始化数据接口")
public class WeixinInitRestController {

    @Autowired
    private Environment environment;

    @Autowired
    private UserInfoEOService userInfoEOService;

    @ApiOperation(value = "获取初始化数据")
    @GetMapping("/initData")
    public ResponseMessage<Map<String, Object>> initData(HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();

        String token = (String) request.getSession().getAttribute("token");
        UserInfoEO userInfo = userInfo(token);
        result.put("token", token);
        result.put("systemTime", DateUtils.dateToString(new Date()));
        result.put("userInfo", userInfo);
        result.put("sysDict", DictUtils.getDictMap());
        result.put("sysSetting", listSetting(request));
        if (userInfo.getType() == UserInfoTypeEnum.SUPPLIER.getValue()) {
            result.put("supplierId", LoginUserUtils.getLoginSupplierId(request));
        }
        return Result.success(result);
    }

    private UserInfoEO userInfo(String token) {
        return userInfoEOService.get(LoginUserUtils.getLoginUserId(token));
    }

    private Map<String, Object> listSetting(HttpServletRequest request) {
        Map<String, Object> settingMap = new HashMap<>();
        settingMap.put("appName", environment.getProperty("one.application.name"));
        settingMap.put("appShortName", environment.getProperty("one.application.shortName"));
        settingMap.put("appVersion", environment.getProperty("one.application.version"));
        String maxFileSizeShow = environment.getProperty("spring.http.multipart.max-file-size");
        settingMap.put("maxFileSize", getMaxFileSize(maxFileSizeShow));
        settingMap.put("maxFileSizeShow", maxFileSizeShow);
        settingMap.put("basePath", RequestUtils.getBasePath(request));
        return settingMap;
    }

    private static long getMaxFileSize(String maxFileSizeStr) {
        if (StringUtils.isEmpty(maxFileSizeStr)) {
            return 0;
        }

        long maxFileSize = 0;
        if (maxFileSizeStr.toUpperCase().endsWith("MB")) {
            int mb = Integer.parseInt(maxFileSizeStr.substring(0, maxFileSizeStr.length() - 2));
            maxFileSize = mb * 1024 * 1024L;
        } else if (maxFileSizeStr.toUpperCase().endsWith("KB")) {
            int kb = Integer.parseInt(maxFileSizeStr.substring(0, maxFileSizeStr.length() - 2));
            maxFileSize = kb * 1024;
        }
        return maxFileSize;
    }

}
