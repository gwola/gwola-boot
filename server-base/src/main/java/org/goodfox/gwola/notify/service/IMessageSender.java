package org.goodfox.gwola.notify.service;

import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.msg.entity.MsgMessageEO;

import java.util.List;

public interface IMessageSender {

    void send(List<String> userIdList, MsgMessageEO msgMessageEO);

}
