package org.goodfox.gwola.notify.service.impl;

import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.msg.entity.MsgTemplateEO;
import org.goodfox.gwola.msg.service.MsgTemplateEOService;
import org.goodfox.gwola.notify.bean.MessageTargetTypeEnum;
import org.goodfox.gwola.notify.service.IMessageSender;
import org.goodfox.gwola.notify.service.sender.IMessageSenderFactory;
import org.goodfox.gwola.notify.service.IMessageSenderService;
import org.goodfox.gwola.notify.service.base.EmailService;
import org.goodfox.gwola.notify.service.base.SmsService;
import org.goodfox.gwola.notify.utils.MessageUtils;
import org.goodfox.gwola.util.utils.CollectionUtils;
import org.goodfox.gwola.util.utils.StringUtils;
import org.goodfox.gwola.util.utils.UUID;
import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.msg.entity.MsgTemplateEO;
import org.goodfox.gwola.msg.service.MsgTemplateEOService;
import org.goodfox.gwola.notify.bean.MessageTargetTypeEnum;
import org.goodfox.gwola.notify.service.IMessageSender;
import org.goodfox.gwola.notify.service.IMessageSenderService;
import org.goodfox.gwola.notify.service.base.EmailService;
import org.goodfox.gwola.notify.service.base.SmsService;
import org.goodfox.gwola.util.utils.StringUtils;
import org.goodfox.gwola.util.utils.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 简单消息发送实现，线程同步发送
 */
@Service
public class SimpleMessageSenderServiceImpl implements IMessageSenderService {

    private ExecutorService executorService = Executors.newFixedThreadPool(10);

    @Autowired
    private EmailService emailService;

    @Autowired
    private SmsService smsService;

    @Autowired
    private MsgTemplateEOService msgTemplateEOService;

    @Override
    public void sendEmail(String email, String title, String content) {
        executorService.execute(new Thread(() -> emailService.sendEmail(email, title, content)));
    }

    @Override
    public void sendSMS(String mobile, String content) {
        executorService.execute(new Thread(() -> smsService.sendSms(mobile, content)));
    }

    @Override
    public void sendWebSocket() {
        // TODO
    }

    @Override
    public void sendMessage(String userId, String templateId, Map<String, Object> placeholderMap) {
       this.sendMessage(Arrays.asList(userId), templateId, placeholderMap);
    }

    @Override
    public void sendMessage(List<String> userIdList, String templateId, Map<String, Object> placeholderMap) {
        Assert.isTrue(StringUtils.isNotEmpty(templateId), "消息模板编号不能为空");
        MsgTemplateEO msgTemplateEO = msgTemplateEOService.get(templateId);
        Assert.isTrue(msgTemplateEO != null, "消息模板不存在");

        MsgMessageEO msgMessageEO = new MsgMessageEO();
        msgMessageEO.setMessageId(UUID.randomUUID());
        msgMessageEO.setContent(MessageUtils.fillMessageTemplate(msgTemplateEO.getContent(), placeholderMap));
        msgMessageEO.setSendTime(new Date());
        msgMessageEO.setTargetType(MessageTargetTypeEnum.TO_USER.getValue());
        msgMessageEO.setTemplateId(msgTemplateEO.getTemplateId());
        msgMessageEO.setTitle(MessageUtils.fillMessageTemplate(msgTemplateEO.getTitle(), placeholderMap));

        // 发送消息
        if (CollectionUtils.isNotEmpty(msgTemplateEO.getChannelIdList())) {
            for (String chanelId : msgTemplateEO.getChannelIdList()) {
                IMessageSender iMessageSender = IMessageSenderFactory.instance(chanelId);
                iMessageSender.send(userIdList, msgMessageEO);
            }
        }
    }

    @Override
    public void sendMessageByRoleId(List<String> roleIdList, String templateId, Map<String, Object> placeholderMap) {
        // TODO
    }

    @Override
    public void sendMessageByOfficeId(List<String> officeIdList, String templateId, Map<String, Object> placeholderMap) {
        // TODO
    }
}
