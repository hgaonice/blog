package org.gaoh.common.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.CodeSignature;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Author: GH
 * @Date: 2019/6/30 10:34
 * @Version 1.0
 * <p>
 * 通用方法
 */
@Slf4j
public class BaseUtils {
    /**
     * URL UTF-8 转码
     *
     * @param str
     * @return
     */
    private static final String UNDEFINED = "undefined";


    public static String encodeUTF8(String str) {
        if (StringUtils.isBlank(str)) {
            return "";
        }
        if (UNDEFINED.equals(str)) {
            return "";
        }
        if (str.equals(new String(str.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.ISO_8859_1))) {
            return new String(str.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8).trim();
        } else {
            return str;
        }
    }


    /**
     * 获取 文件上传本地磁盘路径  图片
     *
     * @return
     */
   /* public static String getLocalPath(String localName) {
//        String localPath = "C:ZZCS" + File.separator + "~usr" + File.separator + "local" + File.separator + "ZCCS";
        String localPath = "D:" + File.separator + "parent_child" + File.separator + "upload" + File.separator + localName + "~usr" + File.separator + "local" + File.separator + "ZCCS";
        if (StringUtils.isBlank(localPath)) {
            throw new BaseException("未找到文件上传本地磁盘路径配置！");
        }
        String[] localPathArr = localPath.split("~");
        String os = System.getProperty("os.name");
        if (os.toLowerCase().startsWith("win")) {
            return localPathArr[0];
        } else {
            if (localPathArr.length < 2) {
                throw new BaseException("未找到文件上传本地磁盘Linux路径配置！");
            }
            return localPathArr[1];
        }
    }*/

    /**
     * 获取 文件上传本地磁盘路径 资产档案
     * @return
     */
//    public static String getAssetFilePath(String localPath) {
////        String localPath = "D:"+ File.separator +"assets_management"+ File.separator +"upload"+ File.separator +"AssetFiles"+ "~usr" + File.separator + "local" + File.separator + "ZCCS";
//        if(StringUtils.isBlank(localPath)){
//            throw new BaseException("未找到文件上传本地磁盘路径配置！");
//        }
//        String[] localPathArr = localPath.split("~");
//        String os = System.getProperty("os.name");
//        if (os.toLowerCase().startsWith("win")) {
//            return localPathArr[0];
//        } else {
//            if(localPathArr.length < 2){
//                throw new BaseException("未找到文件上传本地磁盘Linux路径配置！");
//            }
//            return localPathArr[1];
//        }
//    }

    /**
     * 删除文件
     *
     * @param path
     * @throws Exception
     */
    public static void deleteFile(String path) {
        if (StringUtils.isNotBlank(path)) {
            File file = new File(path);
            if (file.isFile() && file.exists()) {
                file.delete();
            }
        }
    }

    /**
     * 删除目录下所有文件及文件夹
     *
     * @param path
     */
    public static void deleteDirectory(String path) {
        if (StringUtils.isNotBlank(path)) {
            File file = new File(path);
            //1級文件刪除
            if (!file.isDirectory()) {
                file.delete();
            } else if (file.isDirectory()) {
                //2級文件列表
                String[] filelist = file.list();
                //获取新的二級路徑
                for (int j = 0; j < filelist.length; j++) {
                    File filessFile = new File(path + "\\" + filelist[j]);
                    if (!filessFile.isDirectory()) {
                        filessFile.delete();
                    } else if (filessFile.isDirectory()) {
                        //递归調用
                        deleteDirectory(path + "\\" + filelist[j]);
                    }
                }
                file.delete();
            }
        }
    }


    /**
     * 求两个日期的时间差
     *
     * @param startTime
     * @param endTime
     * @return 相差的天数
     */
    public static int getDistanceTime(Date startTime, Date endTime) {
        int days = 0;
        long time1 = startTime.getTime();
        long time2 = endTime.getTime();

        long diff;
        if (time1 < time2) {
            diff = time2 - time1;
        } else {
            diff = time1 - time2;
        }
        days = (int) (diff / (24 * 60 * 60 * 1000));
        return days;
    }

    /**
     * 返回日期前    年/月/天 的日期
     *
     * @param date  日期
     * @param num   前多少 年/月/天  的日期
     * @param param 年/月/天
     * @return
     */
    public static Date getDate(Date date, Integer num, String param) {
        Calendar calendar = Calendar.getInstance();//日历对象
        calendar.setTime(date);//设置当前日期
        if ("DATE".equalsIgnoreCase(param)) {//日
            calendar.add(Calendar.DATE, -num);
        } else if ("MONTH".equalsIgnoreCase(param)) {//月
            calendar.add(Calendar.MONTH, -num);
        } else if ("YEAR".equalsIgnoreCase(param)) {//年
            calendar.add(Calendar.YEAR, -num);
        } else if ("HOUR".equalsIgnoreCase(param)) {
            calendar.add(Calendar.HOUR, -num);
        }
        return calendar.getTime();
    }

    /**
     * 计算两个时间差 是否是指定月前
     *
     * @param begin
     * @param end
     * @param num
     * @return
     */
    public static boolean isMonth(Date begin, Date end, Integer num) {
        Calendar calendar = Calendar.getInstance();//日历对象
        calendar.setTime(end);//设置当前日期
        calendar.add(Calendar.MONTH, -num);
        Date time = calendar.getTime();
        return begin.after(time);
    }

    /**
     * 获取 文件上传本地磁盘路径  文件
     *
     * @return
     */
   /* public static String getFilePath() {
        String localPath = "D:" + File.separator + "assets_management" + File.separator + "upload" + File.separator + "contract" + "~usr" + File.separator + "local" + File.separator + "ZCCS";
        if (StringUtils.isBlank(localPath)) {
            throw new BaseException("未找到文件上传本地磁盘路径配置！");
        }
        String[] localPathArr = localPath.split("~");
        String os = System.getProperty("os.name");
        if (os.toLowerCase().startsWith("win")) {
            return localPathArr[0];
        } else {
            if (localPathArr.length < 2) {
                throw new BaseException("未找到文件上传本地磁盘Linux路径配置！");
            }
            return localPathArr[1];
        }
    }*/

    /**
     * 解决文件导出文件名乱码问题
     *
     * @param @param  fileNames
     * @param @param  request
     * @param @return 设定文件
     * @return String    返回类型
     * @throws
     * @Title: encodeFileName
     * @Description: 导出文件转换文件名称编码
     */
    public static String encodeFileName(String fileNames, HttpServletRequest request) {
        String codedFilename = fileNames;
        try {
            String agent = request.getHeader("USER-AGENT");
            if (null != agent) {
                // ie浏览器及Edge浏览器
                if (agent.contains("MSIE") || agent.contains("Trident") || agent.contains("Edge")) {
                    codedFilename = java.net.URLEncoder.encode(fileNames, "UTF-8");
                    // 火狐,Chrome等浏览器
                } else if (agent.contains("Mozilla")) {
                    codedFilename = new String(fileNames.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return codedFilename;
    }

    /**
     * 计算时间差，以小时为单位。如：2018-08-08 和 2018-08-07 相差24h
     *
     * @param startTime
     * @param endTime
     * @return
     */
    public double getDistanceTime2(Date startTime, Date endTime) {
        double hour;
        double time1 = startTime.getTime();
        double time2 = endTime.getTime();

        double diff;
        if (time1 < time2) {
            diff = time2 - time1;
        } else {
            diff = time1 - time2;
        }
        hour = (diff / (60 * 60 * 1000));
        return hour;
    }


    /**
     * 解析IP地址
     *
     * @return
     */
    public static String analysisIP(HttpServletRequest request) {
        String IP = "";
        if (request.getHeader("x-forwarded-for") == null) {
            IP = request.getRemoteAddr();
        } else {
            IP = request.getHeader("x-forwarded-for");
        }
        if ("0:0:0:0:0:0:0:1".equals(IP)) {
            IP = "127.0.0.1";
        }
        return IP;
    }


    private static Map<String, String> config;


    /**
     * 读取并解析配置文件
     *
     * @param fileName classpath下文件名
     * @return
     * @throws Exception
     */
    /*public static Map<String, String> readProperties(String fileName) throws Exception {
        Map<String, String> reslutMap = new HashMap<>();
        FileInputStream in = null;

        String absolutePath =  BaseUtils.getAbsoluteClasspath() + File.separator + fileName.trim();
        in = new FileInputStream(absolutePath);
        Properties properties = new Properties(); //实例化
        properties.load(in); //从filePath得到键值对

        Enumeration<?> enmObject = properties.keys(); //得到所有的主键信息（这里的主键信息主要是简化的主键，也是信息的关键）

        while (enmObject.hasMoreElements()) { //对每一个主键信息进行检索处理，跟传入的返回值信息是否有相同的地方（如果有相同的地方，取出主键信息的属性，传回给返回信息）
            String curKey = ((String) enmObject.nextElement()).trim();
            if (curKey.contains("#")) { // 带#号的key为注释内容，自动忽略
                continue;
            }
            String curMessage = new String(properties.getProperty(curKey).getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8).trim();
            reslutMap.put(BaseUtils.encodeUTF8(curKey), BaseUtils.encodeUTF8(curMessage));
        }

        in.close();

        return reslutMap;
    }*/

    /**
     * 获取classpath绝对路径
     *
     * @return
     */
    public static String getAbsoluteClasspath() {
        String absolutePath = Thread.currentThread().getContextClassLoader().getResource("").toString(); //tomcat绝对路径
        absolutePath = absolutePath.replaceAll("file:/", "");
        // https://www.cnblogs.com/zhengxl5566/p/10783422.html
        absolutePath = absolutePath.replaceAll("%20", " ");
        absolutePath = File.separator + absolutePath.trim();
        log.debug("classpath:" + absolutePath);
        return absolutePath;
    }


    /**
     * 获取时间段的时间
     *
     * @param beginTime 开始时间
     * @param endTime   结束时间
     * @param sdf       时间格式
     * @return List<String>  时间的段的集合
     */
    public static List<String> findDaysStr(String beginTime, String endTime, SimpleDateFormat sdf) {
        if (sdf == null) {
            sdf = new SimpleDateFormat("yyyy-MM-dd");
        }
        Date dBegin = null;
        Date dEnd = null;
        try {
            dBegin = sdf.parse(beginTime);
            dEnd = sdf.parse(endTime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<String> daysStrList = new ArrayList<String>();
        daysStrList.add(sdf.format(dBegin));
        Calendar calBegin = Calendar.getInstance();
        assert dBegin != null;
        calBegin.setTime(dBegin);
        Calendar calEnd = Calendar.getInstance();
        assert dEnd != null;
        calEnd.setTime(dEnd);
        while (dEnd.after(calBegin.getTime())) {
            calBegin.add(Calendar.DAY_OF_MONTH, 1);
            String dayStr = sdf.format(calBegin.getTime());
            daysStrList.add(dayStr);
        }
        return daysStrList;
    }


    /**
     * 判断是否为整数
     *
     * @param str 传入的字符串
     * @return 是整数返回true, 否则返回false
     */
    public static boolean isInteger(String str) {
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        return pattern.matcher(str).matches();
    }

    /**
     * 返回字符串中的整数
     *
     * @param param 字符串
     * @return 返回的整数
     */
    public static Integer returnStrInsideInt(String param) {
        String regEx = "[^0-9]";
        Pattern pattern = Pattern.compile(regEx);
        Matcher matcher = pattern.matcher(param);
        String trim = matcher.replaceAll("").trim();
        return Integer.parseInt(trim);
    }

    /**
     * 将单位和数字分开
     *
     * @param param 字符串
     * @return 例如: 123.23克   return: [0] 123.23  [1] 克
     */
    public static String[] takeStrNumSeparate(String param) {
        if (StringUtils.isNotBlank(param)) {
            char[] chars = param.toCharArray();
            int i;
            for (i = 0; i < chars.length; ++i) {
                if (!Character.isDigit(chars[i])) {
                    if (chars[i] == '.') {
                        continue;
                    }
                    break;
                }
            }
            return new String[]{param.substring(0, i), param.substring(i)};
        }
        return new String[]{"", ""};
    }


    /**
     * 得到中文全拼
     *
     * @param src 需要转化的中文字符串
     * @return
     */
   /* public static String getPingYin(String src) {
        char[] t1 = null;
        t1 = src.toCharArray();
        String[] t2 = new String[t1.length];
        HanyuPinyinOutputFormat t3 = new HanyuPinyinOutputFormat();
        t3.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        t3.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        t3.setVCharType(HanyuPinyinVCharType.WITH_V);
        String t4 = "";
        int t0 = t1.length;
        try {
            for (int i = 0; i < t0; i++) {
                // 判断是否为汉字字符
                if (Character.toString(t1[i]).matches("[\\u4E00-\\u9FA5]+")) {
                    t2 = PinyinHelper.toHanyuPinyinStringArray(t1[i], t3);
                    t4 += t2[0];
                } else {
                    t4 += Character.toString(t1[i]);
                }
            }
            return t4;
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        return t4;
    }*/

    /**
     * 得到中文首字母
     *
     * @param str 需要转化的中文字符串
     * @return
     */
   /* public static String getPinYinHeadChar(String str) {
        String convert = "";
        for (int j = 0; j < str.length(); j++) {
            char word = str.charAt(j);
            String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);
            if (pinyinArray != null) {
                convert += pinyinArray[0].charAt(0);
            } else {
                convert += word;
            }
        }
        return convert;
    }*/

    /**
     * 根据递归遍历文件夹的所有文件
     *
     * @param file
     */
    public static List<String> getFiles(File file, List<String> list) {
        //如果是文件
        if (file.isFile()) {
            list.add(file.getAbsolutePath().replace("\\", "/"));
            //并且结束当前递归
            return list;
        }
        //不是文件就放在文件数组中
        File files[] = file.listFiles();
        for (File fs : files) {
            //然后依次递归
            getFiles(fs, list);
        }
        return list;
    }


    /**
     * 驼峰命名法字符串(CamelCase)转为下划线命名法(UnderScoreCase)---->(userId:user_id)
     *
     * @param str
     * @return
     */
    public static String camelCase2UnderScoreCase(String str) {
        if (StringUtils.isBlank(str)) {
            return "";
        }
        int len = str.length();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c = str.charAt(i);
            if (Character.isUpperCase(c)) {
                sb.append("_");
                sb.append(Character.toLowerCase(c));
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }


    /**
     * 根据字段名称获取对象的属性
     *
     * @param fieldName
     * @param target
     * @return
     * @throws Exception
     */
    public static void getFieldValueByName(String fieldName, Object target, Map<String, Object> map) {
        String firstLetter = fieldName.substring(0, 1).toUpperCase();
        String getter = "get" + firstLetter + fieldName.substring(1);
        Method method;
        try {
            method = target.getClass().getMethod(getter);
            Object e = method.invoke(target);
            if (e != null) {
                map.put(fieldName, e.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 获取所有字段名字
     *
     * @param target
     * @return
     */
    public static String[] getFiledName(Object target) {
        Field[] fields = target.getClass().getDeclaredFields();
        ArrayList<String> stringList = new ArrayList<>();
        for (Field field : fields) {
            if (!"serialVersionUID".equals(field.getName())) {
                stringList.add(field.getName());
            }
        }
        return stringList.toArray(new String[0]);
    }

    /**
     * 获取所有属性的值
     *
     * @param target
     * @return
     * @throws Exception
     */
    public static Map<String, Object> getFiledValues(Object target) {
        String[] fieldNames = getFiledName(target);
        Map<String, Object> map = new HashMap<>(6);
        for (String fieldName : fieldNames) {
            getFieldValueByName(fieldName, target, map);
        }
        return map;
    }


    /**
     * 根据注解获取执行的参数
     *
     * @param joinPoint
     * @return
     */
    public static Map<String, Object> getNameAndValue(ProceedingJoinPoint joinPoint) {
        Map<String, Object> param = new HashMap<>();

        Object[] paramValues = joinPoint.getArgs();
        String[] paramNames = ((CodeSignature) joinPoint.getSignature()).getParameterNames();

        for (int i = 0; i < paramNames.length; i++) {
            param.put(paramNames[i], paramValues[i]);
        }

        return param;
    }

}
