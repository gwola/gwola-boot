package org.goodfox.gwola.weixin.rest;


import com.foxinmy.weixin4j.exception.WeixinException;
import com.foxinmy.weixin4j.model.Button;
import com.foxinmy.weixin4j.mp.api.MenuApi;
import com.foxinmy.weixin4j.token.TokenManager;
import com.foxinmy.weixin4j.type.ButtonType;
import org.goodfox.gwola.base.utils.LoginUserUtils;
import org.goodfox.gwola.login.service.WeixinLoginService;
import org.goodfox.gwola.user.entity.UserInfoEO;
import org.goodfox.gwola.user.service.UserInfoEOService;
import org.goodfox.gwola.util.bean.LoginUser;
import org.goodfox.gwola.util.http.ResponseMessage;
import org.goodfox.gwola.util.http.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "${restPath}/weixin/user")
@Api(description = "账户接口")
public class WeixinUserController {

    @Autowired
    private UserInfoEOService userInfoEOService;

    @ApiOperation(value = "获取Token")
    @GetMapping(value = "/info")
    public ResponseMessage userInfo(HttpServletRequest request) {
        LoginUser loginUser = LoginUserUtils.getCurrentUser(request);
        UserInfoEO userInfoEO = userInfoEOService.get(loginUser.getUserId());
        return Result.success(userInfoEO);
    }

}
