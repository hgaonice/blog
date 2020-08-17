package org.gaoh.modules.auth.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IOUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.gaoh.common.Result;
import org.gaoh.common.exception.enums.ErrorEnum;
import org.gaoh.modules.api.SysUserRemoteApi;
import org.gaoh.modules.auth.service.SysCaptchaService;
import org.gaoh.modules.auth.service.SysUserTokenService;
import org.gaoh.modules.base.AbstractController;
import org.gaoh.modules.entity.manage.sys.SysUser;
import org.gaoh.modules.entity.manage.sys.form.SysLoginForm;
import org.gaoh.modules.sys.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * SysLoginController
 *
 * @author gaoh
 * @date 2018/10/19 18:47
 * @email 2199382542@qq.com
 * @description
 */
@Api(tags = "系统登录")
@RestController
public class SysLoginController extends AbstractController {

    @Autowired
    private SysCaptchaService sysCaptchaService;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysUserTokenService sysUserTokenService;

    @Autowired
    private SysUserRemoteApi sysUserRemoteApi;

    @ApiOperation("获取验证码")
    @GetMapping("captcha.jpg")
    public void captcha(HttpServletResponse response, String uuid) throws IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");

        //获取图片验证码
        BufferedImage image = sysCaptchaService.getCaptcha(uuid);

        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
        IOUtils.closeQuietly(out);
    }

    @ApiOperation("用户登录")
    @PostMapping("/admin/sys/login")
    public Result login(@RequestBody SysLoginForm form) {
        boolean captcha = sysCaptchaService.validate(form.getUuid(), form.getCaptcha());
        if (!captcha) {
            // 验证码不正确
            return Result.error(ErrorEnum.CAPTCHA_WRONG);
        }

        // 用户信息
        SysUser user = sysUserMapper.selectOne(new QueryWrapper<SysUser>()
                .lambda()
                .eq(SysUser::getUsername, form.getUsername()));
        if (user == null || !user.getPassword().equals(new Sha256Hash(form.getPassword(), user.getSalt()).toHex())) {
            // 用户名或密码错误
            return Result.error(ErrorEnum.USERNAME_OR_PASSWORD_WRONG);
        }
        if (user.getStatus() == 0) {
            return Result.error("账号已被锁定，请联系管理员");
        }

        //生成token，并保存到redis
        return sysUserTokenService.createToken(user.getUserId());
    }

    /**
     * 退出
     */
    @ApiOperation("退出登录")
    @PostMapping("/sys/logout")
    public Result logout() {
        sysUserTokenService.logout(getUserId());
        return Result.ok();
    }


    @ApiOperation("test")
    @PostMapping("/sys/test")
    public org.gaoh.common.vo.Result test() {
        return sysUserRemoteApi.test();
    }


    @ApiOperation("test-val")
    @PostMapping("/sys/test1/{val}")
    public Result test1(@PathVariable("val") Integer val) {
        return sysUserRemoteApi.test1(val);
    }

}
