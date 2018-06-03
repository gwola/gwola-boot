package org.goodfox.gwola.msg.service;

import org.goodfox.gwola.msg.entity.MsgTemplateEO;
import org.goodfox.gwola.msg.dao.MsgTemplateEODao;
import org.goodfox.gwola.util.http.PageInfo;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.msg.dao.MsgTemplateEODao;
import org.goodfox.gwola.msg.entity.MsgTemplateEO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MsgTemplateEOService extends CrudService<MsgTemplateEODao, MsgTemplateEO, String> {

    @Autowired
    private MsgTemplateChannelEOService msgTemplateChannelEOService;

    public PageInfo<MsgTemplateEO> page(PageInfo pageInfo, String likeName, String type) {
        return dao.page(pageInfo, likeName, type);
    }

    @Override
    public MsgTemplateEO save(MsgTemplateEO entity) {
        MsgTemplateEO msgTemplateEO = super.save(entity);
        msgTemplateChannelEOService.save(entity.getChannelIdList(), entity.getTemplateId());
        return msgTemplateEO;
    }

    @Override
    public MsgTemplateEO update(MsgTemplateEO entity) {
        msgTemplateChannelEOService.deleteByTemplateId(entity.getTemplateId());
        msgTemplateChannelEOService.save(entity.getChannelIdList(), entity.getTemplateId());
        return super.update(entity);
    }

    @Override
    public MsgTemplateEO get(String s) {
        MsgTemplateEO msgTemplateEO = super.get(s);
        msgTemplateEO.setChannelIdList(msgTemplateChannelEOService.listChannelIdByTemplateId(s));
        return msgTemplateEO;
    }
}