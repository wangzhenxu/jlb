package com.loiot.baqi.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.ui.freemarker.FreeMarkerConfigurationFactoryBean;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.loiot.baqi.constant.ApplicationConst;
import com.loiot.baqi.constant.Const;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.CmsSolutionCatService;
import com.loiot.baqi.service.ProductAppCatService;
import com.loiot.baqi.service.ProductAppService;
import com.loiot.commons.utils.FileUtil;
import com.loiot.commons.utils.JsonUtil;
import com.timeloit.pojo.Account;
import com.timeloit.pojo.CmsSolutionCat;
import com.timeloit.pojo.ProductApp;
import com.timeloit.pojo.ProductAppCat;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 产品管理Control
 * @author wangzx
 */
@Controller
@RequestMapping(value = "/productApp/sub")
public class ProductAppController {
    
    public static final AjaxResponse NOT_DEL= new AjaxResponse(-400101, "该产品下存在关联不可删除");
    public static final AjaxResponse NOT_ADD= new AjaxResponse(-400102, "* 产品已存在不可添加");
    public static final AjaxResponse INPUT_NULL= new AjaxResponse(-400103, "* 请填写分类名称");
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
    private ProductAppService productAppService;
    @Resource
    private ProductAppCatService productAppCatService;
    @Resource
    private CmsSolutionCatService cmsSolutionCatService;

    /**
     * 产品类别列表
     * 
     * @param model
     * @param name
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getProductAppList(ModelMap model,@RequestParam(value = "name",defaultValue="") String name,@RequestParam(value = "cscId",defaultValue = "0") Long cscId,@RequestParam(value = "pi", defaultValue = "0") int pageIndex) throws Exception {
        Pager<ProductApp> pager = productAppService.getProductAppListByCondtion(name, cscId, pageIndex);
        model.put("productAppList", pager.getData());
        model.put("pager", pager);
        model.put("name", name);
        model.put("cscId", cscId);
        List<ProductAppCat> catList = productAppCatService.getProClazzList();
        model.put("catList", catList);
        model.put("menuClass", "productPublish");
        return "/productApp/productApp_list";
    }
    
    /**
     * 删除产品
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    @ResponseBody
    public Object deleteProductApp(@RequestParam(value = "paId") long paId) throws Exception {
            productAppService.deleteProductApp(paId);
            return AjaxResponse.OK;
        }
    
    /**
     * 更新发布状态
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "modifyPublishType", method = RequestMethod.GET)
    @ResponseBody
    public Object modifyPublishType(@RequestParam(value = "paId") long paId,@RequestParam(value = "publishType") int publishType) throws Exception {
            this.productAppService.modifyPublishType(paId, publishType);
            //生成左侧菜单json数据
            List<ProductAppCat> catList = this.productAppCatService.queryCatCascadeProduct_List();
            String catListJson =JsonUtil.toJson(catList);
            FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+"cms/product_left.json", catListJson);
            
            return AjaxResponse.OK;
        }
    
    /**
     * 去添加产品页面
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "toAdd", method = RequestMethod.GET)
    public Object toAddProductApp(ModelMap model) throws Exception {
        model.put("catList", this.productAppCatService.getProClazzList());
        model.put("menuClass", "productPublish");
        return "/productApp/add_productApp";
     }
    
    /**
     * 添加产品信息
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public Object addProductApp(ModelMap model,@ModelAttribute("addForm") ProductApp po,HttpSession session,HttpServletRequest request, @RequestParam("file1") CommonsMultipartFile file1, @RequestParam("file2") CommonsMultipartFile file2, @RequestParam("file3") CommonsMultipartFile file3) throws Exception {
        if(null!=po.getName()&&!"".equals(po.getName().trim())){
            Map pmap = new HashMap();
            pmap.put("name", po.getName());
            if(productAppService.isAdd(pmap)){
                Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
                po.setAccountId(account.getAccountId());
                if (file1!=null && !file1.isEmpty()) {
                    //创建一个文件
                    String file1Path="productApp/bigPic/"+new Date().getTime()+".jpg";
                    File newFile1 = FileUtil.createFile(ApplicationConst.UPLOAD_PIC_PATH+file1Path);

                    //将文件写到新的文件当中
                    file1.getFileItem().write(newFile1);
                    po.setBigPic(ApplicationConst.UPLOAD_PIC_URL+file1Path);
                }
                if (file2!=null && !file2.isEmpty()) {
                    //创建一个文件
                    String file1Path="productApp/smallPic/"+new Date().getTime()+".jpg";
                    File newFile1 = FileUtil.createFile(ApplicationConst.UPLOAD_PIC_PATH+file1Path);
                    //将文件写到新的文件当中
                    file2.getFileItem().write(newFile1);
                    po.setSmallPic(ApplicationConst.UPLOAD_PIC_URL+file1Path);
                }
                
                if (file3!=null && !file3.isEmpty()) {
                    String fileName = file3.getFileItem().getName();
                    fileName = fileName.length()==0 ? fileName : new Date().getTime()+"."+fileName.split("\\.")[1];
                    //创建一个文件
                    String file1Path="productApp/docUrl/"+fileName;
                    File newFile1 = FileUtil.createFile(ApplicationConst.UPLOAD_PIC_PATH+file1Path);
                    //将文件写到新的文件当中
                    file3.getFileItem().write(newFile1);
                    po.setDocUrl(ApplicationConst.UPLOAD_PIC_URL+file1Path);
                }
                po.setPublishType(0);
                Long paId = this.productAppService.addProductApp(po);
                
                /************************生存静态页面存到数据库中start***********************/
                //freeMaker处理
                FreeMarkerConfigurationFactoryBean bean =new FreeMarkerConfigurationFactoryBean();
                bean.setTemplateLoaderPath("classpath:/template/message/cms");
                Configuration config=bean.createConfiguration();
                Template template = config.getTemplate("product_detail.ftl" , "utf-8");
                
                //查询产品
                ProductApp po2 = this.productAppService.getProductApp_One(paId);
                
                HashMap<String,Object> params = new HashMap<String, Object>();
                params.put("ctx", ApplicationConst.WAGANG_URL);
                params.put("po", po2);
                //生成左侧菜单json数据
                params.put("leftJson", ApplicationConst.UPLOAD_PIC_URL+"cms/product_left.json");
                List<ProductAppCat> catList = this.productAppCatService.queryCatCascadeProduct_List();
                String catListJson =JsonUtil.toJson(catList);
                FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+"cms/product_left.json", catListJson);

                
               String content = FreeMarkerTemplateUtils.processTemplateIntoString(
                        template ,params );
                String staticUrl = "cms/productDetail/"+paId+".html";
                FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+staticUrl, content);
                po2.setStaticUrl(ApplicationConst.UPLOAD_PIC_URL+staticUrl);
                this.productAppService.updateProductApp(po2);
                /************************生存静态页面存到数据库中end***********************/
                
                model.put("backJson", JsonUtil.toJson(AjaxResponse.OK));
                return "/productApp/result";
            }
            model.put("backJson", JsonUtil.toJson(NOT_ADD));
            return "/productApp/result";
        }
        
        model.put("backJson", JsonUtil.toJson(INPUT_NULL));
        return "/productApp/result";
     }
    
    /**
     * 去修改产品页面
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "toEdit", method = RequestMethod.GET)
    public Object toEditProductApp(ModelMap model,@RequestParam(value="csId",defaultValue="0")Long csId) throws Exception {
        model.put("catList", this.productAppCatService.getProClazzList());
        ProductApp po = this.productAppService.getProductApp_One(csId);
        model.put("po",po);
        model.put("menuClass", "productPublish");
        return "/productApp/edit_productApp";
     }
    
    /**
     * 编辑产品信息
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public Object editProductApp(ModelMap model,@ModelAttribute("editForm") ProductApp po,HttpSession session,HttpServletRequest request,@RequestParam(value = "file1", required = true) CommonsMultipartFile file1, @RequestParam(value = "file2", required = true) CommonsMultipartFile file2, @RequestParam(value = "file3", required = true) CommonsMultipartFile file3) throws Exception {
        if(null!=po.getName()&&!"".equals(po.getName().trim())){
            Map pmap = new HashMap();
            pmap.put("name", po.getName());
            pmap.put("paId", po.getPaId());
            if(productAppService.isAdd(pmap)){
                Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
                po.setAccountId(account.getAccountId());
               //String a1=file1.getName();
               //String a2=file1.getOriginalFilename();
               //String a3=file1.getFileItem().getName();
               
                if (file1!=null && !file1.isEmpty()) {
                    //创建一个文件
                    String file1Path="productApp/bigPic/"+new Date().getTime()+".jpg";
                    File newFile1 = FileUtil.createFile(ApplicationConst.UPLOAD_PIC_PATH+file1Path);
                    //将文件写到新的文件当中
                    file1.getFileItem().write(newFile1);
                    po.setBigPic(ApplicationConst.UPLOAD_PIC_URL+file1Path);
                }
                if (file2!=null &&  !file2.isEmpty()) {
                    //创建一个文件
                    String file1Path="productApp/smallPic/"+new Date().getTime()+".jpg";
                    File newFile1 = FileUtil.createFile(ApplicationConst.UPLOAD_PIC_PATH+file1Path);
                    //将文件写到新的文件当中
                    file2.getFileItem().write(newFile1);
                    po.setSmallPic(ApplicationConst.UPLOAD_PIC_URL+file1Path);
                }
                if (file3!=null &&  !file3.isEmpty()) {
                     String fileName = file3.getFileItem().getName();
                     fileName = fileName.length()==0 ? fileName : new Date().getTime()+"."+fileName.split("\\.")[1];
                    
                    //创建一个文件
                    String file1Path="productApp/docUrl/"+fileName;
                    File newFile1 = FileUtil.createFile(ApplicationConst.UPLOAD_PIC_PATH+file1Path);
                    //将文件写到新的文件当中
                    file3.getFileItem().write(newFile1);
                    po.setDocUrl(ApplicationConst.UPLOAD_PIC_URL+file1Path);
                }
                
                this.productAppService.updateProductApp(po);
                
                /************************生存静态页面存到数据库中start***********************/
                //freeMaker处理
                FreeMarkerConfigurationFactoryBean bean =new FreeMarkerConfigurationFactoryBean();
                bean.setTemplateLoaderPath("classpath:/template/message/cms");
                Configuration config=bean.createConfiguration();
                Template template = config.getTemplate("product_detail.ftl" , "utf-8");
                
                //查询产品
                ProductApp po2 = this.productAppService.getProductApp_One(po.getPaId());
                
                HashMap<String,Object> params = new HashMap<String, Object>();
                params.put("ctx", ApplicationConst.WAGANG_URL);
                params.put("po", po2);
                //生成左侧菜单json数据
                params.put("leftJson", ApplicationConst.UPLOAD_PIC_URL+"cms/product_left.json");
                List<ProductAppCat> catList = this.productAppCatService.queryCatCascadeProduct_List();
                String catListJson =JsonUtil.toJson(catList);
                FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+"cms/product_left.json", catListJson);
                //生成静态页面
               String content = FreeMarkerTemplateUtils.processTemplateIntoString(
                        template ,params );
                String staticUrl = "cms/productDetail/"+po.getPaId()+".html";
                FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+staticUrl, content);
                po2.setStaticUrl(ApplicationConst.UPLOAD_PIC_URL+staticUrl);
                this.productAppService.updateProductApp(po2);
                /************************生存静态页面存到数据库中end***********************/
                model.put("backJson", JsonUtil.toJson(AjaxResponse.OK));
                return "/productApp/result";
            }
            model.put("backJson", JsonUtil.toJson(NOT_ADD));
            return "/productApp/result";
        }
        model.put("backJson", JsonUtil.toJson(INPUT_NULL));
        return "/productApp/result";
    }
    
    /**
     * 产品详细
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public Object detail(ModelMap model,@RequestParam(value="paId",defaultValue="0")Long paId) throws Exception {
        ProductApp po = this.productAppService.getProductApp_One(paId);
        model.put("po",po);
        model.put("menuClass", "productPublish");
        return "/productApp/productApp_detail";
     }
    
    /**
     * 生存
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    public void gener() throws Exception {
        ProductApp po = this.productAppService.getProductApp_One(2L);
        
     }
}
