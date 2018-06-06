package org.goodfox.gwola.login.service;

import org.goodfox.gwola.sys.entity.SysOfficeEO;
import org.goodfox.gwola.user.constant.UserInfoTypeEnum;
import org.goodfox.gwola.user.entity.UserManagerEO;
import org.goodfox.gwola.user.service.UserInfoEOService;
import org.goodfox.gwola.user.service.UserManagerEOService;
import org.goodfox.gwola.util.bean.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserUtilService {

    @Autowired
    private UserManagerEOService userManagerEOService;

    @Autowired
    private UserInfoEOService userInfoEOService;

    public void fetchOtherInfo(LoginUser loginUser) {
        if (loginUser == null) {
            return;
        }
        if (loginUser.getUserType() == UserInfoTypeEnum.MANAGER.getValue()) {
            // 获取机构信息
            UserManagerEO userManagerEO = userManagerEOService.get(loginUser.getUserId());
            if (userManagerEO != null) {
                SysOfficeEO sysOfficeEO = userManagerEO.getSysOffice();
                if (sysOfficeEO != null) {
                    loginUser.setOfficeId(sysOfficeEO.getId());
                    loginUser.setOfficeParentIds(sysOfficeEO.getParentIds());
                }
            }
        }
        loginUser.setDataScope(userInfoEOService.getMaxDataScope(loginUser.getUserId()));
    }
}
