package org.goodfox.gwola.sys.rest;

import org.goodfox.gwola.sys.entity.SysMenuEO;
import org.goodfox.gwola.sys.service.SysMenuEOService;
import org.goodfox.gwola.util.http.ResponseMessage;
import org.goodfox.gwola.util.http.Result;
import org.goodfox.gwola.util.utils.NumberUtils;
import org.goodfox.gwola.util.utils.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.goodfox.gwola.sys.entity.SysMenuEO;
import org.goodfox.gwola.util.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping(value = "/${restPath}/sys/menu")
@Api(description = "系统 - 菜单")
public class SysMenuEORestController {

    @Autowired
    private SysMenuEOService sysMenuEOService;


    @ApiOperation(value = "菜单详情")
    @GetMapping("/{id}")
    public ResponseMessage<SysMenuEO> getById(@PathVariable("id") String id) {
        return Result.success(sysMenuEOService.get(id));
    }

    @ApiOperation(value = "菜单列表")
    @GetMapping("")
    public ResponseMessage<List<SysMenuEO>> list(HttpServletRequest request) {
        return Result.success(sysMenuEOService.findAll());
    }

    @ApiOperation(value = "菜单树")
    @GetMapping(value = "/tree")
    public ResponseMessage<SysMenuEO> listAsTree() {
        SysMenuEO topSysMenu = sysMenuEOService.organizeListAsTree(sysMenuEOService.get("1"), sysMenuEOService.findAll());
        return Result.success(topSysMenu);
    }

    @ApiOperation(value = "新增菜单")
    @PostMapping("")
    public ResponseMessage<SysMenuEO> save(@RequestBody SysMenuEO sysMenuEO) {
        return Result.success(sysMenuEOService.save(sysMenuEO));
    }

    @ApiOperation(value = "新增菜单")
    @PostMapping("/{id}/sort")
    public ResponseMessage<SysMenuEO> save(@PathVariable("id") String id, String sort) {
        if (StringUtils.isEmpty(sort) && NumberUtils.isDigits(sort)) {
            return Result.error("排序号不能为空");
        }
        sysMenuEOService.updateSort(id, Integer.valueOf(sort));
        return Result.success();
    }

    @ApiOperation(value = "修改菜单")
    @PutMapping("")
    public ResponseMessage<SysMenuEO> update(@RequestBody SysMenuEO sysMenuEO) {
        return Result.success(sysMenuEOService.update(sysMenuEO));
    }

    @ApiOperation(value = "删除菜单")
    @DeleteMapping("/{id}")
    public ResponseMessage deleteById(@PathVariable("id") String id) {
        sysMenuEOService.deleteTreeEntity(id);
        return Result.success();
    }

}
