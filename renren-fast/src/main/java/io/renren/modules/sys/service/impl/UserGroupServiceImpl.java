package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.exception.UserException;
import io.renren.common.utils.JsonResult;
import io.renren.modules.sys.dao.UserGroupDao;
import io.renren.modules.sys.entity.EmailTypeData;
import io.renren.modules.sys.entity.EmailUser;
import io.renren.modules.sys.entity.UserGroup;
import io.renren.modules.sys.service.EmailUserService;
import io.renren.modules.sys.service.UserGroupService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Log4j2
@Service
@Transactional(rollbackFor = Exception.class)
public class UserGroupServiceImpl extends ServiceImpl<UserGroupDao, UserGroup> implements UserGroupService {

    @Autowired
    private EmailUserService userService;

    @Autowired
    public JsonResult emailType(){
        List<EmailUser> email = userService.list(new QueryWrapper<EmailUser>().select("email"));
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
        cols.add("emailType");
        cols.add("number");
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
        result.add(emailOther);
        map.put("rows",result);
        log.info(map);
        return JsonResult.success(map);
    }

    /**
     * 删除一个分组
     *
     * @param groupId
     * @return
     */
    @Override
    public JsonResult deleteGroup(Integer groupId) {
        boolean state = this.removeById(groupId);
        if (state) {
            QueryWrapper wrapper = new QueryWrapper();
            wrapper.eq("group_id", groupId);
            // logService.remove(wrapper);

            boolean remove = userService.remove(wrapper);
            if (!remove) {
                throw new UserException("删除EmailUser失败");
            }
            return JsonResult.success("成功!");
        }
        return JsonResult.error("失败!");
    }

}