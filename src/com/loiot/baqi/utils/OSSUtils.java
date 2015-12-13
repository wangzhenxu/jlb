package com.loiot.baqi.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.ServiceException;
import com.aliyun.oss.model.CannedAccessControlList;
import com.aliyun.oss.model.GetObjectRequest;
import com.aliyun.oss.model.OSSObject;
import com.aliyun.oss.model.ObjectMetadata;
import com.loiot.baqi.constant.ApplicationConst;

public class OSSUtils {
	
	  // 使用默认的OSS服务器地址创建OSSClient对象。
    public static OSSClient client = new OSSClient(ApplicationConst.ALIYUN_OSS_ACCESS_ENDPOINT,ApplicationConst.ALIYUN_OSS_ACCESS_ID, ApplicationConst.ALIYUN_OSS_ACCESS_KEY);
    public static String bucketName="jlb"; 
    
    
    public  static void uploadFile(String key, String filename)
            throws OSSException, ClientException, FileNotFoundException {
        File file = new File(filename);
        
        //ensureBucket(client, bucketName);
        //setBucketPublicReadable(client, bucketName);

        ObjectMetadata objectMeta = new ObjectMetadata();
        objectMeta.setContentLength(file.length());
        // 可以在metadata中标记文件类型
        objectMeta.setContentType("image/jpeg");

        InputStream input = new FileInputStream(file);
        client.putObject("jlb2015", key, input, objectMeta);
    }
	
    private static void uploadFile(OSSClient client, String bucketName, String key, String filename)
            throws OSSException, ClientException, FileNotFoundException {
        File file = new File(filename);

        ObjectMetadata objectMeta = new ObjectMetadata();
        objectMeta.setContentLength(file.length());
        // 可以在metadata中标记文件类型
        objectMeta.setContentType("image/jpeg");

        InputStream input = new FileInputStream(file);
        client.putObject(bucketName, key, input, objectMeta);
    }
    
    // 创建Bucket.
    private static void ensureBucket(OSSClient client, String bucketName)
            throws OSSException, ClientException{

        try {
            // 创建bucket
            client.createBucket(bucketName);
        } catch (ServiceException e) {
            /*if (!OSSErrorCode.BUCKES_ALREADY_EXISTS.equals(e.getErrorCode())) {
                // 如果Bucket已经存在，则忽略
                throw e;
            }*/
        }
    }
    
 // 把Bucket设置为所有人可读
    private static void setBucketPublicReadable(OSSClient client, String bucketName)
            throws OSSException, ClientException {
        //创建bucket
        client.createBucket(bucketName);

        //设置bucket的访问权限，public-read-write权限
        client.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);
    }
    
    // 下载文件
    public static OSSObject getObject(String key)
            throws OSSException, ClientException {
        OSSObject obj = client.getObject(new GetObjectRequest("jlb2015", key));
        return obj;
        //InputStream input = obj.getObjectContent();
    }

}
