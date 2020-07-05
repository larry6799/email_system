package io.renren.modules.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.common.utils.JsonResult;
import io.renren.common.utils.ShiroUtils;
import io.renren.modules.sys.entity.EmailUser;
import io.renren.modules.sys.entity.UserGroup;
import io.renren.modules.sys.service.EmailUserService;
import io.renren.modules.sys.service.UserGroupService;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@Log4j2
@RestController
@RequestMapping("/sys/user")
public class EmailUserController extends AbstractController{

    @Autowired
    private UserGroupService groupService;

    @Autowired
    private EmailUserService userService;

    /**
     * 获取所有的分组数据
     *
     * @return
     */
    @RequestMapping("/get-group")
    public JsonResult getGroupList() {
        Long userId = ShiroUtils.getUserId();
        log.info("操作者:" + userId);
        if(userId <= 0){
            return JsonResult.error("用户无权限");
        }else if(userId == 1){
            return userService.getGroupList();
        }else {
            return userService.getGroupListByUserId(userId);
        }


    }

    /**
     * 获取所有用户数目
     */
    @GetMapping("/totalEmailUser")
    public JsonResult totalEmailUser(){
        Integer totalNum = userService.totalEmailUser();
        return JsonResult.success(totalNum);
    }

    /**
     * 获取所有的邮箱类别数据
     *
     * @return
     */
    @GetMapping("/emailType")
    public JsonResult emailType() {
        return groupService.emailType();
    }


    /**
     * 获取客户数据 根据用户分组编号
     *
     * @param page
     * @param groupId
     * @return
     */
    @RequestMapping("/get-user-group")
    public JsonResult getUserList(Page page, Integer groupId) {
        if (groupId == null) {
            return JsonResult.errorForEmpty();
        }
        QueryWrapper<EmailUser> wrapper = new QueryWrapper();
        wrapper.eq("group_id", groupId);
        Page pageResult = userService.page(page, wrapper);
        return JsonResult.success(pageResult);
    }
    /**
     * 删除一个用户分组
     *
     * @param groupId
     * @return
     */
    @PostMapping("/delete-group")
    public JsonResult deleteGroup(Integer groupId) {
        if (groupId <= 0) {
            return JsonResult.error("id为空");
        }
        Long userId = ShiroUtils.getUserId();
        log.info("userId:" + userId);
        if(userId == 1){
            return groupService.deleteGroup(groupId);
        }else{
            Long l = new Long((long)groupId);
            log.info("groupId:" + l);
            UserGroup userGroup = groupService.getById(groupId);
            if(userGroup == null || userGroup.getUserId() != userId){
                log.info("权限不足");
                return JsonResult.error("权限不足");
            }else{
                log.info("删除分组");
                return groupService.deleteGroup(groupId);
            }
        }

    }

    /**
     * 删除一个单独的客户
     *
     * @param userId
     * @return
     */
    @PostMapping("/delete-user")
    public JsonResult delete(Integer userId) {
        if (userId == null) {
            return JsonResult.errorForEmpty();
        }
        boolean state = userService.removeById(userId);
        if(!state){
            return JsonResult.error("删除失败!");
        }
        return JsonResult.actionSuccess();
    }


    /**
     * 导入Excel表格 批量导入数据
     *
     * @param groupName
     * @param file
     * @return
     */
    @PostMapping("/import")
    public JsonResult importUserData(String groupName, MultipartFile file) {
        log.info("importUserData");
        if (StringUtils.isEmpty(groupName)) {
            return JsonResult.errorForEmpty();
        }
        return userService.importUserEmailAsExcel(groupName, file);
    }


    @RequestMapping("/initUeditor")
    public void initUedit(Map<String, Object> parmas, HttpServletResponse response, HttpServletRequest request) {
        response.setContentType("application/json");
        StringBuffer stringBuffer = new StringBuffer();
        InputStream stream = null;
        BufferedReader br = null;
        PrintWriter writer = null;
        try {
            stream = getClass().getClassLoader().getResourceAsStream("static/config.json");
            br = new BufferedReader(new InputStreamReader(stream, "UTF-8"));
            String line;
            while ((line = br.readLine()) != null) {
                stringBuffer.append(line);
            }

            String json = stringBuffer.toString().replaceAll("/\\*[\\s\\S]*?\\*/", "");
            writer = response.getWriter();
            writer.write(json);
            writer.flush();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stream != null) {
                IOUtils.closeQuietly(stream);
                IOUtils.closeQuietly(br);
                writer.close();
            }
        }
    }

}