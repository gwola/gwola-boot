package org.goodfox.gwola.sys.service;

import org.goodfox.gwola.sys.dao.SysUserRoleEODao;
import org.goodfox.gwola.sys.entity.SysUserRoleEO;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.util.utils.CollectionUtils;
import org.goodfox.gwola.sys.dao.SysUserRoleEODao;
import org.goodfox.gwola.sys.entity.SysUserRoleEO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysUserRoleEOService extends CrudService<SysUserRoleEODao, SysUserRoleEO, String> {

    public void saveSysUserRole(String userId, List<String> roleIdList) {
        if (CollectionUtils.isNotEmpty(roleIdList)) {
            for (String roleId : roleIdList) {
                saveSysUserRole(userId, roleId);
            }
        }
    }

    public void saveSysUserRole(String userId, String roleId) {
        SysUserRoleEO sysUserRoleEO = new SysUserRoleEO();
        sysUserRoleEO.setRoleId(roleId);
        sysUserRoleEO.setUserId(userId);
        super.save(sysUserRoleEO);
    }

    public void deleteRoleWhereNotIn(String userId, List<String> roleIdList) {
        dao.deleteRoleWhereNotIn(userId, roleIdList);
    }

}
