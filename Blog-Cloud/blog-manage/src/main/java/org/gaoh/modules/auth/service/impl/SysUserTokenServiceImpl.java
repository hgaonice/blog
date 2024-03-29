package org.gaoh.modules.auth.service.impl;

import org.gaoh.common.Result;
import org.gaoh.common.constants.RedisKeyConstants;
import org.gaoh.common.util.RedisUtil;
import org.gaoh.common.util.RedisUtils;
import org.gaoh.modules.auth.TokenGenerator;
import org.gaoh.modules.auth.service.SysUserTokenService;
import org.gaoh.modules.entity.manage.sys.SysUser;
import org.gaoh.modules.entity.manage.sys.SysUserToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * SysUserTokenServiceImpl
 *
 * @author gaoh
 * @date 2018/10/20 15:18
 * @email 2199382542@qq.com
 * @description
 */
@Service
public class SysUserTokenServiceImpl implements SysUserTokenService {

    //12小时后过期
    private final static int EXPIRE = 3600 * 12;

    @Autowired
    private RedisUtils redisUtils;
    @Autowired
    private RedisUtil redisUtil;

    /**
     * 生成Token
     *
     * @param user
     * @return
     */
    @Override
    public Result createToken(SysUser user) {
        // 生成一个token
        String token = TokenGenerator.generateValue();

        String tokenKey = RedisKeyConstants.MANAGE_SYS_USER_TOKEN + token;
        String userIdKey = RedisKeyConstants.MANAGE_SYS_USER_TOKEN + user.getUserId();

        //判断是否生成过token
        String tokenInRedis = redisUtils.get(userIdKey);
        if (!StringUtils.isEmpty(tokenInRedis)) {
            // 将原来的token删除
            redisUtils.delete(RedisKeyConstants.MANAGE_SYS_USER_TOKEN + tokenInRedis);
        }
        // 将token存进redis
        redisUtils.set(tokenKey, user.getUserId(), EXPIRE);
        redisUtils.set(userIdKey, token, EXPIRE);

//        redisUtil.set(RedisKeyConstants.MANAGE_SYS_USER_INFO + ":" + token, user, EXPIRE);

        return new Result().put("token", token).put("expire", EXPIRE);
    }

    /**
     * 查询token
     *
     * @param token
     * @return
     */
    @Override
    public SysUserToken queryByToken(String token) {
        String userId = redisUtils.get(token);
        if (StringUtils.isEmpty(userId)) {
            return null;
        }
        SysUserToken sysUserToken = new SysUserToken();
        sysUserToken.setToken(token);
        sysUserToken.setUserId(Integer.parseInt(userId));
        return sysUserToken;
    }

    /**
     * 退出登录
     *
     * @param userId
     */
    @Override
    public void logout(Integer userId) {
        String userIdKey = RedisKeyConstants.MANAGE_SYS_USER_TOKEN + userId;
        String token = redisUtils.get(userIdKey);
        String tokenKey = RedisKeyConstants.MANAGE_SYS_USER_TOKEN + token;
        redisUtils.delete(userIdKey);
        redisUtils.delete(tokenKey);
    }

    /**
     * 续期
     *
     * @param userId
     * @param token
     */
    @Override
    public void refreshToken(Integer userId, String token) {
        String tokenKey = RedisKeyConstants.MANAGE_SYS_USER_TOKEN + token;
        String userIdKey = RedisKeyConstants.MANAGE_SYS_USER_TOKEN + userId;
        redisUtils.updateExpire(tokenKey);
        redisUtils.updateExpire(userIdKey);
    }


}
