package org.goodfox.gwola.msg.dao;

import org.goodfox.gwola.msg.entity.MsgMessageUserEO;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;
import javax.persistence.EntityManager;
import java.util.HashMap;
import java.util.Map;

@Component
public class MsgMessageUserEODao extends BaseRepositoryImpl<MsgMessageUserEO, String> {

    @Autowired
    public MsgMessageUserEODao (EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(MsgMessageUserEO.class, entityManager), entityManager);
    }

    
}