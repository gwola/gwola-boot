package org.goodfox.gwola.msg.rest;

import org.goodfox.gwola.base.utils.LoginUserUtils;
import org.goodfox.gwola.msg.bean.MsgMessageVO;
import org.goodfox.gwola.msg.entity.MsgMessageEO;
import org.goodfox.gwola.msg.service.MsgMessageEOService;
import org.goodfox.gwola.util.http.PageInfo;
import org.goodfox.gwola.util.http.ResponseMessage;
import org.goodfox.gwola.util.http.Result;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Api;
import org.goodfox.gwola.msg.bean.MsgMessageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping(value = "/${restPath}/msg/message")
@Api(description = "消息")
public class MsgMessageEORestController {

    @Autowired
    private MsgMessageEOService msgMessageEOService;

    @ApiOperation(value = "消息列表")
    @GetMapping("")
    public ResponseMessage<PageInfo<MsgMessageVO>> list(HttpServletRequest request, String status) {
        PageInfo<MsgMessageVO> msgMessageEOList = msgMessageEOService.pageByUserId(new PageInfo(request), LoginUserUtils.getLoginUserIdWithoutFlush(request), status);
        return Result.success(msgMessageEOList);
    }

    @ApiOperation(value = "将消息标为已读")
    @PutMapping("/read")
    public ResponseMessage markAsRead(HttpServletRequest request, String[] messageIdList) {
        msgMessageEOService.markAsRead(Arrays.asList(messageIdList), LoginUserUtils.getLoginUserId(request));
        return Result.success();
    }

    @ApiOperation(value = "将消息标为删除")
    @PutMapping("/delete")
    public ResponseMessage markAsDelete(HttpServletRequest request, String[] messageIdList) {
        msgMessageEOService.markAsDelete(Arrays.asList(messageIdList), LoginUserUtils.getLoginUserId(request));
        return Result.success();
    }

    @ApiOperation(value = "将消息标为已读")
    @PutMapping("/readAll")
    public ResponseMessage markAllAsRead(HttpServletRequest request) {
        msgMessageEOService.markAllAsRead(LoginUserUtils.getLoginUserId(request));
        return Result.success();
    }

    @ApiOperation(value = "将消息标为删除")
    @PutMapping("/deleteAll")
    public ResponseMessage markAllAsDelete(HttpServletRequest request) {
        msgMessageEOService.markAllAsDelete(LoginUserUtils.getLoginUserId(request));
        return Result.success();
    }

}