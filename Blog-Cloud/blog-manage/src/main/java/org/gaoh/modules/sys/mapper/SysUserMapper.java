package org.gaoh.modules.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.gaoh.modules.entity.manage.sys.SysUser;

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
public interface SysUserMapper extends BaseMapper<SysUser> {

    /**
     * 查询用户所有权限
     * @param userId
     * @return
     */
    List<String> queryAllPerms(Integer userId);

    /**
     * 查询用户的menuId
     * @param userId
     * @return
     */
    List<Integer> queryAllMenuId(Integer userId);
}
