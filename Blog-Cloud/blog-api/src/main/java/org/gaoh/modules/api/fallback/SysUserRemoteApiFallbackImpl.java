package org.gaoh.modules.api.fallback;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.gaoh.common.Result;
import org.gaoh.modules.api.SysUserRemoteApi;
import org.gaoh.modules.entity.manage.sys.SysMenu;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author scott
 * @date 2020/05/22
 */
@Slf4j
@Component
public class SysUserRemoteApiFallbackImpl implements SysUserRemoteApi {
    @Setter
    private Throwable cause;

    @Override
    public Result selectById(Integer userId) {
        cause.printStackTrace();
        log.debug(cause.getMessage());
        return null;
    }

    @Override
    public List<SysMenu> selectList() {
        cause.printStackTrace();

        return null;
    }

    @Override
    public List<String> queryAllPerms(Integer userId) {
        cause.printStackTrace();

        return null;
    }

    @Override
    public org.gaoh.common.vo.Result test() {
        return null;
    }

    @Override
    public Result test1(Integer val) {
        return null;
    }

	/*@Override
	public Result<Set<String>> getUserRolesSet(String username) {
		log.error("获取用户角色集合 {}",username, cause);
		return null;
	}*/
}
