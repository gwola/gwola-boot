package org.goodfox.gwola.user.service;

import org.goodfox.gwola.sys.service.SysRoleEOService;
import org.goodfox.gwola.sys.service.SysUserRoleEOService;
import org.goodfox.gwola.user.bean.ManageUserQueryCondition;
import org.goodfox.gwola.user.constant.UserInfoTypeEnum;
import org.goodfox.gwola.user.dao.UserManagerEODao;
import org.goodfox.gwola.user.entity.UserContactInfoEO;
import org.goodfox.gwola.user.entity.UserInfoEO;
import org.goodfox.gwola.user.entity.UserManagerEO;
import org.goodfox.gwola.util.exception.GwolaBaseException;
import org.goodfox.gwola.util.http.PageInfo;
import org.goodfox.gwola.util.service.CrudService;

import org.goodfox.gwola.util.utils.StringUtils;
import org.goodfox.gwola.util.utils.UUID;
import org.goodfox.gwola.util.utils.cipher.password.PasswordUtils;
import org.goodfox.gwola.sys.service.SysRoleEOService;
import org.goodfox.gwola.sys.service.SysUserRoleEOService;
import org.goodfox.gwola.user.bean.ManageUserQueryCondition;
import org.goodfox.gwola.user.constant.UserInfoTypeEnum;
import org.goodfox.gwola.user.dao.UserManagerEODao;
import org.goodfox.gwola.user.entity.UserContactInfoEO;
import org.goodfox.gwola.user.entity.UserInfoEO;
import org.goodfox.gwola.user.entity.UserManagerEO;
import org.goodfox.gwola.util.utils.StringUtils;
import org.goodfox.gwola.util.utils.UUID;
import org.goodfox.gwola.util.utils.cipher.password.PasswordUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserManagerEOService extends CrudService<UserManagerEODao, UserManagerEO, String> {

    @Autowired
    private SysRoleEOService sysRoleEOService;

    @Autowired
    private UserInfoEOService userInfoEOService;

    @Autowired
    private UserContactInfoEOService userContactInfoEOService;

    @Autowired
    private SysUserRoleEOService sysUserRoleEOService;

    public PageInfo<UserManagerEO> page(ManageUserQueryCondition userQueryCondition) {
        PageInfo<UserManagerEO> pageInfo = dao.page(userQueryCondition);
        for (UserManagerEO userManager : pageInfo.getList()) {
            userManager.setRoleNameList(sysRoleEOService.getSysRoleNameListByUserId(userManager.getUserId()));
        }
        return pageInfo;
    }

    @Override
    public UserManagerEO get(String id) {
        UserManagerEO user = super.get(id);
        user.setRoleIdList(sysRoleEOService.getSysRoleIdListByUserId(id));
        return user;
    }

    @Override
    public UserManagerEO save(UserManagerEO entity) {
        if (entity.getSysOffice() == null) {
            throw new GwolaBaseException("用户所属机构不能为空");
        }
        if(StringUtils.isEmpty(entity.getUserInfo().getAccount())) {
            throw new GwolaBaseException("用户账户不能为空");
        }
        if (userInfoEOService.isExistByAccount(entity.getUserInfo().getAccount())) {
            throw new GwolaBaseException("用户账户已经存在");
        }

        String userId = UUID.randomUserId();
        entity.setOfficeId(entity.getSysOffice().getId());
        entity.setUserId(userId);

        UserInfoEO userInfoEO = entity.getUserInfo();
        userInfoEO.setUserId(userId);
        userInfoEO.setType(UserInfoTypeEnum.MANAGER.getValue());
        userInfoEO.setPassword(PasswordUtils.encryptPassword(entity.getPassword()));

        UserContactInfoEO userContactInfoEO = userInfoEO.getUserContactInfo();
        userContactInfoEO.setUserId(userId);

        userInfoEOService.save(userInfoEO);
        userContactInfoEOService.save(userContactInfoEO);
        sysUserRoleEOService.saveSysUserRole(userId, entity.getRoleIdList());
        super.save(entity);

        return entity;
    }

    @Override
    public UserManagerEO update(UserManagerEO entity) {
        // 更新用户信息
        entity.getUserInfo().setPassword(entity.getPassword());
        userInfoEOService.updateUserInfoEO(entity.getUserInfo());
        super.update(entity);

        // 更新角色信息
        sysUserRoleEOService.deleteRoleWhereNotIn(entity.getUserId(), entity.getRoleIdList());
        sysUserRoleEOService.saveSysUserRole(entity.getUserId(), entity.getRoleIdList());

        return entity;
    }
}
