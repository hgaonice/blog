package com.gaoh.modules.sys.controller;

import com.gaoh.base.AbstractController;
import com.gaoh.common.Result;
import com.gaoh.common.util.PageUtils;
import com.gaoh.common.validator.ValidatorUtils;
import com.gaoh.entity.manage.sys.SysParam;
import com.gaoh.modules.sys.service.SysParamService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 系统参数 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2018-12-28
 */
@RestController
@Slf4j
@Api(tags = "系统参数管理")
@RequestMapping("/admin/sys/param")
public class SysParamController extends AbstractController {
    @Autowired
    private SysParamService paramService;

    /**
     * 列表
     */
    @GetMapping("/list")
    @ApiOperation("获取参数列表")
    @RequiresPermissions("sys:param:list")
    public Result list(@RequestParam Map<String, Object> params){
        PageUtils page = paramService.queryPage(params);

        return Result.ok().put("page", page);
    }

    /**
     * 获取所有参数
     */
    @GetMapping("/all")
    @ApiOperation("获取所有参数")
    public Result listAll(){
        List<SysParam> sysParamList = paramService.list(null);
        return Result.ok().put("sysParamList",sysParamList);
    }


    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    @ApiOperation("获取参数明细")
    @RequiresPermissions("sys:param:info")
    public Result info(@PathVariable("id") String id){
       SysParam param = paramService.getById(id);

        return Result.ok().put("param", param);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    @ApiOperation("保存参数")
    @RequiresPermissions("sys:param:save")
    public Result save(@RequestBody SysParam param){
        ValidatorUtils.validateEntity(param);
        paramService.save(param);

        return Result.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    @ApiOperation("修改参数")
    @RequiresPermissions("sys:param:update")
    public Result update(@RequestBody SysParam param){
        ValidatorUtils.validateEntity(param);
        paramService.updateById(param);
        return Result.ok();
    }

    /**
     * 删除
     */
    @ApiOperation("删除参数")
    @DeleteMapping("/delete")
    @RequiresPermissions("sys:param:delete")
    public Result delete(@RequestBody String[] ids){
        paramService.removeByIds(Arrays.asList(ids));

        return Result.ok();
    }
}
