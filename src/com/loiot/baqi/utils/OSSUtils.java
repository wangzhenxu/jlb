package com.loiot.baqi.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.ServiceException;
import com.aliyun.oss.model.CannedAccessControlList;
import com.aliyun.oss.model.GetObjectRequest;
import com.aliyun.oss.model.OSSObject;
import com.aliyun.oss.model.ObjectMetadata;
import com.loiot.baqi.constant.ApplicationConst;
import com.loiot.commons.utils.DateUtil;

public class OSSUtils {
	
	  // 使用默认的OSS服务器地址创建OSSClient对象。
    public static OSSClient client = new OSSClient(ApplicationConst.ALIYUN_OSS_ACCESS_ENDPOINT,ApplicationConst.ALIYUN_OSS_ACCESS_ID, ApplicationConst.ALIYUN_OSS_ACCESS_KEY);
    
    /**
     * key jl/java/2015/12/28/sadfsafsdf-java-004.doc
 filePath  C:/Users/Administrator/git/jlb/WebRoot/upfile/temp/个人简历 - 杨培.doc
	 file  个人简历 - 杨培.doc
     * @param key
     * @param filePath
     * @param fileName
     * @throws OSSException
     * @throws ClientException
     * @throws FileNotFoundException
     */
    public  static void uploadFile(String key, String filePath,String fileName)
            throws OSSException, ClientException, FileNotFoundException {
        File file = new File(filePath);
        
        //ensureBucket(client, ApplicationConst.ALIYUN_OSS_ACCESS_BOCKETNAME);
        //setBucketPublicReadable(client, ApplicationConst.ALIYUN_OSS_ACCESS_BOCKETNAME);

        ObjectMetadata objectMeta = new ObjectMetadata();
        objectMeta.setContentLength(file.length());
        HashMap<String,String> map = new HashMap<String,String>();
        map.put("filename", fileName);
        objectMeta.setUserMetadata(map);
        // 可以在metadata中标记文件类型
        objectMeta.setContentType(getContentType(fileName));

        InputStream input = new FileInputStream(file);
        client.putObject(ApplicationConst.ALIYUN_OSS_ACCESS_BOCKETNAME, key, input, objectMeta);
    }
    
   
    
    
    
   
    public  static String uploadFile(String fileDirectPrefix, MultipartFile multipartFile)
            throws OSSException, ClientException, FileNotFoundException {
    	 String fileName =  multipartFile.getOriginalFilename();  
    	 String directoryName = OSSUtils.generateFileDirectoryName();
         String newFileName = OSSUtils.generateFileName(fileName);
         
         CommonsMultipartFile cf= (CommonsMultipartFile)multipartFile; //这个myfile是MultipartFile的
         DiskFileItem fi = (DiskFileItem)cf.getFileItem(); 
         File file = fi.getStoreLocation();
         uploadFile(fileDirectPrefix+directoryName+newFileName, file.getAbsolutePath(), newFileName);
         return ApplicationConst.ALIYUN_OSS_ACCESS_DOMAIN+fileDirectPrefix+directoryName+newFileName;
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
        OSSObject obj = client.getObject(new GetObjectRequest(ApplicationConst.ALIYUN_OSS_ACCESS_BOCKETNAME, key));
        return obj;
        //InputStream input = obj.getObjectContent();
    }
    
    public static  String getContentType(String name){
    	String conentType="";
    	String suffix = name.substring(name.lastIndexOf("."));
    	if(suffix.toLowerCase().equals(".docx") || suffix.toLowerCase().equals(".doc")){
    		conentType= "application/msword";
    	} else 
		if(suffix.toLowerCase().equals(".gif")){
    		conentType= "image/gif";
    	}else 
		if(suffix.toLowerCase().equals(".jpeg") || suffix.toLowerCase().equals(".jpg") ){
    		conentType= "image/gif";
    	}else 
		if(suffix.toLowerCase().equals(".png")){
    		conentType= "image/png";
    	}
    	
    	return conentType;
    }
    
    // 删除文件
    public static void deleteObject(String key)
            throws OSSException, ClientException {
           client.deleteObject(ApplicationConst.ALIYUN_OSS_ACCESS_BOCKETNAME, key);
           //InputStream input = obj.getObjectContent();
    }
    
    public static String generateFileDirectoryName(){
    	 Date currDate = new Date();
    	 String dirName =DateUtil.getYear(currDate)+ "/"+DateUtil.getMonth(currDate)+"/"+DateUtil.getDay(currDate)+"/";
    	 return dirName;
    }
    
    public static String generateFileName(String fileName){
    	return DateUtil.toString(new Date(), DateUtil.FILE_FORMAT)+"_"+fileName;
    }
    
    

}
