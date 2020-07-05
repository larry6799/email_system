package io.renren.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.exception.RRException;
import io.renren.common.utils.*;
import io.renren.modules.sys.dao.EmailLogDao;
import io.renren.modules.sys.dao.SysUserDao;
import io.renren.modules.sys.entity.EmailLogEntity;
import io.renren.modules.sys.entity.EmailUser;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.entity.Tongji;
import io.renren.modules.sys.service.EmailLogService;
import io.renren.modules.sys.service.SysRoleService;
import io.renren.modules.sys.service.SysUserRoleService;
import io.renren.modules.sys.service.SysUserService;
import io.swagger.models.auth.In;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.util.TextUtils;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.awt.*;
import java.util.*;
import java.util.List;


/**
 *
 * @author zhangrui
 */
@Log4j2
@Service("emailLogService")
public class EmailLogServiceImpl extends ServiceImpl<EmailLogDao, EmailLogEntity> implements EmailLogService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        Long emailUserId = (Long) params.get("emailUserId");
        String keyword = (String)params.get("keyword");
        if(StringUtils.isEmpty(keyword)){
            IPage<EmailLogEntity> page = this.page(
                    new Query<EmailLogEntity>().getPage(params,"id",false),
                    new QueryWrapper<EmailLogEntity>()
                            .eq(emailUserId!= null,"email_user_id", emailUserId)
            );
            return new PageUtils(page);
        }else{
            QueryWrapper<EmailLogEntity> emailWrapper = new QueryWrapper<>();
            emailWrapper.and(
                    wrapper -> wrapper.like("subject", keyword).
                            or().like("content", keyword).
                            or().like("file", keyword).
                            or().like("source_email", keyword).
                            or().like("to_email", keyword)
            );
            IPage<EmailLogEntity> page = this.page(
                    new Query<EmailLogEntity>().getPage(params,"id",false),emailWrapper
            );
            return new PageUtils(page);
        }

    }

    @Override
    public  Integer emailTodayTotal(){
        String today = DateUtils.today();
        return baseMapper.selectCount(new QueryWrapper<EmailLogEntity>().like("create_time",today));
    }

    @Override
    public Integer  sendRate(){
        Integer all = baseMapper.selectCount(new QueryWrapper<EmailLogEntity>());
        Integer fail = baseMapper.selectCount(new QueryWrapper<EmailLogEntity>().like("success",0));
        return Math.round((all-fail)*100/all);
    }

    @Override
    public JsonResult lastWeek(){
        HashMap<String, Object> map = new HashMap<>();
        ArrayList<String> cols = new ArrayList<>();
        cols.add("belongTime");
        cols.add("stepNum");
        map.put("columns",cols);
        List<String> day7 = DateUtils.lastWeek();
        List<Tongji> result = new ArrayList<>();
        for(int index=0; index<7; index++){
            String dayTime  = day7.get(index);
            Integer send = baseMapper.selectCount(new QueryWrapper<EmailLogEntity>().like("create_time",dayTime));
            Tongji tj = new Tongji(dayTime, send);
            result.add(tj);
        }
        map.put("rows",result);
        return JsonResult.success(map);
    }

    @Override
    public JsonResult lastYear(){
        HashMap<String, Object> map = new HashMap<>();
        ArrayList<String> cols = new ArrayList<>();
        cols.add("belongTime");
        cols.add("stepNum");
        map.put("columns",cols);
        List<String> month12 = DateUtils.lastYear();
        List<Tongji> result = new ArrayList<>();
        for(int index=11; index>=0; index--){
            String dayTime  = month12.get(index);
            Integer send = baseMapper.selectCount(new QueryWrapper<EmailLogEntity>().like("create_time",dayTime));
            Tongji tj = new Tongji(dayTime, send);
            result.add(tj);
        }
        map.put("rows",result);
        return JsonResult.success(map);
    }

}