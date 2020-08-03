package com.gaoh.modules.operation.controller;

import com.gaoh.common.Result;
import com.gaoh.base.AbstractController;
import com.gaoh.common.constants.RedisCacheNames;
import com.gaoh.common.util.PageUtils;
import com.gaoh.common.validator.ValidatorUtils;
import com.gaoh.entity.manage.operation.Link;
import com.gaoh.modules.operation.service.LinkService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Map;

/**
 * <p>
 * 友链 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2019-02-14
 */
@RestController
@RequestMapping("/admin/operation/link")
@CacheConfig(cacheNames = RedisCacheNames.LINK)
@Api(tags = "友情链接管理")
public class LinkController extends AbstractController {

    @Resource
    private LinkService linkService;

    /**
     * 列表
     */
    @GetMapping("/list")
    @ApiOperation("获取链接列表")
    @RequiresPermissions("operation:link:list")
    public Result list(@RequestParam Map<String, Object> params){
        PageUtils page = linkService.queryPage(params);

        return Result.ok().put("page", page);
    }


    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    @ApiOperation("获取链接明细")
    @RequiresPermissions("operation:link:info")
    public Result info(@PathVariable("id") String id){
       Link link = linkService.getById(id);

        return Result.ok().put("link", link);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    @ApiOperation("保存链接")
    @RequiresPermissions("operation:link:save")
    @CacheEvict(allEntries = true)
    public Result save(@RequestBody Link link){
        ValidatorUtils.validateEntity(link);
        linkService.save(link);

        return Result.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    @RequiresPermissions("operation:link:update")
    @ApiOperation("修改链接")
    @CacheEvict(allEntries = true)
    public Result update(@RequestBody Link link){
        ValidatorUtils.validateEntity(link);
        linkService.updateById(link);
        return Result.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    @ApiOperation("删除链接")
    @RequiresPermissions("operation:link:delete")
    @CacheEvict(allEntries = true)
    public Result delete(@RequestBody String[] ids){
        linkService.removeByIds(Arrays.asList(ids));

        return Result.ok();
    }
}
