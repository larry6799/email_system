package io.renren;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.JsonResult;
import io.renren.modules.sys.entity.EmailTypeData;
import io.renren.modules.sys.entity.EmailUser;
import io.renren.modules.sys.entity.Tongji;
import io.renren.modules.sys.service.EmailUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DataTest {

    @Autowired
    private EmailUserService userService;

    @Test
    public void testEmailType(){
        List<EmailUser> email = userService.list(new QueryWrapper<EmailUser>().select("email"));
        System.out.println(email);
        int total = email.size();
        int EmailQQ = 0;
        int Email163 = 0;
        int EmailGoogle = 0;
        int EmailFoxmail = 0;
        int Email126 = 0;
        for(EmailUser e : email){
            if(e.getEmail().toLowerCase().endsWith("qq.com")){
                EmailQQ ++;
            }
            if(e.getEmail().toLowerCase().endsWith("126.com")){
                Email126 ++;
            }
            if(e.getEmail().toLowerCase().endsWith("163.com")){
                Email163 ++;
            }
            if(e.getEmail().toLowerCase().endsWith("gmail.com")){
                EmailGoogle ++;
            }
            if(e.getEmail().toLowerCase().endsWith("foxmail.com")){
                EmailFoxmail ++;
            }
        }

        HashMap<String, Object> map = new HashMap<>();
        ArrayList<String> cols = new ArrayList<>();
        cols.add("EmailType");
        cols.add("Number");
        map.put("columns",cols);
        List<EmailTypeData> result = new ArrayList<>();
        EmailTypeData emailQQ = new EmailTypeData("QQ邮箱", EmailQQ);
        result.add(emailQQ);
        EmailTypeData email126 = new EmailTypeData("126邮箱", Email126);
        result.add(email126);
        EmailTypeData email163 = new EmailTypeData("163邮箱", Email163);
        result.add(email163);
        EmailTypeData emailfoxmail = new EmailTypeData("Foxmail邮箱", EmailFoxmail);
        result.add(emailfoxmail);
        EmailTypeData emailgoogle = new EmailTypeData("Gmail邮箱", EmailGoogle);
        result.add(emailgoogle);
        EmailTypeData emailOther = new EmailTypeData("其他邮箱", total-Email126-Email163-EmailFoxmail-EmailGoogle-EmailQQ);
        result.add(emailgoogle);
        map.put("rows",result);
        System.out.println(map);
        // return JsonResult.success(map);
    }


}