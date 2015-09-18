<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站后台管理系统-微服务</title>
    <link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>

        <div class="right">
            <div class="location">
                <div class="location01">您现在的位置是：首页 &gt; 微服务 &gt; <strong>规则设定</strong></div>
            </div>
    <div class="form">
       <table class="table_style02">
        <tr>
          <td width="22%" align="right" valign="middle" class="hui1">公众帐号：</td>
          <td width="78%" class="hui">${mp.name}</td>
        </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">规则名称：</td>
	      <td class="hui">${mpr.name}</td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">关键字：</td>
	      <td valign="middle" class="hui">
	        <table class="table_style02">
	          <tr>
	            <td width="47%" align="center" class="black">发送关键字</td>
	            <td width="53%" align="center" class="black">选择匹配</td>
	            </tr>
	            <#if mpKws??>
	          	<#list mpKws as mpKw>
	          <tr>
	          	  <td align="center">${mpKw.keyword}</td>
	          	  <#if mpKw.matchWay==0>
	          	  <td align="center"><img src="/images/duigou.jpg" style="vertical-align:middle" /> 已全匹配</td>
				  <#else>
				  <td align="center"> 未全匹配</td>
				  </#if>
	            </tr>
	            </#list>
	          	</#if>
	          </table>
	        </td>
	      </tr>
	   <#if mpNews??>
	   <#if mpNews?size!=0>
	    <tr>
	      <td align="right" valign="middle" class="hui1">回复信息：</td>
	      <td><table class="table_style1">
		        <tr>
		          <td width="19%" class="hui">图文内容：</td>
		          <td width="81%">
	      <#list mpNews as mpNew>
	              <div class="box320 clearfix">
	              <#if mpNew_index==0>
	               <div class="big">
	               <#list Img as img>
	               <#if img.miId==mpNew.miId>
	                <img src="${ApplicationConst.PRODUCT_PIC_URL}${img.path!""}" width="320" height="160">
	               </#if>
	               </#list>
	               <div class="t">${mpNew.title}</div>
	               </div>
	               <#else>
	              <div class="small clearfix">
	               <#list Img as img>
	               <#if img.miId==mpNew.miId>
	               <img src="${ApplicationConst.PRODUCT_PIC_URL}${img.path!""}" width="80" height="80">
	               </#if>
	               </#list>	               
	                  <div class="t">
	                   <p>${mpNew.title}</p>
	                  </div>
	              </div>
	              </#if>
	                </div>
	      </#list>		      
	               </td>
		          </tr>
		        </table></td>
		      </tr>
	      </#if>	
	      </#if>
	      
	      <#if mpTextNews??>
	      <#if mpTextNews!="">
	    <tr>
	      <td align="right" valign="middle" class="hui1">回复信息：</td>
	      <td class="hui">文本内容：${mpTextNews.content!""}</td>
	      </tr>
	      </#if>
	      </#if>
       </table>
    </div>            
            <div class="anniu">&nbsp;<a href="javascript:history.go(-1);"><img src="/images/gddc_05.jpg" width="101" height="29" /></a></div>
</body>
</html>
