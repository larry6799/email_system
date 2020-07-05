/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.controller;

import cn.hutool.core.collection.CollUtil;
import io.renren.common.annotation.SysLog;
import io.renren.common.utils.Constant;
import io.renren.common.utils.JsonResult;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.validator.Assert;
import io.renren.common.validator.ValidatorUtils;
import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.UpdateGroup;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.entity.Tongji;
import io.renren.modules.sys.form.PasswordForm;
import io.renren.modules.sys.service.EmailLogService;
import io.renren.modules.sys.service.SysUserRoleService;
import io.renren.modules.sys.service.SysUserService;
import org.apache.commons.lang.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 系统用户
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("/email/log")
public class EmailLogController extends AbstractController {
    @Autowired
    private EmailLogService emailLogService;

    /**
     * 所有邮件列表
     */
    @GetMapping("/list")
    public JsonResult list(@RequestParam Map<String, Object> params){
        if(getUserId() != Constant.SUPER_ADMIN){
            params.put("emailUserId", getUserId());
        }
        PageUtils page = emailLogService.queryPage(params);

        return JsonResult.success(page);
    }

    /**
     * 今日邮件
     */
    @GetMapping("/emailTodayTotal")
    public JsonResult emailTodayTotal(){

        Integer total = emailLogService.emailTodayTotal();
        return JsonResult.success(total);
    }

    /**
     * 送达概率
     */
    @GetMapping("/sendRate")
    public JsonResult sendRate(){

        Integer total = emailLogService.sendRate();
        return JsonResult.success(total);
    }

    /**
     * 过去7天的发送详情（包括今天）
     */

    @GetMapping("/lastWeekDeatils")
    public JsonResult lastWeekDeatils(){
        return emailLogService.lastWeek();
    }

    /**
     * 过去7天的发送详情（包括今天）
     */

    @GetMapping("/lastYearDeatils")
    public JsonResult lastYearDeatils(){
        return emailLogService.lastYear();
    }

}