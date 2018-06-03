package org.goodfox.gwola.notify.service.sender;

import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.msg.service.MsgMessageEOService;
import org.goodfox.gwola.msg.service.MsgMessageUserEOService;
import org.goodfox.gwola.notify.service.IMessageSender;
import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.msg.service.MsgMessageEOService;
import org.goodfox.gwola.msg.service.MsgMessageUserEOService;
import org.goodfox.gwola.notify.service.IMessageSender;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SystemMessageSender implements IMessageSender {

    private static Logger logger = LoggerFactory.getLogger(SystemMessageSender.class);

    @Autowired
    private MsgMessageEOService msgMessageEOService;

    @Autowired
    private MsgMessageUserEOService msgMessageUserEOService;

    @Override
    public void send(List<String> userIdList, MsgMessageEO msgMessageEO) {
        msgMessageEOService.save(msgMessageEO);
        msgMessageUserEOService.save(userIdList, msgMessageEO.getMessageId());
    }
}
