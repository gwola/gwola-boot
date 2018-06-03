package org.goodfox.gwola.sys.service;

import org.goodfox.gwola.sys.entity.SysRoleComponentEO;
import org.goodfox.gwola.sys.dao.SysRoleComponentEODao;
import org.goodfox.gwola.util.service.CrudService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysRoleComponentEOService extends CrudService<SysRoleComponentEODao, SysRoleComponentEO, Integer> {

    public void deleteByRoleId(String roleId) {
        dao.deleteByRoleId(roleId);
    }

}