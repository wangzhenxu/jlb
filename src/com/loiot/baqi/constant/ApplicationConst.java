package com.loiot.baqi.constant;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

/**
 * 公用静态常量
 * @author FrancisJin
 * @since 2012-01-14
 */
public class ApplicationConst {
	
	/**
	 * 项目相关参数
	 */
	private static ResourceBundle appBundle = PropertyResourceBundle.getBundle("conf/application");
	
    /**
     * 文件上传路径
     */
    public static final String UPLOAD_PIC_PATH=appBundle.getString("cms.upload.pic.path");
    /**
     * 文件访问地址
     */
    public static final String UPLOAD_PIC_URL=appBundle.getString("cms.upload.pic.url");
    /**
     * wagang平台访问地址
     */
    public static final String WAGANG_URL=appBundle.getString("wagang.url");
    /**
     * yunjian平台访问地址
     */
    public static final String YUNJIAN_URL=appBundle.getString("yunjian.url");
    
    /**
     * 登录yunjian的clientId,目前和wagang一直
     */
    public static final String CLIENT_ID=appBundle.getString("user.clientId");
  	
    /**
     * 应用中心图片的默认存放位置
     */
    public static final String APP_UPLOAD_PIC_PATH=appBundle.getString("app.upload.pic.path");
    /**
     * 应用中心图片url
     */
    public static final String APP_UPLOAD_PIC_URL=appBundle.getString("app.upload.pic.url");

    
    /**
     * 产品文件上传路径
     */
    public static final String PRODUCT_PIC_PATH=appBundle.getString("product.upload.pic.path");
    /**
     * 产品文件访问地址
     */
    public static final String PRODUCT_PIC_URL=appBundle.getString("product.upload.pic.url");
    


    public static final String MP_URL_PREFIX=appBundle.getString("mp.url");
    //	消费类网关产品ID
   	public static List<Long> GATEWAY_PRODUCT_ID_LIST=new ArrayList<Long>();
//   	消费类节点产品ID
   	public static List<Long> NODE_PRODUCT_ID_LIST=new ArrayList<Long>();
    
    static{
		String IDs=appBundle.getString("gateway.product.id");
		String nodeProductIds=appBundle.getString("node.product.id");
		String[] idArray=IDs.split(",");
		String[] nodeProductArr=nodeProductIds.split(",");
		
		for(String id: idArray){
			GATEWAY_PRODUCT_ID_LIST.add(new Long(id));
		}
		for(String id: nodeProductArr){
			NODE_PRODUCT_ID_LIST.add(new Long(id));
		}
			
	}

	public static void main(String args[]){
      // System.out.println(appBundle.getString("product.upload.pic.path"));
	    
	  String s =   "http://m2.loiot.com/customer/list.action";
	 System.out.println(s.substring(s.indexOf("/customer/"), s.length()));

	}
}
