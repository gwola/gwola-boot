package org.goodfox.gwola.sys.dao;

import org.goodfox.gwola.baseInfo.entity.BaseTemplateTypeEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.goodfox.gwola.baseInfo.entity.BaseTemplateTypeEO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;

@Component
public class BaseTemplateTypeEODao extends BaseRepositoryImpl<BaseTemplateTypeEO, String> {

    @Autowired
    public BaseTemplateTypeEODao(EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(BaseTemplateTypeEO.class, entityManager), entityManager);
    }

}