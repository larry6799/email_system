package io.renren.common.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zhangrui
 * @date 2020-03-20 15:32
 */
public class EmailUtils {
    private static final String[] email_suffix = "@126.com,@163.com,@yahoo.com,@hotmail.com,@gmail.com,@sina.com,@sohu.com".split(",");
    private static String base = "abcdefghijklmnopqrstuvwxyz0123456789";
    private static String shuzi = "0123456789";
    private static final String[] name = {"nick","marry","fiona","lisa","marry","jack","jerry",
            "andy","alan","ben","bill","larry","taylor","edward","david"};

    public static int getNum(int start, int end) {
        return (int) (Math.random() * (end - start + 1) + start);
    }

    public static int getHead() {
        return (int) (Math.random() * (3- 1 + 1) + 1);
    }
    public static int getNewHead() {
        return (int) (Math.random() * (9- 1 + 1) + 1);
    }

    /**
     * 返回 9-10 位的QQ邮箱
     * @return
     */

    public static String getQQEmail() {
        int length = getNum(9, 10);
        StringBuffer sb = new StringBuffer();
        if(length == 10){
            sb.append(getHead());
        }else{
            sb.append(getNewHead());
        }
        for (int i = 1; i < length-1; i++) {
            int number = (int) (Math.random() * 10);
            sb.append(shuzi.charAt(number));
        }
        sb.append("@qq.com");
        return sb.toString();
    }

    /**
     * 生成其他邮箱地址
     * @return
     */

    public static String getOtherEmail() {
        StringBuffer sb = new StringBuffer();
        sb.append(name[(int) (Math.random() * name.length)]);
        int number = (int) (Math.random() * base.length());
        sb.append((int)(Math.random() * 100)+"");
        sb.append(email_suffix[(int) (Math.random() * email_suffix.length)]);
        return sb.toString();
    }

    /**
     * 随机获得一个邮箱
     * @return
     */
    public static String getOneEmail(){
        return (int) (Math.random() * 2) == 0 ? getQQEmail() : getOtherEmail();
    }

    /**
     * 以遍历的方式获取Num个邮箱
     * @param Num
     * @return
     */
    public static List<String> getSomeEmail(int Num){
        List<String> list = new ArrayList<>();
        for(int i=0; i<Num; i++){
            list.add(getOneEmail());
        }
        return list;
    }
}