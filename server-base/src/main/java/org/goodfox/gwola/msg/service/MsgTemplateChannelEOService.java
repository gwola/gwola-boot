package org.goodfox.gwola.msg.service;

import org.goodfox.gwola.msg.entity.MsgChannelEO;
import org.goodfox.gwola.msg.entity.MsgTemplateChannelEO;
import org.goodfox.gwola.msg.dao.MsgTemplateChannelEODao;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.msg.dao.MsgTemplateChannelEODao;
import org.goodfox.gwola.msg.entity.MsgChannelEO;
import org.goodfox.gwola.msg.entity.MsgTemplateChannelEO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MsgTemplateChannelEOService extends CrudService<MsgTemplateChannelEODao, MsgTemplateChannelEO, String> {


    public List<String> listChannelIdByTemplateId(String templateId) {
        return dao.listChannelIdByTemplateId(templateId);
    }

    public List<MsgChannelEO> listChannelByTemplateId(String templateId) {
        return dao.listChannelByTemplateId(templateId);
    }

    public void deleteByTemplateId(String templateId) {
        dao.deleteByTemplateId(templateId);
    }

    public void save(List<String> channelIdList, String templateId) {
        for(String channelId: channelIdList) {
            MsgTemplateChannelEO msgTemplateChannelEO = new MsgTemplateChannelEO();
            msgTemplateChannelEO.setChannelId(channelId);
            msgTemplateChannelEO.setTemplateId(templateId);
            this.save(msgTemplateChannelEO);
        }
    }

}