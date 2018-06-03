package org.goodfox.gwola.notify.service.sender;

import org.goodfox.gwola.notify.service.IMessageSender;
import org.goodfox.gwola.notify.service.sender.EmailMessageSender;
import org.goodfox.gwola.notify.service.sender.SmsMessageSender;
import org.goodfox.gwola.notify.service.sender.SystemMessageSender;
import org.goodfox.gwola.notify.service.sender.WeixinMessageSender;
import org.goodfox.gwola.util.exception.GwolaBaseException;
import org.goodfox.gwola.util.utils.SpringContextHolder;
import org.goodfox.gwola.notify.service.IMessageSender;
import org.goodfox.gwola.util.utils.SpringContextHolder;

public class IMessageSenderFactory {

    public static IMessageSender instance(String msgChannelId) {
        if (msgChannelId == null) {
            throw new GwolaBaseException("渠道编号不能为空");
        }

        Class clazz = null;
        if ("1".equals(msgChannelId)) {
            clazz = SystemMessageSender.class;
        } else if ("2".equals(msgChannelId)) {
            clazz = SystemMessageSender.class;
        } else if ("3".equals(msgChannelId)) {
            clazz = SmsMessageSender.class;
        } else if ("4".equals(msgChannelId)) {
            clazz = EmailMessageSender.class;
        } else if ("5".equals(msgChannelId)) {
            clazz = WeixinMessageSender.class;
        }
        if (clazz == null) {
            throw new GwolaBaseException("找不到渠道[" + msgChannelId + "]对应的处理器类");
        }

        IMessageSender iMessageSender = (IMessageSender) SpringContextHolder.getBean(clazz);
        if (iMessageSender == null) {
            throw new GwolaBaseException("找不到渠道[" + msgChannelId + "]对应的处理器类");
        }
        return iMessageSender;
    }

}
