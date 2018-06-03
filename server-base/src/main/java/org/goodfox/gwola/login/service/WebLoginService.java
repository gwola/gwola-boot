package org.goodfox.gwola.login.service;

import org.goodfox.gwola.base.utils.LoginUserUtils;
import org.goodfox.gwola.login.security.ShiroSubjectUtils;
import org.goodfox.gwola.user.entity.UserInfoEO;
import org.goodfox.gwola.user.service.UserInfoEOService;
import org.goodfox.gwola.util.bean.LoginUser;
import org.goodfox.gwola.util.exception.LoginInvalidException;
import org.goodfox.gwola.util.http.CookieUtils;
import org.goodfox.gwola.util.utils.RequestUtils;
import org.apache.commons.lang3.StringUtils;
import org.goodfox.gwola.login.security.ShiroSubjectUtils;
import org.goodfox.gwola.util.utils.RequestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Service
public class WebLoginService {

    @Autowired
    private CommonLoginService commonLoginService;

    @Autowired
    private UserInfoEOService userInfoEOService;

    public String login(HttpServletRequest request) {
        String userId = ShiroSubjectUtils.getUserId();
        if (StringUtils.isEmpty(userId)) {
            throw new LoginInvalidException();
        }

        UserInfoEO userInDb = userInfoEOService.get(userId);
        LoginUser loginUser = userInDb.toLoginUser();
        loginUser.setIp(RequestUtils.getClientIp(request));
        return commonLoginService.loginSuccess(loginUser);
    }

    public void logout(HttpServletRequest request, HttpServletResponse response) {
        LoginUserUtils.clearAll(CookieUtils.getAuthToken(request));
        request.getSession().removeAttribute("token");
        CookieUtils.removeCookie(request, response);
        ShiroSubjectUtils.logout();
    }
}
