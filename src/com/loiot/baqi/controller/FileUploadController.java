package com.loiot.baqi.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.loiot.baqi.constant.ApplicationConst;
import com.loiot.commons.utils.FileUtil;

@Controller
// 声明该类为控制器类
@RequestMapping("/upload")
public class FileUploadController {
    protected Logger logger = Logger.getLogger(FileUploadController.class);

    @RequestMapping(method = RequestMethod.POST)
    // 将文件上传请求映射到该方法
    public Object handleFormUpload(
            HttpServletResponse response,
            @RequestParam(value = "upload", required = false) CommonsMultipartFile mFile,
            @RequestParam(value = "CKEditorFuncNum", required = false, defaultValue = "") String CKEditorFuncNum) { 
        String file1Path="";    
        if (mFile!=null && !mFile.isEmpty()) {
              //创建一个文件
                file1Path="fck/temp/"+new Date().getTime()+".jpg";
                File newFile1;
                try {
                    /*newFile1 = FileUtil.createFile(ApplicationConst.UPLOAD_PIC_PATH+file1Path);
                    //将文件写到新的文件当中
                    mFile.getFileItem().write(newFile1);
                    file1Path = ApplicationConst.UPLOAD_PIC_URL+file1Path;*/

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
           String resText =  "<script language='javascript'>"
            +"window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum+ ",'" + file1Path + "',''" + ")"
            +"</script>";
            this.printScript(response, resText);
          return null;
    }
    
    /**
     * 输出脚本
     * 
     * @param str
     */
    public static void printScript(HttpServletResponse response, String str) {
        response.setContentType("text/html;charset='utf-8'");
        response.setCharacterEncoding("utf-8");
        response.setHeader("charset", "utf-8");
        PrintWriter pw = null;
        try {
            pw = response.getWriter();
            pw.print(str);
            pw.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            pw.close();
        }
    }


   

}