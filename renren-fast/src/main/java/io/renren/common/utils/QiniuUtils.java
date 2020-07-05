package io.renren.common.utils;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import lombok.extern.slf4j.Slf4j;

import java.io.FileInputStream;

/**
 * @author zhangrui
 * @date 2020-03-23 14:57
 */

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Client;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

/**
 * Created by Administrator on 2019/8/15.
 */
@Component
public class QiniuUtils {


    private String accessKey = "7n5MmF5M9zL6f8br2ht5IapDL_NL1iAuoiIETPGe";//上传凭证AccessKey

    private String secretKey = "tVAq9tX95zM4HyJlaW7J35npsWyB7oKSS3Zi4xEG";//上传凭证secretKey

    private String bucketName = "larry666";//存储空间名称

    private String fileDomain = "http://qamgq6pnv.bkt.clouddn.com";//使用的域名

    public String getAccessKey() {
        return accessKey;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public String getBucketName() {
        return bucketName;
    }

    public String getFileDomain() {
        return fileDomain;
    }

    private UploadManager uploadManager;
    private BucketManager bucketManager;
    private Configuration c;
    private Client client;
    // 密钥配置
    private Auth auth;

    public Client getClient(){
        if (client==null) {
            client=new Client(getConfiguration());
        }
        return client;
    }

    public BucketManager getBucketManager() {
        if (bucketManager == null) {
            bucketManager = new BucketManager(getAuth(), getConfiguration());
        }
        return bucketManager;
    }

    public UploadManager getUploadManager() {
        if (uploadManager == null) {
            uploadManager = new UploadManager(getConfiguration());
        }
        return uploadManager;
    }

    public Configuration getConfiguration() {
        if (c == null) {
            Zone z = Zone.zone0();
            c = new Configuration(z);
        }
        return c;
    }

    public Auth getAuth() {
        if (auth == null) {
            auth = Auth.create(getAccessKey(), getSecretKey());
        }
        return auth;
    }
    //简单上传模式的凭证
    public String getUpToken() {
        return getAuth().uploadToken(getBucketName());
    }
    //覆盖上传模式的凭证
    public String getUpToken(String fileKey) {
        return getAuth().uploadToken(getBucketName(), fileKey);
    }

    /**
     * 将本地文件上传
     * @param filePath 本地文件路径
     * @param fileKey 上传到七牛后保存的文件路径名称
     * @return String
     * @throws IOException
     */
    public String upload(String filePath, String fileKey) throws IOException {
        Response res;
        try {
            res = getUploadManager().put(filePath, fileKey, getUpToken(fileKey));
            // 解析上传成功的结果
            DefaultPutRet putRet = new Gson().fromJson(res.bodyString(), DefaultPutRet.class);
            return fileDomain + "/" + putRet.key;
        } catch (QiniuException e) {
            res = e.response;
            e.printStackTrace();
            return "上传失败";
        }
    }

    /**
     * 上传二进制数据
     * @param data
     * @param fileKey
     * @return String
     * @throws IOException
     */
    public String upload(byte[] data, String fileKey) throws IOException {
        Response res;
        try {
            res = getUploadManager().put(data, fileKey, getUpToken(fileKey));
            // 解析上传成功的结果
            DefaultPutRet putRet = new Gson().fromJson(res.bodyString(), DefaultPutRet.class);
            return fileDomain + "/" + putRet.key;
        } catch (QiniuException e) {
            res = e.response;
            e.printStackTrace();
            return "上传失败";
        }
    }

    /**
     * 上传输入流
     * @param inputStream
     * @param fileKey
     * @return String
     * @throws IOException
     */
    public String upload(InputStream inputStream, String fileKey) throws IOException {
        Response res;
        try {
            res = getUploadManager().put(inputStream, fileKey, getUpToken(fileKey),null,null);
            // 解析上传成功的结果
            DefaultPutRet putRet = new Gson().fromJson(res.bodyString(), DefaultPutRet.class);
            return fileDomain + "/" + putRet.key;
        } catch (QiniuException e) {
            res = e.response;
            e.printStackTrace();
            return "上传失败";
        }
    }

    /**
     * 删除文件
     * @param fileKey
     * @return
     * @throws QiniuException
     */
    public boolean delete(String fileKey) throws QiniuException {
        Response response = bucketManager.delete(this.getBucketName(), fileKey);
        return response.statusCode == 200 ? true:false;
    }

    /**
     * 获取公共空间文件
     * @param fileKey
     * @return String
     */
    public String getFile(String fileKey) throws Exception{
        String encodedFileName = URLEncoder.encode(fileKey, "utf-8").replace("+", "%20");
        String url = String.format("%s/%s", fileDomain, encodedFileName);
        return url;
    }

    /**
     * 获取私有空间文件
     * @param fileKey
     * @return String
     */
    public String getPrivateFile(String fileKey) throws Exception{
        String encodedFileName = URLEncoder.encode(fileKey, "utf-8").replace("+", "%20");
        String url = String.format("%s/%s", fileDomain, encodedFileName);
        Auth auth = Auth.create(accessKey, secretKey);
        long expireInSeconds = 3600;//1小时，可以自定义链接过期时间
        String finalUrl = auth.privateDownloadUrl(url, expireInSeconds);
        return finalUrl;
    }
}
