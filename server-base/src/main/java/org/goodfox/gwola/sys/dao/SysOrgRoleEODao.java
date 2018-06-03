package org.goodfox.gwola.sys.dao;

import org.goodfox.gwola.sys.entity.SysOrgRoleEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;

@Component
public class SysOrgRoleEODao extends BaseRepositoryImpl<SysOrgRoleEO, String> {

    @Autowired
    public SysOrgRoleEODao(EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(SysOrgRoleEO.class, entityManager), entityManager);
    }

}