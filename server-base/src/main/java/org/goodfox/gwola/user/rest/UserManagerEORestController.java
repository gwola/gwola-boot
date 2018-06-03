package org.goodfox.gwola.user.rest;

import org.goodfox.gwola.user.bean.ManageUserQueryCondition;
import org.goodfox.gwola.user.bean.UserQueryCondition;
import org.goodfox.gwola.user.entity.UserManagerEO;
import org.goodfox.gwola.user.service.UserManagerEOService;
import org.goodfox.gwola.util.http.PageInfo;
import org.goodfox.gwola.util.http.ResponseMessage;
import org.goodfox.gwola.util.http.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.goodfox.gwola.user.bean.ManageUserQueryCondition;
import org.goodfox.gwola.user.entity.UserManagerEO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

@RestController
@RequestMapping(value = "/${restPath}/user/manager")
@Api(description = "管理用户")
public class UserManagerEORestController {

    @Autowired
    private UserManagerEOService userManagerEOService;

    @ApiOperation(value = "管理用户详情")
    @GetMapping("/{id}")
    public ResponseMessage<UserManagerEO> getById(@PathVariable("id") String id) {
        return Result.success(userManagerEOService.get(id));
    }

    @ApiOperation(value = "管理用户列表")
    @GetMapping("")
    public ResponseMessage<PageInfo<UserManagerEO>> list(@ModelAttribute ManageUserQueryCondition userQueryCondition) {
        return Result.success(userManagerEOService.page(userQueryCondition));
    }

    @ApiOperation(value = "新增管理用户")
    @PostMapping("")
    public ResponseMessage<UserManagerEO> save(@RequestBody UserManagerEO sysMenuEO) {
        return Result.success(userManagerEOService.save(sysMenuEO));
    }

    @ApiOperation(value = "修改管理用户")
    @PutMapping("")
    public ResponseMessage<UserManagerEO> update(@RequestBody UserManagerEO sysMenuEO) {
        return Result.success(userManagerEOService.update(sysMenuEO));
    }

    @ApiOperation(value = "删除管理用户")
    @DeleteMapping("/{id}")
    public ResponseMessage deleteById(@PathVariable("id") String id) {
        userManagerEOService.delete(id);
        return Result.success();
    }

}
