<template>
  <div>
    <!-- <button @click="getData">get Data</button> -->
    <div>
      <br />
      <br />
      <div class="tableTitle">
        <span class="midText">总体概括</span>
      </div>
      <br />
      <br />
      <br />
      <br />
      <el-row :gutter="150" type="flex" class="cspace-around">
        <el-col :span="6">
          <el-card class="box-card">
            <p class="card-p">系统用户</p>
            <p class="card-h0">{{this.p_string1}}</p>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card class="box-card">
            <p class="card-p">今日邮件</p>
            <p class="card-h1">{{this.p_string2}}</p>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card class="box-card">
            <p class="card-p">营销客户</p>
            <p class="card-h2">{{this.p_string3}}</p>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card class="box-card">
            <p class="card-p">送达概率</p>
            <p class="card-h3">{{this.p_string4}}%</p>
          </el-card>
        </el-col>
      </el-row>
      <br />
      <br />
      <br />
      <br />
    </div>

    <div>
      <br />
      <br />
      <div class="tableTitle">
        <span class="midText">邮件营销客户邮箱分析</span>
      </div>
      <br />
      <br />
      <br />
      <br />
      <ve-pie :data="chartDataEmailType"></ve-pie>
    </div>

    <div>
      <br />
      <br />
      <div class="tableTitle">
        <span class="midText">最近7天邮件发送量统计</span>
      </div>
      <br />
      <br />
      <br />
      <br />
      <ve-line
        :data="chartData"
        :loading="loading"
        :data-empty="dataEmpty"
        :settings="chartSettings"
      ></ve-line>
    </div>


    <div>
      <br />
      <br />
      <div class="tableTitle">
        <span class="midText">过去12个月发送邮件量统计</span>
      </div>
      <br />
      <br />
      <br />
      <br />
      <ve-histogram  :data="chartDataYear" :settings="chartYearSettings" :extend="extendYear"></ve-histogram>
    </div>
  </div>  
    
</template>

<script>
/* eslint-disable */
import "echarts/lib/component/title";
import axios from "axios";
const DATA_FROM_BACKEND = {
  columns: ["belongTime", "stepNum"],
  rows: [
    { belongTime: "2018-09-24", stepNum: "100" },
    { belongTime: "2018-09-25", stepNum: "134" }
  ]
};
const EMPTY_DATA = {
  columns: [],
  rows: []
};
export default {
  data() {
    this.chartSettings = {
      labelMap: {
        belongTime: "时间",
        stepNum: "发送邮件数目"
      }
    };
    this.chartYearSettings = {
      itemStyle: {
        barBorderRadius: 5
      },
      labelMap: {
        belongTime: "月份",
        stepNum: "发送邮件数目"
      }
      // barMaxWidth : 4
    };
    this.extendYear = {
        series(v) {
            // console.log("v", v);
            // 设置柱子的样式
            v.forEach(i => {
              console.log("series", i);
              i.barWidth = 25;
              i.itemStyle={
                barBorderRadius:[5,5,5,5],
                color:'#e0a2c1',
                borderWidth:0,
              };
              i.label={
                color:'#666',
                show:true,
                position:'top',
                // backgroundColor:'yellow',
              };

            });
            return v;
          },
    };
    return {
      p_string1: 0,
      p_string2: 0,
      p_string3: 0,
      p_string4: 0,
      fits: ["fill", "contain", "cover", "none", "scale-down"],
      url:
        "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg",
      chartData: {
        columns: [],
        rows: []
      },
      chartDataEmailType : {
        // series: [
        //   {
        //     barCateGoryGap: 20
        //   }
        // ],
        columns: ["EmailType", "Number"],
        rows: [
          { EmailType: "QQ邮箱", Number: 1393 },
          { EmailType: "163邮箱", Number: 1393 },
          { EmailType: "126邮箱", Number: 134 },
          { EmailType: "gmail邮箱", Number: 344 },
          { EmailType: "foxmail邮箱", Number: 564 },
          { EmailType: "其他邮箱", Number: 764 }
        ]
      },
      chartDataYear: {
        columns: ["日期", "发送量"],
        rows: [
          { 日期: "1月", 发送量: 6393 },
          { 日期: "2月", 发送量: 4530 },
          { 日期: "3月", 发送量: 5423 },
          { 日期: "4月", 发送量: 7393 },
          { 日期: "5月", 发送量: 4340 },
          { 日期: "6月", 发送量: 3643 },
          { 日期: "7月", 发送量: 9653 },
          { 日期: "8月", 发送量: 2530 },
          { 日期: "9月", 发送量: 7423 },
          { 日期: "10月", 发送量: 6893 },
          { 日期: "11月", 发送量: 8530 },
          { 日期: "12月", 发送量: 4023 }
        ]
      },
      loading: false,
      dataEmpty: false
    };
  },
  methods: {
    // initYear(){
    //   var myChart = echarts.init(document.getElementById('year'));
    //   myChart.setOption({

    //   });
    // },
    getData() {
      var tokenn = this.$cookie.get("token");
      axios
        .get("http://127.0.0.1:8080/renren-fast/email/log//lastWeekDeatils", {
          params: {
            token: tokenn
          }
        })
        .then(response => {
          this.chartData = response.data.result;
        })
        .catch(function(err) {
          console.log(err);
        });

      axios
      .get("http://127.0.0.1:8080/renren-fast/email/log//lastYearDeatils", {
          params: {
            token: tokenn
          }
        })
        .then(response => {
          this.chartDataYear = response.data.result;
        })
        .catch(function(err) {
          console.log(err);
        });

      axios
        .get("http://127.0.0.1:8080/renren-fast/sys/user/total", {
          params: {
            token: tokenn
          }
        })
        .then(response => {
          this.p_string1 = response.data.total;
        })
        .catch(function(err) {
          console.log(err);
        });
      
      axios
        .get("http://127.0.0.1:8080/renren-fast/sys/user/emailType", {
          params: {
            token: tokenn
          }
        })
        .then(response => {
          this.chartDataEmailType = response.data.result;
        })
        .catch(function(err) {
          console.log(err);
        });

       

        axios
        .get("http://127.0.0.1:8080/renren-fast/email/log/emailTodayTotal", {
          params: {
            token: tokenn
          }
        })
        .then(response => {
          this.p_string2 = response.data.result;
        })
        .catch(function(err) {
          console.log(err);
        });

         axios
        .get("http://127.0.0.1:8080/renren-fast/sys/user/totalEmailUser", {
          params: {
            token: tokenn
          }
        })
        .then(response => {
          this.p_string3 = response.data.result;
        })
        .catch(function(err) {
          console.log(err);
        });

        axios
        .get("http://127.0.0.1:8080/renren-fast/email/log/sendRate", {
          params: {
            token: tokenn
          }
        })
        .then(response => {
          this.p_string4 = response.data.result;
        })
        .catch(function(err) {
          console.log(err);
        });
        
    }
  },
  created() {
    this.getData();
  }
};
</script>

<style lang="scss" scoped>
.tableTitle {
  position: relative;
  margin: 0 auto;
  width: 1100px;
  height: 1px;
  background-color: #d4d4d4;
  text-align: center;
  font-size: 16px;
  color: rgba(101, 101, 101, 1);
}
.midText {
  position: absolute;
  left: 50%;
  background-color: #ffffff;
  padding: 0 15px;
  transform: translateX(-50%) translateY(-50%);
}
.box-card {
  height: 170px;
}

.card-p {
  text-align: center;
}
.card-h0 {
  text-align: center;
  color: rebeccapurple;
  font-size: 40px;
}
.card-h1 {
  text-align: center;
  color: green;
  font-size: 40px;
}
.card-h2 {
  text-align: center;
  color: palevioletred;
  font-size: 40px;
}
.card-h3 {
  text-align: center;
  color: cadetblue;
  font-size: 40px;
}
</style>