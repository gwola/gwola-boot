package org.goodfox.gwola.notify.service.sender;

import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.notify.dao.UserContactInfoDao;
import org.goodfox.gwola.notify.service.IMessageSender;
import org.goodfox.gwola.notify.service.base.SmsService;
import org.goodfox.gwola.user.entity.UserContactInfoEO;
import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.notify.dao.UserContactInfoDao;
import org.goodfox.gwola.notify.service.IMessageSender;
import org.goodfox.gwola.notify.service.base.SmsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Service
public class SmsMessageSender implements IMessageSender {

    private static Logger logger = LoggerFactory.getLogger(SmsMessageSender.class);

    private ExecutorService executorService = Executors.newFixedThreadPool(10);

    @Autowired
    private SmsService smsService;

    @Autowired
    private UserContactInfoDao userContactInfoDao;

    @Override
    public void send(List<String> userIdList, MsgMessageEO msgMessageEO) {
        List<UserContactInfoEO> userContactInfoList = userContactInfoDao.listUserContractInfo(userIdList);
        for (UserContactInfoEO userContactInfoEO : userContactInfoList) {
            executorService.execute(new Thread(() -> smsService.sendSms(userContactInfoEO.getMobile(), msgMessageEO.getContent())));
        }
    }
}
