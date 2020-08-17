package org.gaoh.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.gaoh.modules.entity.manage.sys.SysRoleMenu;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author gaoh
 * @since 2018-10-08
 */
@Service
public interface SysRoleMenuService extends IService<SysRoleMenu> {


    void saveOrUpdate(Integer roleId, List<Integer> menuIdList);

    List<Integer> queryMenuIdList(Integer roleId);

    void deleteBatchByRoleId(Integer[] roleIds);
}
