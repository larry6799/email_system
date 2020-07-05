package io.renren.modules.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

@Data
public class UserExcel {

    @Excel(name = "username")
    private String username;

    @Excel(name = "email")
    private String email;

}