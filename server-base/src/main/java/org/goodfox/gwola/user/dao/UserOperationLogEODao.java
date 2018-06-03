package org.goodfox.gwola.user.dao;

import org.goodfox.gwola.user.entity.UserOperationLogEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;

@Component
public class UserOperationLogEODao extends BaseRepositoryImpl<UserOperationLogEO, String> {

    @Autowired
    public UserOperationLogEODao(EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(UserOperationLogEO.class, entityManager), entityManager);
    }

}