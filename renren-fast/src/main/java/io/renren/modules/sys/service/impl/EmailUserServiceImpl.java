package io.renren.modules.sys.service.impl;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.hutool.core.codec.Base64;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.extra.mail.MailAccount;
import cn.hutool.extra.mail.MailUtil;
import cn.hutool.setting.dialect.Props;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.exception.UserException;
import io.renren.common.utils.EmailUtils;
import io.renren.common.utils.JsonResult;
import io.renren.common.utils.ShiroUtils;
import io.renren.modules.sys.dao.EmailUserDao;
import io.renren.modules.sys.entity.EmailLogEntity;
import io.renren.modules.sys.entity.EmailUser;
import io.renren.modules.sys.entity.UserExcel;
import io.renren.modules.sys.entity.UserGroup;
import io.renren.modules.sys.service.EmailLogService;
import io.renren.modules.sys.service.EmailUserService;
import io.renren.modules.sys.service.UserGroupService;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Service
@Transactional(rollbackFor = Exception.class)
@Log4j2
public class EmailUserServiceImpl extends ServiceImpl<EmailUserDao, EmailUser> implements EmailUserService {

	@Autowired
	private UserGroupService userGroupService;

	@Autowired
	private EmailLogService emailLogService;

	@Override
	public JsonResult getGroupList() {
		List<UserGroup> list = userGroupService.list();
		System.out.println(list);
		return JsonResult.success(list);
	}

	/**
	 * 查询所有营销客户
	 *
	 * @return
	 */
	@Override
	public Integer totalEmailUser(){
		return baseMapper.selectCount(new QueryWrapper<EmailUser>());
	}


	/**
	 * 查询操作用户的group
	 *
	 * @param userId
	 * @return
	 */
	@Override
	public JsonResult getGroupListByUserId(Long userId) {
		HashMap map0 = new HashMap();
		map0.put("user_id", 1);
		List<UserGroup> list0 = userGroupService.listByMap(map0);

		HashMap map1 = new HashMap();
		map1.put("user_id", userId);
		List<UserGroup> list1 = userGroupService.listByMap(map1);
		System.out.println(list1);

		list0.addAll(list1);

		return JsonResult.success(list0);
	}


	/**
	 * 导入邮件
	 *
	 * @param groupName
	 * @param excel
	 * @return
	 */
	@Override
	public JsonResult importUserEmailAsExcel(String groupName, MultipartFile excel) {
		//判断文件是否为空
		if (excel == null || excel.isEmpty()) {
			return JsonResult.error("请上传文件");
		}
		log.info("上传原始文件名称:{}", excel.getOriginalFilename());

		//比对文件的后缀名称
		if (!excel.getOriginalFilename().endsWith(".xlsx")) {
			return JsonResult.error("请上传Excel文件 后缀仅支持.xlsx");
		}
		File tmpDir = FileUtil.getTmpDir();
		File target = new File(tmpDir, IdUtil.randomUUID() + ".xlsx");
		try {
			// 保存文件至target
			excel.transferTo(target);

			// 读取Excel
			ImportParams params = new ImportParams();
			params.setHeadRows(1);
			List<UserExcel> colList = ExcelImportUtil.importExcel(target,UserExcel.class, params);

			if (colList.isEmpty()) {
				return JsonResult.error("读取失败-文件内容不可为空");
			}
			//创建用户组
			UserGroup userGroup = new UserGroup();
			userGroup.setGroupName(groupName);
			userGroup.setUserId(ShiroUtils.getUserId());
			boolean save = userGroupService.save(userGroup);
			if (!save) {
				throw new UserException("创建分组失败");
			}
			if (userGroup.getId() == null) {
				throw new UserException("获取分组ID为空");
			}
			int allCount = colList.size();
			int successCount = 0;
			int errorCount = 0;
			log.info("操作者：" + ShiroUtils.getUserId());
			for (UserExcel userExcel : colList) {
				if (StringUtils.isEmpty(userExcel.getEmail())) {
					errorCount++;
				} else {
					successCount++;
					//读取成功的
					EmailUser emailUser = new EmailUser();
					emailUser.setEmail(userExcel.getEmail());
					emailUser.setUsername(userExcel.getUsername());
					emailUser.setGroupId(userGroup.getId());
					save = this.save(emailUser);
					if (!save) {
						throw new UserException("循环读取失败:" + userExcel);
					}
				}
			}
			return JsonResult.success(StrUtil.format("读取总数据:{}条,成功:{}条,失败:{}条", allCount, successCount, errorCount));
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (target != null && target.exists()) {
				target.delete();
			}
		}
		return JsonResult.error("导入Excel失败!");
	}


	/**
	 * 邮件发送的操作
	 *
	 * @param params
	 * @param file
	 * @return
	 */
	@Override
	public JsonResult sendEmail(Map<String, Object> params, MultipartFile file) {
		return JsonResult.actionSuccess();
	}


	/**
	 * 邮件发送的操作
	 *
	 * @param params
	 * @param file
	 * @return
	 */
	@Override
	public JsonResult sendNew(Map<String, Object> params, MultipartFile file) {
		String jsonData = MapUtils.getString(params, "dataJson");
		if (StringUtils.isBlank(jsonData)) {
			return JsonResult.errorForEmpty();
		}
		jsonData = Base64.decodeStr(jsonData);
		JSONObject json = JSONObject.parseObject(jsonData);
		log.info("参数:{}", json.toJSONString());
		List<Integer> groupId = new ArrayList<>();
		List<String> emailTo = new ArrayList<>();

		//判断是否是随机发送的
		if (json.getIntValue("switchType") == 1) {
			groupId = json.getJSONArray("groupIds").toJavaList(Integer.class);
			if (groupId.isEmpty()) {
				return JsonResult.error("没有选择分组,发送失败");
			}
		} else {
			//随机发送
			emailTo.addAll(EmailUtils.getSomeEmail(10));
		}

		String subject = json.getString("subject");
		String content = json.getString("content");
		if (StringUtils.isBlank(subject) || StringUtils.isBlank(content)) {
			return JsonResult.errorForEmpty();
		}

		List<EmailUser> emailUserList = new ArrayList<>();
		for (Integer id : groupId) {
			QueryWrapper wrapper = new QueryWrapper();
			wrapper.eq("group_id", id);
			emailUserList.addAll(this.list(wrapper));
		}
		for (int i = 0; i < emailUserList.size(); i++) {
			emailTo.add(emailUserList.get(i).getEmail());
		}

		if (emailTo.isEmpty()) {
			return JsonResult.error("没有用户数据");
		}

		EmailLogEntity emailLogEntity = new EmailLogEntity();
		emailLogEntity.setEmailUserId(ShiroUtils.getUserId());
		emailLogEntity.setSubject(subject);
		emailLogEntity.setContent(content);

		File dest = null;
		//判断是否上传了附件
		if (file != null && !file.isEmpty()) {
			File tmpDir = FileUtil.getTmpDir();
			String originName = file.getOriginalFilename();
			emailLogEntity.setFile(originName);
			dest = new File(tmpDir, originName);
			try {
				file.transferTo(dest);
				log.info("附件上传成功:{}", dest.getAbsolutePath());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		//发送邮件操作
		Props props = new Props("email_config.properties");
		MailAccount account1 = new MailAccount();
		account1.setFrom(props.getStr("email1.email"));
		account1.setPass(props.getStr("email1.password"));
		MailAccount account2 = new MailAccount();
		account2.setFrom(props.getStr("email2.email"));
		account2.setPass(props.getStr("email2.password"));

		List<EmailUser> step1 = new ArrayList<>();
		List<EmailUser> step2 = new ArrayList<>();
		boolean control = false;


		int success = 0;
		int failed = 0;

		String formail1 = props.getStr("email1.email");
		String formail2 = props.getStr("email2.email");

		if (dest != null) {

			for (int i = 0; i < emailTo.size(); i++) {
				if (control) {
					try {
						emailLogEntity.setSourceEmail(formail1);
						emailLogEntity.setToEmail(emailTo.get(i));

						MailUtil.send(account1, emailTo.get(i),
								subject,
								content,
								true, dest);

						emailLogEntity.setSuccess(1);
						log.info("发送成功" + " " +  i + " "+  emailLogEntity.toString());
						emailLogService.save(emailLogEntity);
					} catch (Exception e) {
						emailLogEntity.setSuccess(0);
						log.info("发送失败" + " "+ emailLogEntity.toString());
						emailLogService.save(emailLogEntity);
					}

				} else {
					try {
						emailLogEntity.setSourceEmail(formail2);
						emailLogEntity.setToEmail(emailTo.get(i));

						MailUtil.send(account2, emailTo.get(i),
								subject,
								content,
								true, dest);

						emailLogEntity.setSuccess(1);
						log.info("发送成功" + " "+ i + " "+ emailLogEntity.toString());
						emailLogService.save(emailLogEntity);

					} catch (Exception e) {
						emailLogEntity.setSuccess(0);
						log.info("发送失败" +  " " +  emailLogEntity.toString());
						emailLogService.save(emailLogEntity);
					}
				}
				control = !control;
			}
		} else {
			for (int i = 0; i < emailTo.size(); i++) {
				if (control) {
					try {
						emailLogEntity.setSourceEmail(formail1);
						emailLogEntity.setToEmail(emailTo.get(i));

						MailUtil.send(account1, emailTo.get(i),
								subject,
								content,
								true);

						emailLogEntity.setSuccess(1);
						log.info("发送成功" + " "+  i + " "+  emailLogEntity.toString());
						emailLogService.save(emailLogEntity);
					} catch (Exception e) {
						emailLogEntity.setSuccess(0);
						log.info("发送失败" + " "+  emailLogEntity.toString());
						emailLogService.save(emailLogEntity);
					}

				} else {
					try {
						emailLogEntity.setSourceEmail(formail2);
						emailLogEntity.setToEmail(emailTo.get(i));

						MailUtil.send(account2, emailTo.get(i),
								subject,
								content,
								true);

						emailLogEntity.setSuccess(1);
						log.info("发送成功" + " " +  i + " "+ emailLogEntity.toString());
						emailLogService.save(emailLogEntity);
					} catch (Exception e) {
						emailLogEntity.setSuccess(0);
						log.info("发送失败" + " "+  emailLogEntity.toString());
						emailLogService.save(emailLogEntity);
					}
				}
				control = !control;
			}
		}

		//        send(subject, content, dest, account1, step1);
		//        send(subject, content, dest, account2, step2);

		if (dest != null) {
			dest.delete();
		}

		return JsonResult.actionSuccess();
	}


}
