package org.goodfox.gwola.redis.dao;

import org.goodfox.gwola.sys.entity.SysEventEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;

@Component
public class SysEventEODao extends BaseRepositoryImpl<SysEventEO, String> {

    @Autowired
    public SysEventEODao(EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(SysEventEO.class, entityManager), entityManager);
    }

    public void updateEventStatus(String eventId, Integer status, String exception) {
        super.executeUpdate("update SysEventEO set status = ?1, exception = ?2 where eventId = ?3", status, exception, eventId);
    }

}