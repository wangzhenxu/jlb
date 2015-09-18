<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>网站后台管理系统-项目管理-详情项目</title>
	<#include "/include/bootstrap.ftl"/>
	<#include "/include/pager.ftl">
	<script src="/js/jquery.validationEngine.pack.js"></script>
    <script src="/js/jquery.validationEngine-cn.js"></script>
    <link href="/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<script  language="javascript">
	
	$(document).ready(function(){
	    
	});
	
	</script>
</head>
<body>

<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; 帐号管理 &gt; <strong>项目管理</strong></div>
    </div>
    <div class="basic">
  
     <div class="basic02"><img src="/images/bianji.jpg" width="63" height="22"  onClick="javascript:window.location.href='/project/toEdit.action?projectId=${project.projectId}'"/></div>
	</div>
    <div class="form">
       <table class="table_style02">
        <tr>
         <td width="28%" align="right" valign="middle" class="hui1">项目名称：</td>
         <td width="72%" class="hui">&nbsp;&nbsp;${project.name}</td>
         </tr>
         <tr>
         <td width="28%" align="right" valign="middle" class="hui1">项目代码：</td>
         <td width="72%" class="hui">&nbsp;&nbsp;${project.code}</td>
         </tr>
	    <tr>
         <td align="right" valign="middle" class="hui1">项目负责人：</td>
         <td class="hui">&nbsp;&nbsp;${project.leader}</td>
         </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">项目描述：</td>
	      <td valign="middle" class="hui">&nbsp;&nbsp;${project.projectDesc}</td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">创建时间：</td>
	      <td class="hui"><p>&nbsp;&nbsp;${project.createTime?string("yyyy-MM-dd HH:mm:ss")}</p></td>
	      </tr>
       </table>
    </div>
    <div class="anniu"><a href="/project/toEdit.action?projectId=${project.projectId}"><img src="/images/bianji1.jpg"  /></a>&nbsp;<a href="javascript:history.go(-1);"><img src="/images/back1.jpg" /></a></div>
</div>

</body>
</html>