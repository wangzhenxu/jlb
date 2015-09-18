package com.loiot.baqi.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.loiot.baqi.constant.ApplicationConst;
import com.loiot.baqi.constant.Const;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.ProductAppCatService;
import com.loiot.commons.utils.FileUtil;
import com.loiot.commons.utils.JsonUtil;
import com.timeloit.pojo.Account;
import com.timeloit.pojo.ProductApp;
import com.timeloit.pojo.ProductAppCat;

/**
 * 产品分类管理Control
 * @author wangzx
 */
@Controller
@RequestMapping(value = "/productApp/class")
public class ProductAppCatController {
    public static final AjaxResponse CLASS_NOT_DEL= new AjaxResponse(-400101, "该分类下存在产品不可删除");
    public static final AjaxResponse CLASS_NOT_ADD= new AjaxResponse(-400102, "* 分类已存在不可添加");
    public static final AjaxResponse CLASS_INPUT_NULL= new AjaxResponse(-400103, "* 请填写分类名称");
    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Resource
    private ProductAppCatService productAppCatService;
    // ******************************************** 产品分类相关接口 ******************************************** 

    /**
     * 产品类别列表
     * 
     * @param model
     * @param name
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getProClassList(ModelMap model,@RequestParam(value = "name",defaultValue="") String name,@RequestParam(value = "pi", defaultValue = "0") int pageIndex) throws Exception {
       Pager<ProductAppCat> pager = productAppCatService.getProClassListByName(name,pageIndex);
        model.put("clazzes", pager.getData());
        model.put("pager", pager);
        model.put("name", name);
        model.put("menuClass", "productDBClass");
        return "/productApp/product_classlist";
    }

    /**
     * 产品类别添加Sub
     * 
     * @param model
     * @param name
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object addProClass(@RequestParam(value = "addname") String name,HttpSession session) throws Exception {
        if(null!=name&&!"".equals(name.trim())){
            if(productAppCatService.isAddClass(name)){
                // 获得账号
                Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
                ProductAppCat cat = new ProductAppCat();
                cat.setName(name);
                cat.setAccountId(account.getAccountId());
                productAppCatService.addProClazz(cat);
                
                //生成左侧菜单json数据
                List<ProductAppCat> catList = this.productAppCatService.queryCatCascadeProduct_List();
                String catListJson =JsonUtil.toJson(catList);
                FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+"cms/product_left.json", catListJson);
                return AjaxResponse.OK;
            }
            return CLASS_NOT_ADD;
        }
        return CLASS_INPUT_NULL;
    }
    
    /**
     * 删除产品类别
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    @ResponseBody
    public Object deleteProClass(@RequestParam(value = "pcid") long pcid,HttpServletResponse response) throws Exception {
        
        if(this.productAppCatService.isDeleteClass(pcid)){
            productAppCatService.deleteProClazz(pcid);
            
            //生成左侧菜单json数据
            List<ProductAppCat> catList = this.productAppCatService.queryCatCascadeProduct_List();
            String catListJson =JsonUtil.toJson(catList);
            FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+"cms/product_left.json", catListJson);
            
            return AjaxResponse.OK;
        } else {
            return this.CLASS_NOT_DEL;
        }
        
       
    }

    /**
     * 产品类别修改Sub
     * 
     * @param model
     * @param pcid
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Object updateProClass(@RequestParam(value = "updatename") String name,
            @RequestParam(value = "pcid") long pcid) throws Exception {
        if(null!=name&&!"".equals(name.trim())){
            if(productAppCatService.isAddClass(name)){
                ProductAppCat prodClazz = new ProductAppCat();
                prodClazz.setPacId(pcid);
                prodClazz.setName(name);
                productAppCatService.updateProClazz(prodClazz);
                
                //生成左侧菜单json数据
                List<ProductAppCat> catList = this.productAppCatService.queryCatCascadeProduct_List();
                String catListJson =JsonUtil.toJson(catList);
                FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+"cms/product_left.json", catListJson);
                
                return AjaxResponse.OK;
            } else 
            {
                return this.CLASS_NOT_ADD;
            }
        }
        return this.CLASS_INPUT_NULL;
    }
    // ******************************************** 产品相关接口 ******************************************** 

    /**
     * 根据产品分类查询产品
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "getPoductAppByPacId", method = RequestMethod.GET)
    @ResponseBody
    public Object getPoductAppByPacId(ModelMap model,@RequestParam(value = "pacId") long pacId,HttpServletResponse response) throws Exception {
        List<ProductApp> list = this.productAppCatService.getPoductAppByPacId(pacId);
        model.put("productAppList", list);
        return model;
    }

}
