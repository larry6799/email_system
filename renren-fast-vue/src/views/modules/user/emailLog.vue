<template>
  <div>
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="keyword" placeholder="请输入关键词" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
      </el-form-item>
    </el-form>

    <el-table border :data="dataList" style="width: 100%">
      <el-table-column prop="id" label="编号" width="80"></el-table-column>
      <el-table-column prop="emailUserId" label="操作者id" width="100"></el-table-column>
      <el-table-column prop="subject" label="邮件标题" width="100"></el-table-column>
      <el-table-column prop="content" label="邮件内容" width="100">
        <template slot-scope="scope">
          <!-- <el-button type="text" @click="open(scope.row.content)">点击打开</el-button> -->
          <el-button @click="openDialog(scope.row)" size="small">查看内容</el-button>
        </template>
      </el-table-column>
      <el-table-column prop="file" label="附件名称" width="180"></el-table-column>
      <el-table-column prop="sourceEmail" label="发送邮箱" width="180"></el-table-column>
      <el-table-column prop="toEmail" label="接收邮箱" width="180"></el-table-column>
      <el-table-column prop="createTime" label="时间" width="180"></el-table-column>
      <el-table-column prop="success" label="是否成功" width="180">
        <template slot-scope="scope">
          <span v-if="scope.row.success">是</span>
          <span v-else>否</span>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog title="邮件内容" :visible.sync="dialog" width="40%">
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialog = false">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 分页部分 -->
    <el-pagination
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageIndex"
      :page-sizes="[10, 20, 50, 100]"
      :page-size="pageSize"
      :total="totalPage"
      layout="total, sizes, prev, pager, next, jumper"
    ></el-pagination>

    <!-- 邮件内容dialog -->
    <el-dialog title="邮件正文" :visible.sync="dialogVisible" width="60%">
      <div v-html="dialogContent.content"></div>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
/* eslint-disable */

export default {
  data() {
    return {
      dataList: [],
      dialogVisible: false,
      dialogContent: {},
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      keyword: ""
    };
  },

  methods: {
    formatter(row, column) {
      return row.address;
    },
    // open(content) {
    //   this.$alert(content, "邮件信息", {
    //     dangerouslyUseHTMLString: true
    //   });
    // },
    openDialog(rowData) {
      this.dialogContent = rowData;
      this.dialogVisible = true;
    },
    // 每页数
    sizeChangeHandle(val) {
      console.log(val);
      this.pageSize = val;
      this.pageIndex = 1;
      this.getDataList();
    },
    // 当前页
    currentChangeHandle(val) {
      console.log(val);
      this.pageIndex = val;
      this.getDataList();
    },
    getDataList() {
    },
    // 获取数据列表
    getDataList() {
      this.$http({
        url: this.$http.adornUrl("/email/log/list"),
        method: "get",
        params: this.$http.adornParams({
          page: this.pageIndex,
          limit: this.pageSize,
          keyword: this.keyword
        })
      }).then(({ data }) => {
        console.log(data.errorCode);
        if (data && data.errorCode == 0) {
          console.log("1");
          this.dataList = data.result.list;
          console.log(this.dataList);
          this.totalPage = data.result.totalCount;
        } else {
          this.dataList = [];
          this.totalPage = 0;
        }
      });
    }
  },
  created() {
    this.getDataList();
  }
};
</script>
