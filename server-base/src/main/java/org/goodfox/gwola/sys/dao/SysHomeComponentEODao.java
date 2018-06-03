package org.goodfox.gwola.sys.dao;

import org.goodfox.gwola.sys.entity.SysHomeComponentEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import java.util.List;

@Component
public class SysHomeComponentEODao extends BaseRepositoryImpl<SysHomeComponentEO, String> {

    @Autowired
    public SysHomeComponentEODao (EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(SysHomeComponentEO.class, entityManager), entityManager);
    }

    public List<SysHomeComponentEO> listAll() {
        return listAll();
    }

    public List<String> listByRoleId(String roleId) {
        return executeList("select distinct rc.componentId from SysRoleComponentEO rc where rc.roleId = ?1", roleId);
    }

    public List<SysHomeComponentEO> listByUserId(String userId) {
        return list("select distinct c from SysHomeComponentEO c, SysRoleComponentEO rc, SysUserRoleEO ur where c.componentId = rc.componentId and rc.roleId = ur.roleId and ur.userId = ?1", userId);
    }
    
}