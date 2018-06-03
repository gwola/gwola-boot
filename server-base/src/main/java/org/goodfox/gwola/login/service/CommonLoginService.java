package org.goodfox.gwola.login.service;

import org.goodfox.gwola.base.utils.LoginUserUtils;
import org.goodfox.gwola.login.utils.UserUtilService;
import org.goodfox.gwola.user.constant.UserInfoTypeEnum;
import org.goodfox.gwola.user.service.UserInfoEOService;
import org.goodfox.gwola.util.bean.LoginUser;
import org.goodfox.gwola.util.utils.UUID;
import org.goodfox.gwola.util.utils.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonLoginService {

    @Autowired
    private UserInfoEOService userInfoEOService;

    @Autowired
    private UserUtilService userUtilService;

    public String loginSuccess(LoginUser loginUser) {
        // 更新用户的登录时间以及登录IP
        userInfoEOService.updateUserLoginInfo(loginUser.getUserId(), loginUser.getIp());
        userUtilService.fetchOtherInfo(loginUser);

        // 缓存登录用户信息
        String token = UUID.randomUUID();
        LoginUserUtils.set(loginUser.getUserId() + LoginUserUtils.LOGIN_STATE, loginUser.getIp());
        LoginUserUtils.set(token + LoginUserUtils.LOGIN_USER_NEW, loginUser);
        if (loginUser.getUserType() == UserInfoTypeEnum.SUPPLIER.getValue()) {
            LoginUserUtils.set(loginUser.getSupplierId() + LoginUserUtils.LOGIN_STATE, loginUser.getIp());
        }
        return token;
    }

}
