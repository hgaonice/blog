package com.gaoh.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gaoh.entity.manage.sys.SysRoleMenu;
import com.gaoh.modules.sys.mapper.SysRoleMenuMapper;
import com.gaoh.modules.sys.service.SysRoleMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author gaoh
 * @since 2018-10-08
 */
@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements SysRoleMenuService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveOrUpdate(Integer roleId, List<Integer> menuIdList) {
        //先删除角色与菜单关系
        baseMapper.delete(new UpdateWrapper<SysRoleMenu>().lambda()
                .eq(roleId!=null, SysRoleMenu::getRoleId,roleId));

        if(menuIdList.size() == 0){
            return ;
        }

        //保存角色与菜单关系
        List<SysRoleMenu> list = new ArrayList<>(menuIdList.size());
        for(Integer menuId : menuIdList){
            SysRoleMenu SysRoleMenu = new SysRoleMenu();
            SysRoleMenu.setMenuId(menuId);
            SysRoleMenu.setRoleId(roleId);

            list.add(SysRoleMenu);
        }
        this.saveBatch(list);
    }

    @Override
    public List<Integer> queryMenuIdList(Integer roleId) {
        return baseMapper.queryMenuIdList(roleId);
    }

    @Override
    public void deleteBatchByRoleId(Integer[] roleIds) {
        Arrays.stream(roleIds).forEach(roleId -> {
            baseMapper.delete(new UpdateWrapper<SysRoleMenu>().lambda()
                    .eq(roleId!=null, SysRoleMenu::getRoleId,roleId));
        });
    }
}
