package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.JsonResult;
import io.renren.common.utils.PageUtils;
import io.renren.modules.sys.entity.EmailLogEntity;

import java.util.Map;

public interface EmailLogService extends IService<EmailLogEntity> {

    PageUtils queryPage(Map<String, Object> params);

    Integer emailTodayTotal();

    Integer sendRate();

    JsonResult lastWeek();

    JsonResult lastYear();
}