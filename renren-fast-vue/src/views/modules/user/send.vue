<template>
  <div>
    <h3>邮件发送</h3>
    <el-form :model="formData" class="from-box">
      <el-form-item label="发送方式 :">
        <br>
        <el-switch
          v-model="formData.switchType"
          active-text="指定分组"
          :active-value="1"
          :inactive-value="0"
          inactive-text="随机发送"
        ></el-switch>
      </el-form-item>

      <el-form-item label="用户分组 :" v-if="formData.switchType==1">
        <br>
        <el-popover placement="right" width="400" trigger="click">
          <el-table :data="groupList" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column property="id" label="编号"></el-table-column>
            <el-table-column property="groupName" label="分组名"></el-table-column>
          </el-table>
          <el-button @click="openSelectGroupBefor" slot="reference" size="small">选择分组</el-button>
        </el-popover>
        <span class="tip">已选择 {{formData.groupIds.length}} 个分组</span>
      </el-form-item>

      <el-form-item label="邮件主题 :">
        <el-input v-model="formData.subject" placeholder="请输入邮件主题"></el-input>
      </el-form-item>

      <el-form-item label="邮件正文 :">
        <!-- 图片上传组件辅助-->
        <el-upload
          class="avatar-uploader"
          :action="serverUrl"
          multifile
          name="file"
          :headers="header"
          :show-file-list="false"
          :on-success="uploadSuccess"
          :on-error="uploadError"
          :before-upload="beforeUpload"
        ></el-upload>
        <quill-editor
          v-model="formData.content"
          ref="myQuillEditor"
          :options="editorOption"
          @change="onEditorChange($event)"
        ></quill-editor>
      </el-form-item>

      <el-form-item label="邮件附件 :" style="width: 30%;">
        <br>
        <el-upload
          ref="upload"
          action="https://jsonplaceholder.typicode.com/posts/"
          :limit="1"
          :on-success="hanldeUploadSuccess"
          :on-change="handleUploadChange"
          :on-remove="handleUploadRemove"
          :file-list="fileList"
          :auto-upload="false"
        >
          <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
        </el-upload>
      </el-form-item>

      <el-form-item align="center">
        <el-button type="success" @click="submit">确认发送</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>


<script>
 /* eslint-disable */
import Quill from 'quill'
const toolbarOptions = [
  ["bold", "italic", "underline", "strike"], // toggled buttons
  [{ header: 1 }, { header: 2 }], // custom button values
  [{ list: "ordered" }, { list: "bullet" }],
  [{ indent: "-1" }, { indent: "+1" }], // outdent/indent
  [{ direction: "rtl" }], // text direction
  [{ size: ["small", false, "large", "huge"] }], // custom dropdown
  [{ header: [1, 2, 3, 4, 5, 6, false] }],
  [{ color: [] }, { background: [] }], // dropdown with defaults from theme
  [{ font: [] }],
  [{ align: [] }],
  ["link", "image"],
  ["clean"]
];
export default {
  data() {
    return {
      formData: {
        groupIds: [],
        subject: null,
        content: "",
        file: null,
        switchType: 1
      },
      fileList: [],
      groupList: [],
      selectGroup: [],
      file: null ,//是否选择了附件上传
      quillUpdateImg: false, // 根据图片上传状态来确定是否显示loading动画，刚开始是false,不显示
      // content: null,
      editorOption: {
        placeholder: "",
        theme: "snow", // or 'bubble'
        modules: {
          toolbar: {
            container: toolbarOptions,
            handlers: {
              image: function(value) {
                if (value) {
                  // 触发input框选择图片文件
                  document.querySelector(".avatar-uploader input").click();
                } else {
                  this.quill.format("image", false);
                }
              }
            }
          }
        }
      },
      serverUrl: "http://localhost:8080/renren-fast/qiniu/image", // 这里写你要上传的图片服务器地址
      header: {
        token: this.$cookie.get("token")
      } // 有的图片服务器要求请求头需要有token
    };
  },
  mounted: function() {
    const vm = this;
    var Align = Quill.import("attributors/style/align");
    Align.whitelist = ["right", "center", "justify"];
    Quill.register(Align, true);
  },
  methods: {
    openSelectGroupBefor() {
      console.log("打开前的操作");
      this.getGroupList();
    },
    getGroupList() {
      this.$http.methods.get("/sys/user/get-group").then(result => {
        this.groupList = result;
      });
    },
    handleSelectionChange(val) {
      this.selectGroup = val;
      this.formData.groupIds.length = 0;
      val.forEach((item, index) => {
        console.log(item);
        this.formData.groupIds.push(item.id);
      });
    },
    hanldeUploadSuccess(response) {
      //附件上传成功后的
    },
    handleUploadChange(file, fileList) {
      //状态改变时
      this.file = file.raw;
    },
    handleUploadRemove() {
      this.file = null;
    },
    onEditorChange({ editor, html, text }) {
      //内容改变事件
      console.log("---内容改变事件---");
      this.formData.content = html;
      console.log(html);
    },
    // 富文本图片上传前
    beforeUpload() {
      // 显示loading动画
      this.quillUpdateImg = true;
    },

    uploadSuccess(res, file) {
      // res为图片服务器返回的数据
      // 获取富文本组件实例
      console.log(res);
      let quill = this.$refs.myQuillEditor.quill;
      // 如果上传成功
      if (res.errorCode == 0) {
        // 获取光标所在位置
        let length = quill.getSelection().index;
        // 插入图片  res.url为服务器返回的图片地址
        quill.insertEmbed(length, "image", res.result);
        // 调整光标到最后
        quill.setSelection(length + 1);
        // alert(this.content)
      } else {
        this.$message.error("图片插入失败");
      }
      // loading动画消失
      this.quillUpdateImg = false;
    },
    // 富文本图片上传失败
    uploadError() {
      // loading动画消失
      this.quillUpdateImg = false;
      this.$message.error("图片插入失败");
    },

    submit() {
        console.log("111");
        console.log(this.switchType);
        console.log(this.formData.groupIds);
        console.log(this.formData.subject);
        console.log(this.formData.content);
        
        if (!this.formData.subject) {
          this.$message.error("请输入主题");
          return;
        }
        if (!this.formData.content) {
          this.$message.error("请输入主内容");
          return;
        }
        if (this.formData.switchType && this.formData.groupIds.length<=0) {
          this.$message.error("请选择分组");
          return;
        }
        // this.$message({
        //   dangerouslyUseHTMLString: true,
        //   message: this.formData.content,
        //   showClose: true
        // });
        // this.$http({
        //     url: this.$http.adornUrl("/sys/send/new"),
        //     method: "post",
        //     data: this.$http.adornData({
        //       subject: this.formData.subject,
        //       switchType: this.formData.switchType,
        //       groupIds: this.formData.groupIds,
        //       content: this.formData.content,
        //       file: this.file
        //     })
        //   }).then(({ data }) => {
        //     if (data && data.code === 0) {
        //       console.log("1111111")
        //     } else {
        //       console.log("2333333")
        //     }
        //   });
        console.log(this.formData);
        let formModel = new FormData();
        if (this.file != null) {
          formModel.append("file", this.file);
        }
        let Base64 = require('js-base64').Base64;
        formModel.append(
          "dataJson",
          Base64.encode(JSON.stringify(this.formData))
        );
        let conf = {
          headers: {
            "Content-Type": "multipart/form-data",
            token: this.$cookie.get("token")
          }
        };
        let url = this.$http.adornUrl("/sys/send/new");
        this.$http.post(url, formModel, conf).then(({ data }) => {
          if (data.errorCode == 0) {
            this.$message.success("发送成功！");
          } else {
            this.$message.error(data.errorMessage);
          }
        });
      
    }
  }
};
</script>

<style lang="scss" scoped>
.ql-editor.ql-blank,
.ql-editor {
  height: 350px;
}
</style>
