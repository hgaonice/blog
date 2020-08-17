package org.gaoh.modules.operation.controller;

import org.gaoh.common.Result;
import org.gaoh.common.constants.RedisCacheNames;
import org.gaoh.common.util.PageUtils;
import org.gaoh.common.validator.ValidatorUtils;
import org.gaoh.modules.base.AbstractController;
import org.gaoh.modules.entity.manage.operation.Recommend;
import org.gaoh.modules.entity.manage.operation.vo.RecommendVO;
import org.gaoh.modules.operation.service.RecommendService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 推荐 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2019-02-22
 */
@RestController
@RequestMapping("/admin/operation/recommend")
@Api(tags = "推荐管理")
@CacheConfig(cacheNames = RedisCacheNames.RECOMMEND)
public class RecommendController extends AbstractController {
    @Resource
    private RecommendService recommendService;

    /**
     * 列表
     */
    @ApiOperation("获取推荐列表")
    @GetMapping("/list")
    @RequiresPermissions("operation:recommend:list")
    public Result list(@RequestParam Map<String, Object> params){
        PageUtils page = recommendService.queryPage(params);

        return Result.ok().put("page", page);
    }

    @GetMapping("/select")
    @ApiOperation("获取推荐信息")
    @RequiresPermissions("operation:recommend:list")
    public Result select () {
        List<RecommendVO> recommendList = recommendService.listSelect();
        return Result.ok().put("recommendList",recommendList);
    }


    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    @ApiOperation("获取推荐明细")
    @RequiresPermissions("operation:recommend:info")
    public Result info(@PathVariable("id") String id){
       Recommend recommend = recommendService.getById(id);

        return Result.ok().put("recommend", recommend);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    @ApiOperation("保存推荐信息")
    @RequiresPermissions("operation:recommend:save")
    @CacheEvict(allEntries = true)
    public Result save(@RequestBody Recommend recommend){
        ValidatorUtils.validateEntity(recommend);
        recommendService.save(recommend);

        return Result.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    @ApiOperation("修改推荐信息")
    @RequiresPermissions("operation:recommend:update")
    @CacheEvict(allEntries = true)
    public Result update(@RequestBody Recommend recommend){
        ValidatorUtils.validateEntity(recommend);
        recommendService.updateById(recommend);
        return Result.ok();
    }

    @PutMapping("/top/{id}")
    @ApiOperation("修改推荐信息")
    @RequiresPermissions("operation:recommend:update")
    @CacheEvict(allEntries = true)
    public Result updateTop (@PathVariable Integer id) {
        recommendService.updateTop(id);
        return Result.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    @ApiOperation("批量删除推荐信息")
    @RequiresPermissions("operation:recommend:delete")
    @CacheEvict(allEntries = true)
    public Result delete(@RequestBody String[] ids){
        recommendService.removeByIds(Arrays.asList(ids));

        return Result.ok();
    }
}
