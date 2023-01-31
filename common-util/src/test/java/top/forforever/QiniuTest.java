package top.forforever;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.junit.Test;

import java.util.UUID;

/**
 * @create: 2023/1/24
 * @Description:
 * @FileName: QiniuTest
 * @自定义内容：
 */
public class QiniuTest {

    private final static String accessKey = "XaZpmmXFGweJlhNJHXUaLYsfXPdc403cB9Jhja0U";
    //密钥
    private final static String secretKey = "EKdZvs63Mkmpfm3VyMObE5hqY31ISq7FCOygTgn6";
    //名称空间
    private final static String bucket = "shf21120312";
    /*
    测试文件上传
        Zone.zone0():华东
        Zone.zone1():华北
        Zone.zone2():华南
     */
    @Test
    public void testUpload() {
        //构造一个带指定 Region 对象的配置类
        Configuration cfg = new Configuration(Zone.zone2());
//        cfg.resumableUploadAPIVersion = Configuration.ResumableUploadAPIVersion.V2;// 指定分片上传版本
        //...其他参数参考类注释

        UploadManager uploadManager = new UploadManager(cfg);
        //...生成上传凭证，然后准备上传
        /*
            String accessKey = "XaZpmmXFGweJlhNJHXUaLYsfXPdc403cB9Jhja0U";
            String secretKey = "EKdZvs63Mkmpfm3VyMObE5hqY31ISq7FCOygTgn6";
        */
        //名称空间
        //String bucket = "shf21120312";
        //如果是Windows情况下，格式是 D:\\qiniu\\test.png
        String localFilePath = "D:\\java\\前端\\桌面壁纸\\雷锋同学\\R-C.jfif";
        //默认不指定key的情况下，以文件内容的hash值作为文件名
        String substring = localFilePath.substring(localFilePath.lastIndexOf("."));
        System.out.println("substring = " + substring);
        String key = null;

        Auth auth = Auth.create(accessKey, secretKey);
        String upToken = auth.uploadToken(bucket);

        try {
            Response response = uploadManager.put(localFilePath, key, upToken);
            //解析上传成功的结果
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            System.out.println(putRet.key);
            System.out.println(putRet.hash);
        } catch (QiniuException ex) {
            Response r = ex.response;
            System.err.println(r.toString());
            try {
                System.err.println(r.bodyString());
            } catch (QiniuException ex2) {
                //ignore
            }
        }
    }
    /*
        测试删除
     */
    @Test
    public void testDelete(){
        //构造一个带指定 Region 对象的配置类
        Configuration cfg = new Configuration(Zone.zone2());
//...其他参数参考类注释
        String key = "zms3.jpg";
        Auth auth = Auth.create(accessKey, secretKey);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.delete(bucket, key);
        } catch (QiniuException ex) {
            //如果遇到异常，说明删除失败
            System.err.println(ex.code());
            System.err.println(ex.response.toString());
        }
    }

    @Test
    public void testUUID(){
        String uuid = UUID.randomUUID().toString();
        System.out.println("uuid = " + uuid);
    }
}
