package org.goodfox.gwola.sys.dao;

import org.goodfox.gwola.sys.entity.SysConfigTypeEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;

@Component
public class SysConfigTypeEODao extends BaseRepositoryImpl<SysConfigTypeEO, String> {

    @Autowired
    public SysConfigTypeEODao(EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(SysConfigTypeEO.class, entityManager), entityManager);
    }

}