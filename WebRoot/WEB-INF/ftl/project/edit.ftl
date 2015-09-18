<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>网站后台管理系统-项目管理-添加项目</title>
	<#include "/include/bootstrap.ftl"/>
	<#include "/include/pager.ftl">
<script src="http://www.loiot.com/c/validation/jquery.validationEngine.min.js"></script>
<script src="http://www.loiot.com/c/validation/jquery.validationEngine.js"></script>
<link href="http://www.loiot.com/c/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<script  language="javascript">
	function sub(){
		 $("form[name=addProject]").submit();
	}
	$(document).ready(function(){
	    $("#addProject").validationEngine();
	});
	
	</script>
</head>
<body>

<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; 帐号管理 &gt; <strong>项目管理</strong></div>
    </div>
    <div class="nav">

     <div class="form">
     <form method="POST" name="addProject" id="addProject" action="/project/edit.action">
       <table class="table_style02">
	    <tr>
	      <td width="28%" align="right" valign="middle" class="hui1"><span class="red">*</span> 项目名称：</td>
	      <td width="72%" class="hui">
	      	<input type="hidden" name="projectId" value="${project.projectId}"/>
	        <input name="name" id="name" type="text"  class="inputa validate[required]" value="${project.name}"/>
	       </td>
	      </tr>
	      <tr>
	      <td width="28%" align="right" valign="middle" class="hui1"><span class="red">*</span> 项目代码：</td>
	      <td width="72%" class="hui">
	        <select name="code" type="text"  class="inputa"/> 
	        	<#if project.code=="PTXM">
		        <option value="PTXM" selected>普通项目</option>
		        <option value="CYXM">餐饮项目</option>
		        <#else>
		        <option value="PTXM">普通项目</option>
		        <option value="CYXM" selected>餐饮项目</option>
		        </#if>
	        </select>
	        普通项目：PTXM  餐饮项目： CYXM
	       </td>
	     </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1"><span class="red">*</span> 项目负责人：</td>
	      <td valign="middle" class="hui">
	        <input name="leader" id="leader" type="text"  class="inputa validate[required]" value="${project.leader}"/>
	      </td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">项目描述：</td>
	      <td class="hui"><textarea name="projectDesc" id="textarea" cols="45" rows="5" class="texta">${project.projectDesc}</textarea></td>
	      </tr>
	    </table>
    </div>
     <div class="anniu"><a href="javascript:sub();"><img src="/images/erji1_19.jpg" /></a>&nbsp;<a href="javascript:window.history.go(-1);"><img src="/images/back1.jpg" /></a></div>
     </form>
    </div>
</div>

</body>
</html>