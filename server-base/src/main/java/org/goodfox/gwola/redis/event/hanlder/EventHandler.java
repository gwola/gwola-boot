package org.goodfox.gwola.redis.event.hanlder;


import org.goodfox.gwola.redis.bean.EventBean;
import org.goodfox.gwola.redis.bean.EventBean;

public interface EventHandler {

    /**
     * 处理消息
     * @param eventBean
     */
    void handler(EventBean eventBean);
}
