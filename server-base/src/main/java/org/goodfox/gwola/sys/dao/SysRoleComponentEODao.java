package org.goodfox.gwola.sys.dao;

import org.goodfox.gwola.sys.entity.SysRoleComponentEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;


@Component
public class SysRoleComponentEODao extends BaseRepositoryImpl<SysRoleComponentEO, String> {

    @Autowired
    public SysRoleComponentEODao(EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(SysRoleComponentEO.class, entityManager), entityManager);
    }


    public void deleteByRoleId(String roleId) {
        executeUpdate("delete from SysRoleComponentEO where roleId = ?1", roleId);
    }
}