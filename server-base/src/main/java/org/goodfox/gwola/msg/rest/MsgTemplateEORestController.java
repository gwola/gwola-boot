package org.goodfox.gwola.msg.rest;

import org.goodfox.gwola.msg.entity.MsgChannelEO;
import org.goodfox.gwola.msg.entity.MsgTemplateEO;
import org.goodfox.gwola.msg.entity.MsgTypeEO;
import org.goodfox.gwola.msg.service.MsgChannelEOService;
import org.goodfox.gwola.msg.service.MsgTemplateEOService;
import org.goodfox.gwola.msg.service.MsgTypeEOService;
import org.goodfox.gwola.util.http.PageInfo;
import org.goodfox.gwola.util.http.ResponseMessage;
import org.goodfox.gwola.util.http.Result;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Api;
import org.goodfox.gwola.msg.entity.MsgChannelEO;
import org.goodfox.gwola.msg.entity.MsgTemplateEO;
import org.goodfox.gwola.msg.entity.MsgTypeEO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;
import java.util.List;

@RestController
@RequestMapping(value = "/${restPath}/msg/template")
@Api(description = "系统消息模板")
public class MsgTemplateEORestController {

    @Autowired
    private MsgTemplateEOService msgTemplateEOService;

    @Autowired
    private MsgTypeEOService msgTypeEOService;

    @Autowired
    private MsgChannelEOService msgChannelEOService;

    @ApiOperation(value = "系统消息模板详情")
    @GetMapping("/{id}")
    public ResponseMessage<MsgTemplateEO> get(@PathVariable("id") String id) {
        return Result.success(msgTemplateEOService.get(id));
    }

    @ApiOperation(value = "系统消息模板列表")
    @GetMapping("")
    public ResponseMessage<PageInfo<MsgTemplateEO>> list(HttpServletRequest request, String likeName, String type) {
        PageInfo pageInfo = new PageInfo(request);
        return Result.success(msgTemplateEOService.page(pageInfo, likeName, type));
    }

    @ApiOperation(value = "新增系统消息模板")
    @PostMapping("")
    public ResponseMessage<MsgTemplateEO> save(@RequestBody MsgTemplateEO msgTemplateEO) {
        return Result.success(msgTemplateEOService.save(msgTemplateEO));
    }

    @ApiOperation(value = "修改系统消息模板")
    @PutMapping("")
    public ResponseMessage<MsgTemplateEO> update(@RequestBody MsgTemplateEO msgTemplateEO) {
        return Result.success(msgTemplateEOService.update(msgTemplateEO));
    }

    @ApiOperation(value = "删除系统消息模板")
    @DeleteMapping("/{id}")
    public ResponseMessage delete(@PathVariable("id") String id) {
        msgTemplateEOService.delete(id);
        return Result.success();
    }

    @ApiOperation(value = "系统消息类型列表")
    @GetMapping("/type")
    public ResponseMessage<List<MsgTypeEO>> listMsgType() {
        return Result.success(msgTypeEOService.findAll());
    }

    @ApiOperation(value = "系统消息类型列表")
    @GetMapping("/channel")
    public ResponseMessage<List<MsgChannelEO>> listMsgChannel() {
        return Result.success(msgChannelEOService.findAll());
    }
}