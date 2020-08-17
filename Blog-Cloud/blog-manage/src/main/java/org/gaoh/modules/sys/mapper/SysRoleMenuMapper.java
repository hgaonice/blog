package org.gaoh.modules.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.gaoh.modules.entity.manage.sys.SysRoleMenu;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author gaoh
 * @since 2018-10-08
 */
@Mapper
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {

    /**
     * 根据roleId查询所属menuId
     * @param roleId
     * @return
     */
    List<Integer> queryMenuIdList(Integer roleId);
}
