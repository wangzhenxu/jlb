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
import org.springframework.web.multipart.MultipartFile;

import com.loiot.baqi.constant.URLConst;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.ProductService;
import com.timeloit.pojo.Product;
import com.timeloit.pojo.ProductBatch;

/**
 * @author ZhangBo
 * 
 */
@Controller
@RequestMapping(value = "/product/serialnumber")
public class SerialNumberController {

    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Resource
    private ProductService productService;

    
    /**
     * 产品序列号信息
     * @param model
     * @param productname
     * @param createdate
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model,@RequestParam(value="productname",required=false,defaultValue="") String productname,
            @RequestParam(value="createdate",required=false,defaultValue="") String createdate,
            @RequestParam(value = "pi", defaultValue = "0") int pageIndex,HttpSession session) throws Exception {
        Pager<ProductBatch> pager= productService.getProduct_Batch(productname, createdate,pageIndex);
        List<Product> products= productService.getProductName();
        model.put("productBatchs", pager.getData());
        model.put("products", products);
        model.put("pager", pager);
        model.put("productname", productname);
        model.put("createdate", createdate);
        model.put("menuClass", "snManage");
        String reun= (String) session.getAttribute("reun");
        session.removeAttribute("reun");
        model.put("reun", reun);
        return "/product/serial/seriallist";
    }
    
    /**生成序列号
     * @param productBatch
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/create",method = RequestMethod.POST)
    public String create(ProductBatch productBatch,HttpSession session) throws Exception {
        productService.create(productBatch,session);
        return URLConst.REDIRECT_SERIALNUMBER_URL;
    }
    
    /**下载序列号
     * @param response
     * @param pbId
     */
    @RequestMapping(value = "/downLoadSN",method = RequestMethod.GET)
    public void downLoadSN(HttpServletResponse response,@RequestParam(value="pbId") long pbId){
        productService.downLoadProductSn(pbId,response);
    }
    
    /**上传序列号
     * @param model
     * @param productBatch
     * @param file
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    public String upload(ModelMap model,ProductBatch productBatch,
    		@RequestParam(value="file") MultipartFile file,
    		HttpSession session) throws Exception {
    	productService.uploadSn(productBatch, model, file,session);
        return URLConst.REDIRECT_SERIALNUMBER_URL;
    }
    
    
    /**删除序列号
     * @param pbId
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/deleteProductSn",method = {RequestMethod.POST,RequestMethod.GET})
    public Object deleteProductSn(@RequestParam(value="pbId",required=false,defaultValue="") long pbId) throws Exception {
    	return productService.deleteSnValue(pbId);
         
    }
}
