package org.goodfox.gwola.notify.service.sender;

import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.notify.dao.UserContactInfoDao;
import org.goodfox.gwola.notify.service.IMessageSender;
import org.goodfox.gwola.notify.service.base.EmailService;
import org.goodfox.gwola.user.entity.UserContactInfoEO;
import org.goodfox.gwola.util.exception.GwolaBaseException;
import org.goodfox.gwola.util.utils.BaseTemplateUtils;
import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.notify.dao.UserContactInfoDao;
import org.goodfox.gwola.notify.service.IMessageSender;
import org.goodfox.gwola.notify.service.base.EmailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Service
public class EmailMessageSender implements IMessageSender {

    private static Logger logger = LoggerFactory.getLogger(EmailMessageSender.class);

    private ExecutorService executorService = Executors.newFixedThreadPool(10);

    @Value("${mail.from.name}")
    private String fromName;

    @Autowired
    private EmailService emailService;

    @Autowired
    private UserContactInfoDao userContactInfoDao;

    @Override
    public void send(List<String> userIdList, MsgMessageEO msgMessageEO) {
        List<UserContactInfoEO> userContactInfoList = userContactInfoDao.listUserContractInfo(userIdList);
        for (UserContactInfoEO userContactInfoEO : userContactInfoList) {
            try {
                Map<String, Object> params = new HashMap<>();
                params.put("messageBody", msgMessageEO.getContent());
                params.put("companyName", fromName);
                String messageBody = BaseTemplateUtils.fillTemplateByCode("000", params);

                executorService.execute(new Thread(() -> emailService.sendEmail(userContactInfoEO.getEmail(), msgMessageEO.getTitle(), messageBody)));
            } catch (IOException e) {
                e.printStackTrace();
                throw new GwolaBaseException("模板填充失败");
            }
        }
    }

}
