package org.goodfox.gwola.sys.dao;

import org.goodfox.gwola.baseInfo.entity.BaseTemplateEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.goodfox.gwola.baseInfo.entity.BaseTemplateEO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import java.util.List;

@Component
public class BaseTemplateEODao extends BaseRepositoryImpl<BaseTemplateEO, String> {

    @Autowired
    public BaseTemplateEODao(EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(BaseTemplateEO.class, entityManager), entityManager);
    }

    public List<BaseTemplateEO> list(String templateTypeCode) {
        return list("from BaseTemplateEO where code = ?1 order by isDefault desc", templateTypeCode);
    }

    public  long count(String templateTypeCode) {
        return executeGet("select count(1) from BaseTemplateEO where code = ?1", templateTypeCode);
    }
}