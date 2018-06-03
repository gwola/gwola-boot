package org.goodfox.gwola.user.dao;

import org.goodfox.gwola.user.entity.DictUserOperateEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;

@Component
public class DictUserOperateEODao extends BaseRepositoryImpl<DictUserOperateEO, String> {

    @Autowired
    public DictUserOperateEODao(EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(DictUserOperateEO.class, entityManager), entityManager);
    }

}