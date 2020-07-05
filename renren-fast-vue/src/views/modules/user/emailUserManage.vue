<template>
  <div>
        
          <el-header>
            <el-button  size="medium" type="success" @click="handleImportClick">导入营销分组</el-button>
            <el-button  size="medium" type="danger"  @click="deleteGroup" >删除营销分组</el-button>
          </el-header>
        
    <el-container class="c1-box"> 
      <el-aside class="aside">
        
        <ul>
          <li
            :class="currentGroupId==item.id?'item active':'item'"
            v-for="item in groupList"
            :key="item.id"
          >
            <el-button @click="handleGroupClick(item)" type="text">{{item.groupName}}</el-button>
          </li>
        </ul>
      </el-aside>

      <el-main class="main" v-if="currentGroupId">
        <div class="action">
          <h2>分组: {{currentGroup.groupName}}</h2>
          
        </div>
        <el-table :data="tableData" stripe style="width: 100%">
          <el-table-column prop="username" label="姓名"></el-table-column>
          <el-table-column prop="email" label="邮箱"></el-table-column>
          <el-table-column prop="createTime" label="创建时间"></el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scope">
              <el-button size="mini" type="danger" @click="handleDelete(scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>

        <div align="center">
          <el-pagination
            @current-change="getUserList"
            :current-page.sync="currentPage"
            :page-size="pageSize"
            layout="total,prev, pager, next"
            :total="total"
          ></el-pagination>
        </div>
      </el-main>

      <p v-else align="center">暂无数据</p>
    </el-container>

    <el-dialog title="上传导入Excel表格数据" :visible.sync="dialog" width="30%">
      <div>
        <el-form :model="formModel" ref="form" :rules="rules">
          <el-form-item label="分组名" prop="groupName">
            <el-input placeholder="请输入分组名称" v-model="formModel.groupName"></el-input>
          </el-form-item>
          <el-form-item>
            <el-upload
              :action="action"
              :limit="1"
              :data="formModel"
              name="file"
              ref="upload"
              :on-success="uploadSuccess"
              :before-upload="beforeUpload"
              :file-list="fileList"
              :auto-upload="false"
            >
              <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
              <div slot="tip" class="el-upload__tip">只能上传xlsl文件，且不超过5MB</div>
            </el-upload>
          </el-form-item>
        </el-form>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialog = false">取 消</el-button>
        <el-button type="primary" @click="importSubmit">开始导入</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
/* eslint-disable */
export default {
  data() {
    return {
      groupList: [],

      currentGroupId: null,
      tableData: [],
      currentPage: 1,
      pageSize: 10,
      total: 0,

      dialog: false,

      currentGroup: {},

      formModel: {
        groupName: null
      },
      rules: {
        groupName: [
          { required: true, message: "请输入分组名称", trigger: "blur" }
        ]
      },
      fileList: [],
      action: ""
    };
  },
  created() {
    this.action = this.$http.adornUrl("/sys/user/import");
    this.formModel.token = this.$cookie.get("token");
    this.getGroupList();
  },
  methods: {
    handleImportClick() {
      this.dialog = true;
      this.fileList = [];
    },
    getGroupList() {
      this.$http.methods.get("/sys/user/get-group").then(result => {
        this.groupList = result;
        if (result.length != 0) {
          this.currentGroupId = result[0].id;
          this.currentGroup = result[0];
          this.getUserList(1);
        }
      });
    },
    handleGroupClick(item) {
      this.currentGroupId = item.id;
      this.currentGroup = item;
      this.getUserList(1);
    },
    handleDelete(item) {
      //删除User
      this.$http.methods
        .post("/sys/user/delete-user", {
          userId: item.id
        })
        .then(result => {
          this.$message.success("删除成功");
          this.getUserList(1);
        });
    },
    getUserList(page) {
      this.$http.methods
        .get("/sys/user/get-user-group", {
          current: this.currentPage,
          size: this.pageSize,
          groupId: this.currentGroupId
        })
        .then(result => {
          this.tableData = result.records;
          this.currentPage = result.current;
          this.total = result.total;
          this.pageSize = result.size;
        });
    },
    beforeUpload(file) {
      let name = file.name;
      console.log(name);
      if (name.indexOf(".xlsx") != 0) {
        return true;
      }
      this.$message.error("文件格式不正确");
      return false;
    },
    importSubmit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.$refs.upload.submit();
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    uploadSuccess(response) {
      if (response.errorCode == 0) {
        this.$message.success("上传成功");
        this.dialog = false;
        this.$refs.upload.clearFiles();
        this.getGroupList();
      } else {
        this.$message.error(response.errorMessage);
      }
    },
    deleteGroup() {
      //删除分组
      this.$confirm(
        "此操作将永久删除该分组以及分组下的用户信息, 是否继续?",
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }
      ).then(() => {
        this.$http.methods
          .post("/sys/user/delete-group", {
            groupId: this.currentGroupId
          })
          .then(result => {
            if(result){
                this.$message.success("删除成功");
                this.getGroupList();
            }else{  
                this.$message.error("权限不足");
                this.getGroupList();
            }        
          });
      });
    }
  }
};
</script>

<style lang="scss" scoped>
.c1-box {
  //   border: 1px solid #eee;
  margin-top: 30px;
  .aside {
    width: 300px;
    ul,
    li {
      list-style: none;
      padding: 0px;
      margin: 0px;
    }
    .item {
      border: 1px solid #e4e7ed;
      border-radius: 3px;
      margin-bottom: 1px;
      padding: 10px;
      text-align: center;
    }
    .active {
      background-color: #ebeef5;
    }
  }

  .main {
    padding-left: 50px;
    .action {
      margin-bottom: 20px;
    }
  }
}
</style>