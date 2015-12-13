package com.loiot.baqi.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aliyun.oss.model.OSSObject;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.AccountExpandInfoDao;
import com.loiot.baqi.dao.ZpJlInfoDao;
import com.loiot.baqi.service.AccountExpandInfoService;
import com.loiot.baqi.status.AccountType;
import com.loiot.baqi.status.DownloadType;
import com.loiot.baqi.utils.OSSUtils;
import com.loiot.baqi.utils.UserSessionUtils;
import com.loiot.baqi.pojo.AccountExpandInfo;
import com.loiot.baqi.pojo.ZpJlInfo;
import com.loiot.baqi.pojo.ZpJlJobLevels;


/**
 * 下载 逻辑类。
 * 
 * @author  wangzx 
 * @creation 2015-12-13
 */
@Service("downloadService")
@Transactional
public class DownloadService{
	
	 @Resource
	 private ZpJlInfoDao zpJlInfoDao;
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
	
    /**
     * 序列号下载
     * @param pbId
     * @throws Exception 
     */
    public void download(HttpServletResponse response,long id,int type) throws Exception{
    	if(DownloadType.JL.getCode()==type){
    		downJl(response,id);
    	}
    }
    //下载简历
    private void downJl(HttpServletResponse response,long id) throws Exception {
      if(UserSessionUtils.getAccount().getType()== AccountType.ADMIN.getCode() || UserSessionUtils.getAccount().getType()== AccountType.COMPANY_INTERFACER.getCode() || UserSessionUtils.getAccount().getType()== AccountType.HEAD_HUNTING_MANAGER.getCode()  ){
    	  ZpJlInfo jl = this.zpJlInfoDao.getZpJlInfoById(id);
    	  OSSObject obj = OSSUtils.getObject(jl.getJlFilePath());
    	  
    	  response.setCharacterEncoding("UTF-8");
          response.setHeader("Content-Disposition", "attachment; filename="+ java.net.URLEncoder.encode("王建.doc", "UTF-8"));
          response.setContentType("application/msword;charset=UTF-8");
          // 解决ie6下，保存错误问题
          response.setHeader("Pragma", "public");
          response.setHeader("Cache-Control", "public");
          
          IOUtils.write(IOUtils.toByteArray(obj.getObjectContent()), response.getOutputStream());

      }
	}
    
}
