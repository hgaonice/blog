package org.gaoh.common;

import org.gaoh.common.exception.enums.ErrorEnum;

import java.io.Serializable;
import java.util.HashMap;

/**
 * Result
 *
 * @author gaoh
 * @date 2018/10/07 13:28
 * @email 2199382542@qq.com
 * @description 通用返回类
 */
public class Result extends HashMap<String, Object> implements Serializable {

    public Result() {
        put("code", 200);
        put("msg", "success");
    }

    public static org.gaoh.common.Result ok() {
        return new org.gaoh.common.Result();
    }

    public static org.gaoh.common.Result error() {
        return error(ErrorEnum.UNKNOWN);
    }

    public static org.gaoh.common.Result error(ErrorEnum eEnum) {
        return new org.gaoh.common.Result().put("code", eEnum.getCode()).put("msg", eEnum.getMsg());
    }

    public static org.gaoh.common.Result error(String msg) {
        return new org.gaoh.common.Result().put("msg",msg).put("code", ErrorEnum.UNKNOWN.getCode());
    }

    public static org.gaoh.common.Result error(Integer code , String msg){
        return new org.gaoh.common.Result().put("code",code).put("msg",msg);
    }

    public static org.gaoh.common.Result exception() {
        return exception(ErrorEnum.UNKNOWN);
    }

    public static org.gaoh.common.Result exception(ErrorEnum eEnum) {
        return new org.gaoh.common.Result().put("code", eEnum.getCode()).put("msg", eEnum.getMsg());
    }



    /**
     * 封装业务数据
     *
     * @param key
     * @param value
     * @return
     */
    @Override
    public org.gaoh.common.Result put(String key, Object value) {
        super.put(key, value);
        //将HashMap对象本身返回
        return this;
    }
}
