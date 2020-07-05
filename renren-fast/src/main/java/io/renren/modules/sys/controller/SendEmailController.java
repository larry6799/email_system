package io.renren.modules.sys.controller;

import io.renren.common.utils.JsonResult;
import io.renren.modules.sys.service.EmailUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

import static io.renren.common.utils.ShiroUtils.getUserId;

/**
 * @Author chenzedeng
 * @Email yustart@foxmail.com
 * @Create 2020-02-23 7:59 下午
 */
@RestController
@RequestMapping("/sys/send")
public class SendEmailController {

    @Autowired
    private EmailUserService emailUserService;

    /**
     * 发送邮件的操作
     *
     * @param params
     * @param file
     * @return
     */
    @PostMapping
    public JsonResult sendEmail(@RequestParam Map<String, Object> params, MultipartFile file) {
        return emailUserService.sendEmail(params, file);
    }

    @PostMapping("/new")
    public JsonResult sendNew(@RequestParam  Map<String, Object> params,  MultipartFile file) {
        return emailUserService.sendNew(params, file);
    }
}