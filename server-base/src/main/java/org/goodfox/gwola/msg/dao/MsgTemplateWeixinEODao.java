package org.goodfox.gwola.msg.dao;

import org.goodfox.gwola.msg.entity.MsgTemplateWeixinEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;
import javax.persistence.EntityManager;
import java.util.HashMap;
import java.util.Map;

@Component
public class MsgTemplateWeixinEODao extends BaseRepositoryImpl<MsgTemplateWeixinEO, String> {

    @Autowired
    public MsgTemplateWeixinEODao (EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(MsgTemplateWeixinEO.class, entityManager), entityManager);
    }

    
}