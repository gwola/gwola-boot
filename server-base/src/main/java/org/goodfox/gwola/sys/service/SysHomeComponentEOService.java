package org.goodfox.gwola.sys.service;

import org.goodfox.gwola.sys.entity.SysHomeComponentEO;
import org.goodfox.gwola.sys.dao.SysHomeComponentEODao;
import org.goodfox.gwola.sys.entity.SysRoleComponentEO;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.sys.dao.SysHomeComponentEODao;
import org.goodfox.gwola.sys.entity.SysHomeComponentEO;
import org.goodfox.gwola.sys.entity.SysRoleComponentEO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysHomeComponentEOService extends CrudService<SysHomeComponentEODao, SysHomeComponentEO, Integer> {

    @Autowired
    private SysRoleComponentEOService sysRoleComponentEOService;

    public List<SysHomeComponentEO> listAll() {
        return dao.listAll();
    }

    public List<String> listByRoleId(String roleId) {
        return dao.listByRoleId(roleId);
    }

    public List<SysHomeComponentEO> listByUserId(String userId) {
        return dao.listByUserId(userId);
    }

    public void save(String roleId, List<String> componentIdList) {
        sysRoleComponentEOService.deleteByRoleId(roleId);

        for (String componentId: componentIdList) {
            SysRoleComponentEO sysRoleComponentEO = new SysRoleComponentEO();
            sysRoleComponentEO.setRoleId(roleId);
            sysRoleComponentEO.setComponentId(componentId);
            sysRoleComponentEOService.save(sysRoleComponentEO);
        }
    }
}