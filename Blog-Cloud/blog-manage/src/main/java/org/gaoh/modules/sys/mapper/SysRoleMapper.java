package org.gaoh.modules.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.gaoh.modules.entity.manage.sys.SysRole;

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
public interface SysRoleMapper extends BaseMapper<SysRole> {

    /**
     * 查询所属角色
     * @param createUserId
     * @return
     */
    List<Integer> queryRoleIdList(Integer createUserId);
}
