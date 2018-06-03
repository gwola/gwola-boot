package org.goodfox.gwola.sys.rest;

import org.goodfox.gwola.baseInfo.entity.BaseTemplateTypeEO;
import org.goodfox.gwola.sys.service.BaseTemplateTypeEOService;
import org.goodfox.gwola.util.http.PageInfo;
import org.goodfox.gwola.util.http.ResponseMessage;
import org.goodfox.gwola.util.http.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.goodfox.gwola.baseInfo.entity.BaseTemplateTypeEO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/${restPath}/base/templateType")
@Api(description = "系统模板类别")
public class BaseTemplateTypeEORestController {

    @Autowired
    private BaseTemplateTypeEOService baseTemplateTypeEOService;
    
    @ApiOperation(value = "系统模板类别列表")
    @GetMapping("")
    public ResponseMessage<List<BaseTemplateTypeEO>> list(Integer pageNo, Integer pageSize) {
        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        return Result.success(baseTemplateTypeEOService.findAll());
    }

}
