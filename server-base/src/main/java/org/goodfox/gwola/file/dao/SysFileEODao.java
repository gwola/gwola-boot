package org.goodfox.gwola.file.dao;

import org.goodfox.gwola.sys.entity.SysFileEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;

@Component
public class SysFileEODao extends BaseRepositoryImpl<SysFileEO, String> {

    @Autowired
    public SysFileEODao(EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(SysFileEO.class, entityManager), entityManager);
    }

}