package io.renren.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.JsonResult;
import io.renren.modules.sys.entity.EmailUser;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface EmailUserService extends IService<EmailUser> {

    JsonResult importUserEmailAsExcel(String groupName, MultipartFile excel);

    JsonResult sendEmail(Map<String, Object> params, MultipartFile file);

    JsonResult sendNew(Map<String, Object> params, MultipartFile file);

    JsonResult getGroupList();

    JsonResult getGroupListByUserId(Long userId);

    Integer totalEmailUser();
}