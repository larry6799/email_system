package io.renren.modules.sys.entity;

import lombok.Builder;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.io.Serializable;


public class EmailTypeData implements Serializable {
    private String EmailType;
    private int Number;

    public EmailTypeData(String emailType, int number) {
        EmailType = emailType;
        Number = number;
    }

    public String getEmailType() {
        return EmailType;
    }

    public int getNumber() {
        return Number;
    }

    public void setEmailType(String emailType) {
        EmailType = emailType;
    }

    public void setNumber(int number) {
        Number = number;
    }

    @Override
    public String toString() {
        return "{" +
                "EmailType='" + EmailType + '\'' +
                ", Number=" + Number +
                '}';
    }
}