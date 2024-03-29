package org.gaoh.modules.sys.controller;


import org.gaoh.common.Result;
import org.gaoh.common.enums.MenuTypeEnum;
import org.gaoh.common.exception.MyException;
import org.gaoh.modules.auth.service.ShiroService;
import org.gaoh.modules.base.AbstractController;
import org.gaoh.modules.entity.manage.sys.SysMenu;
import org.gaoh.modules.sys.service.SysMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 菜单管理 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2018-10-19
 */

@RestController
@RequestMapping("/admin/sys/menu")
@Api(tags = "菜单管理")
public class SysMenuController extends AbstractController {

    @Autowired
    private SysMenuService sysMenuService;

    @Autowired
    private ShiroService shiroService;

    @GetMapping("/nav")
    @ApiOperation("获取导航菜单信息")
    public Result nav(){
        List<SysMenu> menuList=sysMenuService.listUserMenu(getUserId());
        Set<String> permissions=shiroService.getUserPermissions(getUserId());
        return Result.ok().put("menuList",menuList).put("permissions",permissions);
    }

    /**
     * 所有菜单列表
     */
    @GetMapping("/list")
    @ApiOperation("获取菜单列表")
    @RequiresPermissions("sys:menu:list")
    public List<SysMenu> list(){
        List<SysMenu> menuList = sysMenuService.list(null);
        menuList.forEach(sysMenu -> {
            SysMenu parentMenu = sysMenuService.getById(sysMenu.getParentId());
            if(parentMenu != null){
                sysMenu.setParentName(parentMenu.getName());
            }
        });
        return menuList;
    }

    /**
     * 选择菜单(添加、修改菜单)
     */
    @GetMapping("/select")
    @ApiOperation("选择菜单(添加、修改菜单)")
    @RequiresPermissions("sys:menu:select")
    public Result select(){
        //查询列表数据
        List<SysMenu> menuList = sysMenuService.queryNotButtonList();

        //添加顶级菜单
        SysMenu root = new SysMenu();
        root.setMenuId(0);
        root.setName("一级菜单");
        root.setParentId(-1);
        root.setOpen(true);
        menuList.add(root);

        return Result.ok().put("menuList", menuList);
    }

    /**
     * 获取单个菜单信息
     * @param menuId
     * @return
     */
    @GetMapping("/info/{menuId}")
    @ApiOperation("获取单个菜单信息")
    @RequiresPermissions("sys:menu:info")
    public Result update(@PathVariable Integer menuId){
        SysMenu menu = sysMenuService.getById(menuId);
        return Result.ok().put("menu",menu);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    @ApiOperation("保存")
    @RequiresPermissions("sys:menu:save")
    public Result save(@RequestBody SysMenu menu){
        //数据校验
        verifyForm(menu);

        sysMenuService.save(menu);

        return Result.ok();
    }

    /**
     * 更新
     * @param menu
     * @return
     */
    @PutMapping("/update")
    @ApiOperation("更新")
    @RequiresPermissions("sys:menu:update")
    public Result update(@RequestBody SysMenu menu){
        //数据校验
        verifyForm(menu);

        sysMenuService.updateById(menu);

        return Result.ok();
    }

    /**
     * 删除
     * @param menuId
     * @return
     */
    @DeleteMapping("/delete/{menuId}")
    @ApiOperation("删除")
    @RequiresPermissions("sys:menu:delete")
    public Result delete(@PathVariable Integer menuId){
        if(menuId <= 29){
            return Result.error("系统菜单，不能删除");
        }

        //判断是否有子菜单或按钮
        List<SysMenu> menuList = sysMenuService.queryListParentId(menuId);
        if(menuList.size() > 0){
            return Result.error("请先删除子菜单或按钮");
        }
        sysMenuService.delete(menuId);
        return Result.ok();
    }
    /**
     * 验证参数是否正确
     */
    private void verifyForm(SysMenu menu) {
        if (StringUtils.isBlank(menu.getName())) {
            throw new MyException("菜单名称不能为空");
        }

        if (menu.getParentId() == null) {
            throw new MyException("上级菜单不能为空");
        }

        //菜单
        if (menu.getType() == MenuTypeEnum.MENU.getValue()) {
            if (StringUtils.isBlank(menu.getUrl())) {
                throw new MyException("菜单URL不能为空");
            }
        }

        //上级菜单类型
        int parentType = MenuTypeEnum.CATALOG.getValue();
        if (menu.getParentId() != 0) {
            SysMenu parentMenu = sysMenuService.getById(menu.getParentId());
            parentType = parentMenu.getType();
        }

        //目录、菜单
        if (menu.getType() == MenuTypeEnum.CATALOG.getValue() ||
                menu.getType() == MenuTypeEnum.MENU.getValue()) {
            if (parentType != MenuTypeEnum.CATALOG.getValue()) {
                throw new MyException("上级菜单只能为目录类型");
            }
        }

        //按钮
        if (menu.getType() == MenuTypeEnum.BUTTON.getValue()) {
            if (parentType != MenuTypeEnum.MENU.getValue()) {
                throw new MyException("上级菜单只能为菜单类型");
            }
        }
    }
}
