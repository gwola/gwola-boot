package org.goodfox.gwola.msg.service;

import org.goodfox.gwola.msg.bean.MsgMessageStatusEnum;
import org.goodfox.gwola.msg.entity.MsgMessageUserEO;
import org.goodfox.gwola.msg.dao.MsgMessageUserEODao;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.util.utils.CollectionUtils;
import org.goodfox.gwola.msg.bean.MsgMessageStatusEnum;
import org.goodfox.gwola.msg.dao.MsgMessageUserEODao;
import org.goodfox.gwola.msg.entity.MsgMessageUserEO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MsgMessageUserEOService extends CrudService<MsgMessageUserEODao, MsgMessageUserEO, String> {

    public void save(List<String> userIdList, String messageId) {
        if (CollectionUtils.isNotEmpty(userIdList)) {
            List<MsgMessageUserEO> msgMessageUserEOList = new ArrayList<>();
            for (String userId : userIdList) {
                MsgMessageUserEO msgMessageUserEO = new MsgMessageUserEO();
                msgMessageUserEO.setUserId(userId);
                msgMessageUserEO.setMessageId(messageId);
                msgMessageUserEO.setStatus(MsgMessageStatusEnum.UN_READ.getValue());
                msgMessageUserEOList.add(msgMessageUserEO);
            }
            this.save(msgMessageUserEOList);
        }
    }

}