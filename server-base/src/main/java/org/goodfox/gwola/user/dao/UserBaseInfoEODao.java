package org.goodfox.gwola.user.dao;

import org.goodfox.gwola.user.entity.UserBaseInfoEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;

@Component
public class UserBaseInfoEODao extends BaseRepositoryImpl<UserBaseInfoEO, String> {

    @Autowired
    public UserBaseInfoEODao(EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(UserBaseInfoEO.class, entityManager), entityManager);
    }

}