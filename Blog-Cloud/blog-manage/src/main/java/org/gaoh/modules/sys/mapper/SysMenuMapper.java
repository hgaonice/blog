package org.gaoh.modules.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.gaoh.modules.entity.manage.sys.SysMenu;

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
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    /**
     * 查询非按钮的菜单
     * @return
     */
    List<SysMenu> queryNotButtonList();

    /**
     * 根据parentId查询菜单
     * @param parentId
     * @return
     */
    List<SysMenu> queryListParentId(Integer parentId);
}
