package io.renren;


import io.renren.common.utils.QiniuUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.UUID;

/**
 * @author zhangrui
 * @date 2020-03-23 15:12
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class QiNiuTest {
    @Autowired
    QiniuUtils qiniuUtils;

    @Test
    public void context1() {
        File file = new File("C:/Users/nsus/Desktop/123.jpg");
        try
        {
            FileInputStream fileInputStream = new FileInputStream(file);//与根据File类对象的所代表的实际文件建立链接创建fileInputStream对象
            String fileKey = UUID.randomUUID().toString().replace("-", "") + ".png";
            String path = qiniuUtils.upload(fileInputStream,fileKey);
            System.out.println(path);
        }
        catch (Exception e)
        {
            System.out.println("文件不存在或者文件不可读或者文件是目录");
        }
    }

}