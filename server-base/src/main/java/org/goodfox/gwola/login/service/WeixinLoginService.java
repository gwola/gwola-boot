package org.goodfox.gwola.login.service;

import org.goodfox.gwola.base.utils.LoginUserUtils;
import org.goodfox.gwola.user.entity.UserInfoEO;
import org.goodfox.gwola.user.service.UserInfoEOService;
import org.goodfox.gwola.util.bean.LoginUser;
import org.goodfox.gwola.util.utils.RequestUtils;
import org.goodfox.gwola.util.utils.RequestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class WeixinLoginService {

    @Autowired
    private UserInfoEOService userInfoEOService;

    @Autowired
    private CommonLoginService commonLoginService;

    /**
     * 微信端：账户密码登录,登录成功绑定账户
     *
     * @param account  账号
     * @param password 密码
     * @param openId   微信OpenId
     * @return
     */
    public String loginByAccount(HttpServletRequest request, String account, String password, String openId) {
        UserInfoEO userInfoEO = userInfoEOService.login(account, password, openId);
        LoginUser loginUser = userInfoEO.toLoginUser();
        loginUser.setIp(RequestUtils.getClientIp(request));
        return commonLoginService.loginSuccess(loginUser);
    }

    /**
     * 微信端：静默登录
     *
     * @param openId
     * @return
     */
    public String loginByOpenId(HttpServletRequest request, String openId) {
        UserInfoEO userInfoEO = userInfoEOService.getUserInfoEOByOpenId(openId);
        LoginUser loginUser = userInfoEO.toLoginUser();
        loginUser.setIp(RequestUtils.getClientIp(request));
        return commonLoginService.loginSuccess(loginUser);
    }

    public void logout(String token) {
        LoginUserUtils.clearAll(token);
    }
}
