package com.gaoh.entity.manage.sys.form;

import lombok.Data;

/**
 * SysLoginForm
 *
 * @author gaoh
 * @date 2018/10/20 14:51
 * @email 2199382542@qq.com
 * @description 登录表单对象
 */
@Data
public class SysLoginForm {
    private String username;
    private String password;
    private String captcha;
    private String uuid;
}
