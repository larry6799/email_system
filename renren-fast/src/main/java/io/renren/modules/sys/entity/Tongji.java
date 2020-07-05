package io.renren.modules.sys.entity;

import java.io.Serializable;

/**
 * @author zhangrui
 * @date 2020-03-22 11:53
 */
public class Tongji implements Serializable {
    private String belongTime;
    private int stepNum;

    public Tongji(String belongTime, int stepNum) {
        this.belongTime = belongTime;
        this.stepNum = stepNum;
    }

    public void setBelongTime(String belongTime) {
        this.belongTime = belongTime;
    }

    public void setStepNum(int stepNum) {
        this.stepNum = stepNum;
    }

    public String getBelongTime() {
        return belongTime;
    }

    public int getStepNum() {
        return stepNum;
    }

    @Override
    public String toString() {
        return "{" +
                "belongTime='" + belongTime + '\'' +
                ", stepNum=" + stepNum +
                '}';
    }
}