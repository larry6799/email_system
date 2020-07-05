package io.renren;


import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.sys.entity.EmailUser;
import io.renren.modules.sys.entity.UserExcel;
import io.renren.modules.sys.entity.UserGroup;
import io.renren.modules.sys.service.EmailUserService;
import io.renren.modules.sys.service.UserGroupService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@SpringBootTest
@RunWith(SpringRunner.class)
public class ImportExcelTest {

    /*
     * 使用 easypoi
     * 测试excel 导入为 Entry 类
     */
    @Test
    public void test() {
        ImportParams params = new ImportParams();
        params.setHeadRows(1);
        long start = new Date().getTime();
        List<UserExcel> list = ExcelImportUtil.importExcel(
                new File("D:/ceshi1.xlsx"),
                UserExcel.class, params);
        System.out.println(new Date().getTime() - start);
        System.out.println(list.size());
        list.forEach(System.out::println);
        System.out.println("--------------------");
        for (UserExcel userExcel : list) {
            System.out.println(userExcel.getUsername() + " " + userExcel.getEmail());
        }

    }

    @Autowired
    private UserGroupService groupService;


    @Test
    public void test2() {

        List<UserGroup> list = groupService.list();
        for (UserGroup l : list) {
            System.out.println(l);
        }

    }


    @Autowired
    private EmailUserService userService;

    @Test
    public void test3() {

//        QueryWrapper<EmailUser> wrapper = new QueryWrapper();
//        wrapper.eq("id", 30);
        HashMap map = new HashMap();
        map.put("id", 30);
        map.put("group_name", "ceshi1");
        List<UserGroup> list = groupService.listByMap(map);
        System.out.println(list);

    }

}