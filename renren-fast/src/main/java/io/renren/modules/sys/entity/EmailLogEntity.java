package io.renren.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 邮件日志
 */

@Data
@Setter
@Getter
@TableName("email_log")
public class EmailLogEntity implements Serializable{
    private static final long serialVersionUID = 1L;

    @TableId
    private Long id;
    //用户id
    private Long emailUserId;
    //邮件主题
    private String subject;
    //邮件内容
    private String content;
    //附件名称
    private String file;
    //发送邮箱
    private String sourceEmail;
    //接收邮箱
    private String toEmail;
    //创建时间
    private Date createTime;
    //是否成功
    private Integer success;

}