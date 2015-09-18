package com.loiot.baqi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.loiot.baqi.constant.ApplicationConst;
import com.loiot.baqi.constant.FtlUtil;
import com.loiot.baqi.constant.URLConst;
import com.loiot.baqi.controller.request.ProductRequesthandler;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.ProductService;
import com.loiot.commons.utils.StringUtil;
import com.timeloit.pojo.Customer;
import com.timeloit.pojo.Product;
import com.timeloit.pojo.ProductActionAlert;
import com.timeloit.pojo.ProductAttribute;
import com.timeloit.pojo.ProductClazz;
import com.timeloit.pojo.ProductCommandGroup;
import com.timeloit.pojo.ProductCondition;
import com.timeloit.pojo.ProductPanel;

/**
 * @author ZhangBo
 * 
 */
@Controller
@RequestMapping(value = "/product/management")
public class ProductController {

    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Resource
    private ProductService productService;

    /**
     * 产品列表
     * 
     * @param model
     * @param name
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getProClassList(ModelMap model,@RequestParam(value="name", defaultValue="",required=false) String name,@RequestParam(value = "pi", defaultValue = "0") int pageIndex) throws Exception {
        Pager<Product>   pager= productService.getProductListByName(name,pageIndex);
        model.put("productlist", pager.getData());
        model.put("pager", pager);
        model.put("name", name);
        model.put("menuClass", "productManage");
//        ProductCommandGroup
        return "/product/productlist";
    }

    
    /** 去产品添加页面
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toAddNKeyPro",method = RequestMethod.GET)
    public String toadd(ModelMap model,@RequestParam(value="key", defaultValue="0",required=false) int key) throws Exception {
       List<ProductClazz> classes=productService.getProClazzList();
       List<Customer> customers=productService.getCustomerList();
       model.put("classes", classes);
       model.put("customers", customers);
       model.put("menuClass", "productManage");
       if(key==0){
    	   return "/product/toAddNKeyPro";
       }else
        return "/product/toAddKeyPro";
    }
    
    
    /**
     * 无Key产品添加
     * @param model
     * @param productRequesthandler
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/addNKeyPro",method = RequestMethod.POST)
    public String addNKeyPro(ModelMap model,ProductRequesthandler productRequesthandler,@RequestParam(value="ui-upload-input") MultipartFile imgFile) throws Exception {
        Long productId= productService.addProduct(productRequesthandler,imgFile);
        if(productRequesthandler.getProduct().getHasKey()==0){
        	 return "redirect:/product/management/toUpdateAttribute.action?productId=" + productId;
        }else  return URLConst.REDIRECT_PRODUCT_URL;
       
    }
    
    
    /**无Key产品编辑
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toUpdateNKeyPro",method={RequestMethod.GET,RequestMethod.POST})
    public String toUpdateNKeyPro(ModelMap model,@RequestParam(value="productId") long productId,@RequestParam(value="actionType",defaultValue="0") int actionType) throws Exception {
        Product product= productService.getProductInfo_Class_TagById(productId);
        List<ProductClazz> classes=productService.getProClazzList();
        model.put("classes", classes);
        model.put("product", product);
        if(actionType==0){
        	 return "/product/toUpdateNKeyPro";
        }else return "/product/productEdit";
       
    }
    
    
    /**无Key产品编辑
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/toEdit",method={RequestMethod.GET,RequestMethod.POST})
    public AjaxResponse toEdit(ModelMap model,@RequestParam(value="productId") long productId,@RequestParam(value="actionType",defaultValue="0") int actionType) throws Exception {
        Product product= productService.getProductInfo_Class_TagById(productId);
        List<ProductClazz> classes=productService.getProClazzList();
        Map<String, Object> letterMap = new HashMap<String, Object>();
		letterMap.put("classes", classes);
		letterMap.put("product", product);
		letterMap.put("UPLOAD_PIC_URL", ApplicationConst.PRODUCT_PIC_URL);
		return new AjaxResponse(1,FtlUtil.getInstance().getContent("productEdit.ftl", letterMap)) ;
       
    }
    
    /**
     * 修改产品
     * @param model
     * @param productRequesthandler
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(ProductRequesthandler productRequesthandler,@RequestParam(value="ui-upload-input") MultipartFile imgFile) throws Exception {
    	Long productId=productRequesthandler.getProduct().getProductId();
    	productService.updateProduct(productRequesthandler,imgFile);
    	if(StringUtil.isEmpty(productRequesthandler.getActionType())){
            return "redirect:/product/management/toUpdateAttribute.action?productId=" + productId;
        }
    	else{
    	    return "redirect:/product/management/toupdate.action?productId=" + productId;
    	}
    	
    }
    
    
    /**去产品详情页
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toProductInfo",method={RequestMethod.GET,RequestMethod.POST})
    public String toProductInfo(ModelMap model,@RequestParam(value="productId") long productId) throws Exception {
    	  Product product= productService.getProductInfo_Class_TagById(productId);
    		 model.put("productinfo", product);
    		 return "/product/productInfo";
    }
  
    
    /**属性编辑
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toUpdateAttribute",method={RequestMethod.GET,RequestMethod.POST})
    public String toUpdateAttribute(ModelMap model,@RequestParam(value="productId") long productId,@RequestParam(value="actionType",defaultValue="0") int actionType) throws Exception {
    	List<ProductAttribute> attributes=productService.getProduct_Attribute(productId);
    	List<ProductCondition> conditions=productService.selectProductCondition(productId);
    	model.put("productId",productId);
    	model.put("attributes", attributes);
    	model.put("conditions", conditions);
    	if(actionType==0){
    		 return "/product/toUpdateAttribute";
    	}else return "/product/attributeEdit";
       
    }
    
    /**保存属性
     * @param productRequesthandler
     * @param addType
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/AddAttribute",method={RequestMethod.GET,RequestMethod.POST})
    public String AddAttribute(ProductRequesthandler productRequesthandler) throws Exception {
    	productService.updateProductAttribute(productRequesthandler);
    	Long productId=productRequesthandler.getProduct().getProductId();
    	if("2".equals(productRequesthandler.getActionType())){
    		  return "redirect:/product/management/toAttributeInfo.action?productId=" + productId;
    		  
    	}else if("1".equals(productRequesthandler.getActionType())){
    		return "redirect:/product/management/toAddtCommand.action?productId=" + productId;
    	}else  return URLConst.REDIRECT_PRODUCT_URL;
    		
    }
    
    
    /**去产品属性详情页
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toAttributeInfo",method={RequestMethod.GET,RequestMethod.POST})
    public String toAttributeInfo(ModelMap model,@RequestParam(value="productId") long productId) throws Exception {
    	List<ProductAttribute> attributes=productService.getProduct_Attribute(productId);
    	model.put("productId",productId);
    	model.put("attributes", attributes);
        return "/product/attributeInfo";
    }
    
    
    /**命令编辑
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toAddtCommand",method={RequestMethod.GET,RequestMethod.POST})
    public String toAddtCommand(ModelMap model,@RequestParam(value="productId") Long productId,@RequestParam(value="actionType",defaultValue="0") int actionType) throws Exception {
    	List<ProductCommandGroup> Commands=productService.getProduct_CommandLGroup(productId);
    	List<ProductAttribute> attributes=productService.getProduct_Attribute(productId);
    	ProductPanel panel=productService.getProduct_Panel(productId);
        model.put("attributes", attributes);
    	model.put("CommandGroups", Commands);
        model.put("productId",productId);
        model.put("panel",panel);
        if(actionType==0){
        	  return "/product/toAddtCommand";
        }else return "/product/commandEdit";
      
    }
    
    
    /**保存命令编辑
     * @param productRequesthandler
     * @param addType
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/AddCommand",method={RequestMethod.GET,RequestMethod.POST})
    public String AddCommand(ProductRequesthandler productRequesthandler) throws Exception {
    	productService.updateCommand(productRequesthandler);
    	Long productId=productRequesthandler.getProduct().getProductId();
    	if("2".equals(productRequesthandler.getActionType())){
    		return "redirect:/product/management/toCommandInfo.action?productId=" + productId;
    		  
    	}else if("1".equals(productRequesthandler.getActionType())){
    		return "redirect:/product/management/warn.action?productId=" + productId;
    	}
    	else  return URLConst.REDIRECT_PRODUCT_URL;
    }
    
    
    
    
    /**去产品命令详情页
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toCommandInfo",method={RequestMethod.GET,RequestMethod.POST})
    public String toCommandInfo(ModelMap model,@RequestParam(value="productId") long productId) throws Exception {
    	List<ProductCommandGroup> Commands=productService.getProduct_CommandLGroup(productId);
    	List<ProductAttribute> attributes=productService.getProduct_Attribute(productId);
        model.put("attributes", attributes);
    	model.put("CommandGroups", Commands);
        model.put("productId",productId);
        return "/product/commandInfo";
    }
    
    /**报警设置
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/warn",method={RequestMethod.GET,RequestMethod.POST})
    public String warn(ModelMap model,@RequestParam(value="productId") Long productId,@RequestParam(value="actionType",defaultValue="0") int actionType) throws Exception {
    	Product product=productService.getProductInfo_Class_TagById(productId);
    	List<ProductAttribute> attributes=productService.getProduct_Attribute(productId);
    	List<ProductCondition> conditions=productService.selectProductCondition(productId);
    	ProductActionAlert actionAlert=productService.selectProductActionAlert(productId);
    	model.put("conditions", conditions);
        model.put("actionAlert",actionAlert);
        model.put("attributes", attributes);
        model.put("productId",productId);
        model.put("product",product);
        model.put("productId",productId);
        if(actionType==0){
        	  return "/product/warn";
        }else return "/product/warnEdit";
      
    }
    
    
    
    /**保存报警设置
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/saveWarn",method={RequestMethod.GET,RequestMethod.POST})
    public String saveWarn(ProductRequesthandler productRequesthandler) throws Exception {
    	Long productId=productRequesthandler.getProduct().getProductId();
    	productService.saveWarn(productRequesthandler);
    	if("2".equals(productRequesthandler.getActionType())){
    		return "redirect:/product/management/toWarn.action?productId=" + productId;
    	}else  return URLConst.REDIRECT_PRODUCT_URL;
    	
    	
    }
    
    

    /**去报警设置详情页
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toWarn",method={RequestMethod.GET,RequestMethod.POST})
    public String toWarn(ModelMap model,@RequestParam(value="productId") long productId) throws Exception {
    	Product product= productService.getProductInfo_Class_TagById(productId);
        List<ProductAttribute> attributes=productService.getProduct_Attribute(productId);
    	List<ProductCondition> conditions=productService.selectProductCondition(productId);
    	ProductActionAlert actionAlert=productService.selectProductActionAlert(productId);
    	String conditionStr=productService.getContent(product, conditions, attributes);
    	model.put("conditionStr", conditionStr);
    	model.put("actionAlert",actionAlert);
        return "/product/warnInfo";
    }
    
    /**
     * 去更新产品页面
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toupdate",method = RequestMethod.GET)
    public String toupdate(ModelMap model,@RequestParam(value="productId") long productId) throws Exception {
        Product product= productService.getProductInfo_Class_TagById(productId);
        List<ProductAttribute> attributes=productService.getProduct_Attribute(productId);
        List<ProductCommandGroup> Commands=productService.getProduct_CommandLGroup(productId);
        ProductPanel panel=productService.getProduct_Panel(productId);
        StringBuffer panleHtml=productService.getpanelHTML(Commands);
        List<ProductClazz> classes=productService.getProClazzList();
    	List<ProductCondition> conditions=productService.selectProductCondition(productId);
    	ProductActionAlert actionAlert=productService.selectProductActionAlert(productId);
    	String conditionStr=productService.getContent(product, conditions, attributes);
    	model.put("conditions", conditions);
        model.put("actionAlert",actionAlert);
        model.put("classes", classes);
        model.put("productinfo", product);
        model.put("attributes", attributes);
        model.put("CommandGroups", Commands);
        model.put("panleHtml", panleHtml);
        model.put("panel", panel);
        model.put("conditionStr", conditionStr);
        model.put("menuClass", "productManage");
        return "/product/check";
    }
    
   
    
    /**
     * 产品查看
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/check",method = RequestMethod.GET)
    public String check(ModelMap model,@RequestParam(value="productId") long productId) throws Exception {
        
         Product product= productService.getProductInfo_Class_TagById(productId);
         List<ProductAttribute> attributes=productService.getProduct_Attribute(productId);
//         List<ProductCommand> Commands=productService.getProduct_command(productId);
         List<ProductCommandGroup> groupCommands=productService.getProduct_CommandLGroup(productId);
         ProductPanel panel=productService.getProduct_Panel(productId);
         StringBuffer panleHtml=productService.getpanelHTML(groupCommands);
         model.put("productinfo", product);
         model.put("attributes", attributes);
         model.put("Commands", groupCommands);
         model.put("panel", panel);
         model.put("panleHtml", panleHtml);
         model.put("menuClass", "productManage");
        return "/product/checkproduct";
    }
    
    /**
     * 产品删除
     * @param model
     * @param productId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(ModelMap model,@RequestParam(value="productId") long productId) throws Exception {
        productService.deleteProduct(productId);
        return URLConst.REDIRECT_PRODUCT_URL;
    }
    
    
    /**验证图片大小
     * @param imgFile
     * @return
     * @throws Exception 
     */
    @RequestMapping(method={RequestMethod.GET,RequestMethod.POST},value="/checkImage")
    public String checkImage(@RequestParam(value="ui-upload-input") MultipartFile imgFile) throws Exception {
    	if(imgFile.getSize()>1048576){
    		return "/product/maxUploadExceeded";
    	}else  
    		return "/product/UploadSuccess";
    }
	
}
