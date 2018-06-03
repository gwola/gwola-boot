package org.goodfox.gwola.notify.service.sender;

import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.notify.service.IMessageSender;
import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.notify.service.IMessageSender;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WeixinMessageSender implements IMessageSender {

    private static Logger logger = LoggerFactory.getLogger(WeixinMessageSender.class);

    @Override
    public void send(List<String> userIdList, MsgMessageEO msgMessageEO) {

    }
}
