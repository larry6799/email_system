package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.JsonResult;
import io.renren.modules.sys.entity.UserGroup;

public interface UserGroupService extends IService<UserGroup> {

    JsonResult deleteGroup(Integer groupId);

    JsonResult emailType();
}