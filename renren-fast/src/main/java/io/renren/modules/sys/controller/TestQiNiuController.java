package io.renren.modules.sys.controller;


import io.renren.common.utils.JsonResult;
import io.renren.common.utils.QiniuUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

/**
 * @author zhangrui
 * @date 2020-03-23 15:02
 */
@Controller
@RequestMapping("/qiniu")
public class TestQiNiuController {

    @Autowired
    QiniuUtils qiniuUtils;

    @RequestMapping("/toIndex")
    public String index() {
        return "img";
    }

    /*
     * 七牛云上传图片
     */

    @ResponseBody
    @RequestMapping(value = "/image", method = RequestMethod.POST)
    public JsonResult postUserInforUpDate(@RequestParam("file") MultipartFile file) throws IOException {

        if (!file.isEmpty()) {
            FileInputStream fileInputStream = (FileInputStream) file.getInputStream();
            String originalFilename = file.getOriginalFilename();
            String fileExtend = originalFilename.substring(originalFilename.lastIndexOf("."));
            //默认不指定key的情况下，以文件内容的hash值作为文件名
            String fileKey = UUID.randomUUID().toString().replace("-", "") + fileExtend;
            return JsonResult.success(qiniuUtils.upload(fileInputStream, fileKey));
        }
        return JsonResult.error("上传失败");
    }
}