package com.gaoh.modules.auth.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IOUtils;
import com.gaoh.base.AbstractController;
import com.gaoh.common.Result;
import com.gaoh.common.exception.enums.ErrorEnum;
import com.gaoh.entity.manage.sys.SysUser;
import com.gaoh.entity.manage.sys.form.SysLoginForm;
import com.gaoh.modules.auth.service.SysCaptchaService;
import com.gaoh.modules.auth.service.SysUserTokenService;
import com.gaoh.modules.sys.SysUserMapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

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

    @ApiOperation("获取验证码")
    @GetMapping("captcha.jpg")
    public void captcha(HttpServletResponse response,String uuid) throws IOException {
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
        boolean captcha=sysCaptchaService.validate(form.getUuid(),form.getCaptcha());
        if(!captcha){
            // 验证码不正确
            return Result.error(ErrorEnum.CAPTCHA_WRONG);
        }

        // 用户信息
        SysUser user = sysUserMapper.selectOne(new QueryWrapper<SysUser>()
                .lambda()
                .eq(SysUser :: getUsername,form.getUsername()));
        if(user ==null || !user.getPassword().equals(new Sha256Hash(form.getPassword(),user.getSalt()).toHex())){
            // 用户名或密码错误
            return Result.error(ErrorEnum.USERNAME_OR_PASSWORD_WRONG);
        }
        if(user.getStatus() ==0){
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
}
