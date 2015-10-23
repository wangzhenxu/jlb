
<#assign menuClass=menuClass!"editPassword">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${title}</title>
<#include "../include/common.ftl"/>
${head}
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script LANGUAGE="javascript">
$(function(){
	$(".MenuLevel1").click(function(){
		//清空样式
		$(".MenuLevel1 span").empty().append('<img src="/images/2.gif" border="0"/>');
		$(".SubMenu").addClass("SubMenuLayerHidden");
		//选中菜单
		$(this).find("span").empty().append('<img src="/images/1.gif" border="0"/>');
		$(this).next().removeClass("SubMenuLayerHidden");
	});
	//location.href="/zpEmalTemplate/list.action"
});
function menuClick(){
}
</script>
</head>
<body>
 <div id="contant">
  <div class="head"><img src="/images/erji_01.jpg" /></div>
  <div class="position">
   <div class="position01">欢迎您,<span class="org">${Session[Const.SESSION_USER_KEY].username}</span>,今天是2012年11月9日</div>
   <div class="position02"><img src="/images/hy_06.jpg" style="vertical-align:middle"/>&nbsp;<a href="/logout.action" id="logoutBtn">退出登录</a></div>
  </div>
  
  <div class="main">    
   <#--菜单内容-->
	<div class="sinbar">
	<div class="sinbar01">菜单栏</div>
    <div class="left_menu">
     <!-- 帐号管理 -->
     <#assign d=menuClass!="accountRole"&&menuClass!="accountManage"&&menuClass!="editPassword"&&menuClass!="customerManage"&&menuClass!="projectManage" &&menuClass!="customerAccountRole" >
     <div class="MenuLevel1"> 帐号管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     <div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
   	    <#if subject.isPermitted("role:list")>
      		<a class="MenuLevel4 accountRole" href="/account/role/list.action"><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="accountRole">class="MenuLevel5"</#if>>后台角色</span></a>
      	</#if>
		<#if subject.isPermitted("account:list")>
		    <a class="MenuLevel4 accountManage" href="/account/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="accountManage">class="MenuLevel5"</#if>>后台帐号</span></a>
		</#if>
      	<a class="MenuLevel4 editPassword" href="/password.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="editPassword">class="MenuLevel"</#if>>修改密码</span></a>
     </div>
     
      <!-- 邮件管理 
     <div class="MenuLevel1"> 邮件管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     <div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
      	<a class="MenuLevel4 editPassword" href="/zpEmalTemplate/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="editPassword">class=""</#if>>邮件模版</span></a>
     </div>
     -->
     <!-- qq客户管理
     <div class="MenuLevel1"> qq客户管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     <div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
      	<a class="MenuLevel4 editPassword" href="/zpHrInfo/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="editPassword">class=""</#if>>qq客户管理</span></a>
     </div>
      -->
      
     <!-- 简历管理 -->
      <#if subject.isPermitted("zpJlInfo:list") || subject.isPermitted("zpJobMatchingInfo:list") >
      	<div class="MenuLevel1"> 简历管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     		<div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
      		<#if subject.isPermitted("zpJlInfo:list")>
      			<a class="MenuLevel4 editPassword" href="/zpJlInfo/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="zpJlInfo_list">简历管理</span></a>
     		</#if>
     		<#if subject.isPermitted("zpJobMatchingInfo:list")>
     			<a class="MenuLevel4 editPassword" href="/zpJobMatchingInfo/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="zpJobMatchingInfo_list">职位匹配列表</span></a>
     		</#if>
     	</div>
     </#if>
     
      <#if subject.isPermitted("zpCompanyInfo:list") ||subject.isPermitted("zpCompanyJobInfo:list")>
     	<!-- 客户管理 -->
     	<div class="MenuLevel1"> 客户管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     		<div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
     		 <#if subject.isPermitted("zpCompanyInfo:list")>
      			<a class="MenuLevel4 editPassword" href="/zpCompanyInfo/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="zpCompanyInfo_list">客户管理</span></a>
      		</#if>
      		<#if subject.isPermitted("zpCompanyJobInfo:list")>
     			<a class="MenuLevel4 editPassword" href="/zpCompanyJobInfo/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="zpCompanyJobInfo_list">职位管理</span></a>
     		</#if>
     	</div>
     </#if>
     
     <#if subject.isPermitted("zpJlInfo:auditList")>
     	<!-- 评审管理 -->
     	<div class="MenuLevel1"> 评审管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     		<div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
      			<a class="MenuLevel4 editPassword" href="/zpJlInfo/auditList.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="zpJlAudit_list">评审管理</span></a>
     	</div>
     </#if>
     	
     
    </div>
	</div>
   <#--主体内容-->
   ${body}
   
  </div>
 </div>
 <div class="foot" >
   <div class="footer"  >北京璟仪科技有限公司京ICP备10042645号 Copyright-2015 Loit CO LTD. all rights reserved</div>
  </div>
</body>
</html>
