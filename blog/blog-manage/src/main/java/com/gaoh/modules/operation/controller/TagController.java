package com.gaoh.modules.operation.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.gaoh.base.AbstractController;
import com.gaoh.common.Result;
import com.gaoh.common.constants.RedisCacheNames;
import com.gaoh.common.enums.ModuleEnum;
import com.gaoh.common.util.PageUtils;
import com.gaoh.common.validator.ValidatorUtils;
import com.gaoh.entity.manage.operation.Tag;
import com.gaoh.entity.manage.operation.TagLink;
import com.gaoh.modules.operation.mapper.TagLinkMapper;
import com.gaoh.modules.operation.service.TagService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 标签 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2019-01-21
 */
@RestController
@CacheConfig(cacheNames = RedisCacheNames.TAG)
@RequestMapping("/admin/operation/tag")
@Api(tags = "标签管理")
public class TagController extends AbstractController {
    @Resource
    private TagService tagService;

    @Resource
    private TagLinkMapper tagLinkMapper;

    /**
     * 列表
     */
    @ApiOperation("获取标签列表")
    @GetMapping("/list")
    @RequiresPermissions("operation:tag:list")
    public Result list(@RequestParam Map<String, Object> params){
        PageUtils page = tagService.queryPage(params);

        return Result.ok().put("page", page);
    }

    @GetMapping("/select")
    @ApiOperation("获取标签信息")
    @RequiresPermissions("operation:tag:list")
    public Result select(@RequestParam("type") Integer type){
        List<Tag> tagList = tagService.list(new QueryWrapper<Tag>().lambda().eq(type != null,Tag::getType,type));
        return Result.ok().put("tagList",tagList);
    }


    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    @ApiOperation("获取标签明细")
    @RequiresPermissions("operation:tag:info")
    public Result info(@PathVariable("id") String id){
       Tag tag = tagService.getById(id);

        return Result.ok().put("tag", tag);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    @ApiOperation("保存标签信息")
    @RequiresPermissions("operation:tag:save")
    @CacheEvict(allEntries = true)
    public Result save(@RequestBody Tag tag){
        ValidatorUtils.validateEntity(tag);
        tagService.save(tag);

        return Result.ok();
    }

    /**
     * 修改
     */
    @ApiOperation("修改标签信息")
    @PutMapping("/update")
    @RequiresPermissions("operation:tag:update")
    @CacheEvict(allEntries = true)
    public Result update(@RequestBody Tag tag){
        ValidatorUtils.validateEntity(tag);
        tagService.updateById(tag);
        return Result.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    @ApiOperation("删除标签信息")
    @RequiresPermissions("operation:tag:delete")
    @CacheEvict(allEntries = true)
    public Result delete(@RequestBody String[] ids){
        for (String id : ids) {
            List<TagLink> tagLinkList = tagLinkMapper.selectList(new QueryWrapper<TagLink>().lambda().eq(TagLink::getTagId, id));
            if(!CollectionUtils.isEmpty(tagLinkList)) {
                TagLink tagLink = tagLinkList.get(0);
                if (tagLink.getType().equals(ModuleEnum.ARTICLE.getValue())) {
                    return Result.error("该标签下有文章，无法删除");
                }
                if (tagLink.getType().equals(ModuleEnum.BOOK.getValue())) {
                    return Result.error("该标签下有图书，无法删除");
                }
                if(tagLink.getType().equals(ModuleEnum.BOOK_NOTE.getValue())) {
                    return Result.error("该标签下有笔记，无法删除");
                }
            }
        }
        tagService.removeByIds(Arrays.asList(ids));

        return Result.ok();
    }
}
