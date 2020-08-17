package org.gaoh.modules.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.gaoh.modules.entity.manage.sys.SysUserRole;

import java.util.List;

/**
 * SysUserRoleMapper
 *
 * @author Zoey
 * @date 2018/10/26 00:02
 * @email 2199382542@qq.com
 * @description
 */
@Mapper
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {
    /**
     * 查询roleId
     * @param userId
     * @return
     */
    List<Integer> queryRoleIdList(Integer userId);
}
