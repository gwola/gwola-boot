package org.goodfox.gwola.msg.service;

import org.goodfox.gwola.msg.bean.MsgMessageStatusEnum;
import org.goodfox.gwola.msg.bean.MsgMessageVO;
import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.msg.dao.MsgMessageEODao;
import org.goodfox.gwola.msg.entity.MsgMessageUserEO;
import org.goodfox.gwola.util.http.PageInfo;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.msg.bean.MsgMessageStatusEnum;
import org.goodfox.gwola.msg.bean.MsgMessageVO;
import org.goodfox.gwola.msg.dao.MsgMessageEODao;
import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.msg.entity.MsgMessageUserEO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MsgMessageEOService extends CrudService<MsgMessageEODao, MsgMessageEO, String> {

    @Autowired
    private MsgMessageUserEOService msgMessageUserEOService;

    public PageInfo<MsgMessageVO> pageByUserId(PageInfo pageInfo, String userId, String status) {
        PageInfo<MsgMessageVO> page = dao.pageByUserId(pageInfo, userId, status);
        page.getExt().put("totalCount", totalCount(userId));
        page.getExt().put("unReadCount", totalUnReadCount(userId));
        return page;
    }

    public void markAsRead(List<String> messageIdList, String userId) {
        List<MsgMessageUserEO> msgMessageUserEOList = new ArrayList<>();
        for (String messageId: messageIdList) {
            MsgMessageUserEO msgMessageUserEO = new MsgMessageUserEO();
            msgMessageUserEO.setMessageId(messageId);
            msgMessageUserEO.setUserId(userId);
            msgMessageUserEO.setStatus(MsgMessageStatusEnum.HAS_READ.getValue());
            msgMessageUserEOList.add(msgMessageUserEO);
        }
        msgMessageUserEOService.save(msgMessageUserEOList);
    }

    public void markAsDelete(List<String> messageIdList, String userId) {
        List<MsgMessageUserEO> msgMessageUserEOList = new ArrayList<>();
        for (String messageId: messageIdList) {
            MsgMessageUserEO msgMessageUserEO = new MsgMessageUserEO();
            msgMessageUserEO.setMessageId(messageId);
            msgMessageUserEO.setUserId(userId);
            msgMessageUserEO.setStatus(MsgMessageStatusEnum.DELETED.getValue());
            msgMessageUserEOList.add(msgMessageUserEO);
        }
        msgMessageUserEOService.save(msgMessageUserEOList);
    }

    public void markAllAsRead(String userId) {
        dao.markAllAsRead(userId);
    }

    public void markAllAsDelete(String userId) {
        dao.markAllAsDelete(userId);
    }

    public Long totalCount (String userId) {
        return dao.totalCount(userId);
    }

    public Long totalUnReadCount (String userId) {
        return dao.totalUnReadCount(userId);
    }
}