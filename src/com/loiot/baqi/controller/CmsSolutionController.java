package com.loiot.baqi.controller;

import java.util.ArrayList;
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

import com.loiot.baqi.constant.ApplicationConst;
import com.loiot.baqi.constant.Const;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.CmsSolutionCatService;
import com.loiot.baqi.service.CmsSolutionService;
import com.loiot.baqi.service.ProductAppCatService;
import com.loiot.commons.utils.FileUtil;
import com.loiot.commons.utils.JsonUtil;
import com.timeloit.pojo.Account;
import com.timeloit.pojo.CmsSolution;
import com.timeloit.pojo.CmsSolutionCat;
import com.timeloit.pojo.CmsSolutionProductMap;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 系统管理Control
 * @author wangzx
 */
@Controller
@RequestMapping(value = "/cmsSolution/sub")
public class CmsSolutionController {
    
    public static final AjaxResponse NOT_DEL= new AjaxResponse(-400101, "该系统下存在关联不可删除");
    public static final AjaxResponse NOT_ADD= new AjaxResponse(-400102, "* 系统已存在不可添加");
    public static final AjaxResponse INPUT_NULL= new AjaxResponse(-400103, "* 请填写分类名称");
    
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Resource
    private CmsSolutionCatService cmsSolutionCatService;
    @Resource
    private CmsSolutionService cmsSolutionService;
    @Resource
    private ProductAppCatService productAppCatService;

    /**
     * 系统类别列表
     * 
     * @param model
     * @param name
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getSolutionList(ModelMap model,@RequestParam(value = "name",defaultValue="") String name,@RequestParam(value = "cscId",defaultValue = "0") Long cscId,@RequestParam(value = "pi", defaultValue = "0") int pageIndex) throws Exception {
        Pager<CmsSolution> pager = cmsSolutionService.getSolutionListByCondtion(name, cscId, pageIndex);
        model.put("solutionList", pager.getData());
        model.put("pager", pager);
        model.put("name", name);
        model.put("cscId", cscId);
        List<CmsSolutionCat> catList = cmsSolutionCatService.getProClazzList();
        model.put("catList", catList);
        model.put("menuClass", "systemPublish");
        return "/cmsSolution/solution_list";
    }
    
    /**
     * 删除系统
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    @ResponseBody
    public Object deleteSolution(@RequestParam(value = "csId") long csId) throws Exception {
            cmsSolutionService.deleteSolution(csId);
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
    public Object modifyPublishType(@RequestParam(value = "csId") long csId,@RequestParam(value = "publishType") int publishType) throws Exception {
            this.cmsSolutionService.modifyPublishType(csId, publishType);
            //生成左侧菜单json数据
            List<CmsSolutionCat> catList = this.cmsSolutionCatService.getProduct_ClazzSocend_List();
            String catListJson =JsonUtil.toJson(catList);
            FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+"cms/sys_left.json", catListJson);
            
            return AjaxResponse.OK;
        }
    
    /**
     * 去添加系统页面
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "toAdd", method = RequestMethod.GET)
    public Object toAddSolution(ModelMap model) throws Exception {
        model.put("catList", this.cmsSolutionCatService.getProClazzList());
        model.put("productCatList", this.productAppCatService.getProClazzList());
        model.put("menuClass", "systemPublish");

        return "/cmsSolution/add_solution";
     }
    
    /**
     * 添加系统信息
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Object addSolution(ModelMap model,@ModelAttribute("addForm") CmsSolution po,HttpSession session,HttpServletRequest request) throws Exception {
        if(null!=po.getName()&&!"".equals(po.getName().trim())){
            Map pmap = new HashMap();
            pmap.put("name", po.getName());
            if(cmsSolutionService.isAddSolution(pmap)){
                //关联产品
                List <CmsSolutionProductMap> relationList = new ArrayList<CmsSolutionProductMap>();
                String paId [] = request.getParameterValues("paId");
                String paName [] = request.getParameterValues("paName");
                for(int i=0;i<paId.length;i++) {
                    CmsSolutionProductMap  map = new CmsSolutionProductMap();
                    map.setPaId(Long.parseLong(paId[i]));
                    map.setPaName(paName[i]);
                    relationList.add(map);
                }
                po.setRelationList(relationList);
                // 获得账号
                Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
                po.setAccountId(account.getAccountId());
                po.setPublishType(0);
                Long csId = this.cmsSolutionService.addSolution(po);
                /************************生存静态页面存到数据库中start***********************/
                //freeMaker处理
                FreeMarkerConfigurationFactoryBean bean =new FreeMarkerConfigurationFactoryBean();
                bean.setTemplateLoaderPath("classpath:/template/message/cms");
                Configuration config=bean.createConfiguration();
                Template template = config.getTemplate("system_detail.ftl" , "utf-8");
                
                //查询产品
                CmsSolution po2 = this.cmsSolutionService.getSolution_One(csId);
                
                HashMap<String,Object> params = new HashMap<String, Object>();
                params.put("ctx", ApplicationConst.WAGANG_URL);
                params.put("po", po2);
                params.put("leftJson", ApplicationConst.UPLOAD_PIC_URL+"cms/sys_left.json");
                //生生页面
                String content = FreeMarkerTemplateUtils.processTemplateIntoString(
                        template ,params );
                String staticUrl = "cms/systemDetail/"+csId+".html";
                FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+staticUrl, content);
                po2.setStaticUrl(ApplicationConst.UPLOAD_PIC_URL+staticUrl);
                this.cmsSolutionService.updateSolution(po2);
                
                //生成左侧菜单json数据
                List<CmsSolutionCat> catList = this.cmsSolutionCatService.getProduct_ClazzSocend_List();
                String catListJson =JsonUtil.toJson(catList);
                FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+"cms/sys_left.json", catListJson);
                /************************生存静态页面存到数据库中end***********************/

                
                
                return AjaxResponse.OK;
            }
            return NOT_ADD;
        }
        return INPUT_NULL;
     }
    
    /**
     * 去修改系统页面
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "toEdit", method = RequestMethod.GET)
    public Object toEditSolution(ModelMap model,@RequestParam(value="csId",defaultValue="0")Long csId) throws Exception {
        model.put("catList", this.cmsSolutionCatService.getProClazzList());
        model.put("productCatList", this.productAppCatService.getProClazzList());
        CmsSolution po = this.cmsSolutionService.getSolution_One(csId);
        model.put("po",po);
        model.put("menuClass", "systemPublish");

        return "/cmsSolution/edit_solution";
     }
    
    /**
     * 编辑系统信息
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    @ResponseBody
    public Object editSolution(ModelMap model,@ModelAttribute("editForm") CmsSolution po,HttpSession session,HttpServletRequest request) throws Exception {
        if(null!=po.getName()&&!"".equals(po.getName().trim())){
            Map pmap = new HashMap();
            pmap.put("name", po.getName());
            pmap.put("csId", po.getCsId());
            if(cmsSolutionService.isAddSolution(pmap)){
              //关联产品
                List <CmsSolutionProductMap> relationList = new ArrayList<CmsSolutionProductMap>();
                String paId [] = request.getParameterValues("paId");
                String paName [] = request.getParameterValues("paName");
                for(int i=0;i<paId.length;i++) {
                    CmsSolutionProductMap  map = new CmsSolutionProductMap();
                    map.setPaId(Long.parseLong(paId[i]));
                    map.setPaName(paName[i]);
                    relationList.add(map);
                }
                po.setRelationList(relationList);
             // 获得账号
                Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
                po.setAccountId(account.getAccountId());
                this.cmsSolutionService.updateSolution(po);
                
                /************************生存静态页面存到数据库中start***********************/
                //freeMaker处理
                FreeMarkerConfigurationFactoryBean bean =new FreeMarkerConfigurationFactoryBean();
                bean.setTemplateLoaderPath("classpath:/template/message/cms");
                Configuration config=bean.createConfiguration();
                Template template = config.getTemplate("system_detail.ftl" , "utf-8");
                
                //查询产品
                CmsSolution po2 = this.cmsSolutionService.getSolution_One(po.getCsId());
                
                HashMap<String,Object> params = new HashMap<String, Object>();
                params.put("ctx", ApplicationConst.WAGANG_URL);
                params.put("po", po2);
                params.put("leftJson", ApplicationConst.UPLOAD_PIC_URL+"cms/sys_left.json");
                //生成页面
                String content = FreeMarkerTemplateUtils.processTemplateIntoString(
                        template ,params );
                String staticUrl = "cms/systemDetail/"+po.getCsId()+".html";
                FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+staticUrl, content);
                po2.setStaticUrl(ApplicationConst.UPLOAD_PIC_URL+staticUrl);
                this.cmsSolutionService.updateSolution(po2);
                //生成左侧菜单json数据
                
                List<CmsSolutionCat> catList = this.cmsSolutionCatService.getProduct_ClazzSocend_List();
                String catListJson =JsonUtil.toJson(catList);
                FileUtil.writeStringToFile(ApplicationConst.UPLOAD_PIC_PATH+"cms/sys_left.json", catListJson);
                /************************生存静态页面存到数据库中end***********************/
                
                return AjaxResponse.OK;
            }
            return NOT_ADD;
        }
        return INPUT_NULL;
    }
    
    /**
     * 系统详细
     * @param pcid
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public Object detail(ModelMap model,@RequestParam(value="csId",defaultValue="0")Long csId) throws Exception {
        CmsSolution po = this.cmsSolutionService.getSolution_One(csId);
        model.put("po",po);
        return "/cmsSolution/solution_detail";
     }
    
    
    
}
