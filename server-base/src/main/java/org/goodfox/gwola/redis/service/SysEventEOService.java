package org.goodfox.gwola.redis.service;


import org.goodfox.gwola.redis.bean.EventBean;
import org.goodfox.gwola.redis.bean.constant.EventStatusEnum;
import org.goodfox.gwola.redis.dao.SysEventEODao;
import org.goodfox.gwola.sys.entity.SysEventEO;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.util.utils.CollectionUtils;
import org.goodfox.gwola.util.utils.GsonUtil;
import org.goodfox.gwola.redis.bean.EventBean;
import org.goodfox.gwola.redis.bean.constant.EventStatusEnum;
import org.goodfox.gwola.redis.dao.SysEventEODao;
import org.springframework.stereotype.Service;

@Service
public class SysEventEOService extends CrudService<SysEventEODao, SysEventEO, String> {

    public void save(EventBean eventBean) {
        SysEventEO sysEventEO = new SysEventEO();
        sysEventEO.setEventId(eventBean.getEventId());
        sysEventEO.setEventCode(eventBean.getEventCode());
        sysEventEO.setEventName(eventBean.getEventName());
        if (CollectionUtils.isNotEmpty(eventBean.getEventParams())) {
            sysEventEO.setEventParam(GsonUtil.toJson(eventBean.getEventParams()));
        }
        if (eventBean.getEventBody() != null) {
            sysEventEO.setEventContent(GsonUtil.toJson(eventBean.getEventBody()));
        }
        sysEventEO.setCreateTime(eventBean.getCreateTime());
        sysEventEO.setStatus(EventStatusEnum.NOT_DONE.getValue());
        this.save(sysEventEO);
    }

    public void updateEventStatus(String eventId, Integer status, String exception) {
        dao.updateEventStatus(eventId, status, exception);
    }
}
