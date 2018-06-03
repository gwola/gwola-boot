package org.goodfox.gwola.msg.dao;

import org.goodfox.gwola.msg.bean.MsgMessageStatusEnum;
import org.goodfox.gwola.msg.entity.MsgTemplateEO;
import org.goodfox.gwola.util.http.PageInfo;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.goodfox.gwola.util.utils.StringUtils;
import org.goodfox.gwola.util.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.JpaEntityInformationSupport;
import org.springframework.stereotype.Component;
import javax.persistence.EntityManager;
import java.util.HashMap;
import java.util.Map;

@Component
public class MsgTemplateEODao extends BaseRepositoryImpl<MsgTemplateEO, String> {

    @Autowired
    public MsgTemplateEODao (EntityManager entityManager) {
        super(JpaEntityInformationSupport.getEntityInformation(MsgTemplateEO.class, entityManager), entityManager);
    }

    public PageInfo<MsgTemplateEO> page(PageInfo pageInfo, String likeName, String type) {
        Map<String, Object> paramMap = new HashMap<>();
        StringBuilder hql = new StringBuilder();
        hql.append(" from MsgTemplateEO m where 1=1 ");


        if (StringUtils.isNotEmpty(likeName)) {
            hql.append(" and ( templateId like :likeName or title like :likeName or content like :likeName )");
            paramMap.put("likeName", "%" + likeName + "%");
        }

        if (StringUtils.isNotEmpty(type)) {
            hql.append(" and msgType.msgTypeCode = :type");
            paramMap.put("type", type);
        }

        // 排序
        hql.append(" order by templateId asc");

        return executePage(pageInfo, hql.toString(), paramMap);
    }
}