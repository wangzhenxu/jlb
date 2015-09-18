package com.loiot.baqi.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.loiot.baqi.constant.URLConst;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.ProductService;
import com.timeloit.pojo.ProductClazz;

/**
 * @author ZhangBo
 * 
 */
@Controller
@RequestMapping(value = "/product/class")
public class ProductClassController {
    public static final AjaxResponse CLASS_NOT_DEL= new AjaxResponse(-400101, "该分类下存在产品不可删除");
    public static final AjaxResponse CLASS_NOT_ADD= new AjaxResponse(-400102, "* 分类已存在不可添加");
    public static final AjaxResponse CLASS_INPUT_NULL= new AjaxResponse(-400103, "* 请填写分类名称");
    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Resource
    private ProductService productService;

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
       Pager<ProductClazz> pager = productService.getProClassListByName(name,pageIndex);
        model.put("clazzes", pager.getData());
        model.put("pager", pager);
        model.put("name", name);
        model.put("menuClass", "productClass");
        return "/product/product_classlist";
    }

    /**
     * 产品类别添加To_Page
     * 
     * @param model
     * @param name
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toadd")
    public String toAddProClass() throws Exception {
        return "/product/addproduct_class";
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
    public Object addProClass(@RequestParam(value = "addname") String name) throws Exception {
        if(null!=name&&!"".equals(name.trim())){
            if(productService.isAddClass(name)){
                productService.addProClazz(name);
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
    public Object deleteProClass(@RequestParam(value = "pcid") int pcid,HttpServletResponse response) throws Exception {
        if(productService.isDeleteClass(pcid)){
            productService.deleteProClazz(pcid);
            return AjaxResponse.OK;
        }else{
           return CLASS_NOT_DEL;
        }
    }

    
    
    /**
     * 产品类别修改To_Page
     * 
     * @param model
     * @param pcid
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toupdate", method = RequestMethod.GET)
    public String toUpdateProClass(@RequestParam(value = "name") String name, @RequestParam(value = "pcid") long pcid,
            ModelMap model) throws Exception {
        model.put("name", name);
        model.put("pcid", pcid);
        return "/product/updateproduct_class";

    }

    /**
     * 产品类别修改Sub
     * 
     * @param model
     * @param pcid
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateProClass(@RequestParam(value = "updatename") String name,
            @RequestParam(value = "pcid") long pcid) throws Exception {
        ProductClazz prodClazz = new ProductClazz();
        prodClazz.setPcId(pcid);
        prodClazz.setName(name);
        productService.updateProClazz(prodClazz);
        return URLConst.REDIRECT_PRO_CLASS_URL;
    }

}
