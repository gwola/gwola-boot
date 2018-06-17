package io.gwola.boot.controller.manage;

import io.gwola.boot.common.utils.PageUtil;
import io.gwola.boot.common.utils.ResultUtil;
import io.gwola.boot.common.vo.PageVo;
import io.gwola.boot.common.vo.Result;
import io.gwola.boot.entity.Log;
import io.gwola.boot.service.LogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;


/**
 * 拥有ROLE_ADMIN角色的用户可以访问
 * @author Exrickx
 */
@Slf4j
@RestController
@Api(description = "日志管理接口")
@RequestMapping("${gwola.restPath}/log")
public class LogController{

    @Autowired
    private LogService logService;

    @RequestMapping(value = "/getAllByPage",method = RequestMethod.GET)
    @ApiOperation(value = "分页获取全部")
    public Result<Object> getAllByPage(@ModelAttribute PageVo pageVo){
        Page<Log> log = logService.findAll(PageUtil.initPage(pageVo));
        return new ResultUtil<Object>().setData(log);
    }

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    @ApiOperation(value = "分页搜索")
    public Result<Object> search(@RequestParam String key, @ModelAttribute PageVo pageVo){
        Page<Log> log = logService.searchLog(key, PageUtil.initPage(pageVo));
        return new ResultUtil<Object>().setData(log);
    }

    @RequestMapping(value = "/delByIds",method = RequestMethod.DELETE)
    @ApiOperation(value = "批量删除")
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            logService.delete(id);
        }
        return new ResultUtil<Object>().setSuccessMsg("删除成功");
    }

    @RequestMapping(value = "/delAll",method = RequestMethod.DELETE)
    @ApiOperation(value = "全部删除")
    public Result<Object> delAll(){
        logService.deleteAll();
        return new ResultUtil<Object>().setSuccessMsg("删除成功");
    }
}