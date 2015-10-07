
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
     <!-- 产品管理 -->
     <#if subject.isPermitted("productClass:list")||subject.isPermitted("product:list")||subject.isPermitted("sn:list")>
     <#assign a=menuClass!="productClass"&&menuClass!="snManage"&&menuClass!="productManage">
	     <div class="MenuLevel1">产品管理 <span><img src="/images/<#if a>2<#else>1</#if>.gif" border="0"/></span></div>
	     <div class="<#if a>SubMenuLayerHidden</#if> SubMenu">
	     <#if subject.isPermitted("productClass:list")>
	      <a class="MenuLevel4 productClass" href="/product/class/list.action" ><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="productClass">class="MenuLevel5"</#if>>产品分类</span></a>
	     </#if>
	     <#if subject.isPermitted("product:list")>
	      <a class="MenuLevel4 productManage" href="/product/management/list.action" ><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="productManage">class="MenuLevel5"</#if>>产品管理</span></a>
	     </#if>
	     <#if subject.isPermitted("sn:list")>
	      <a class="MenuLevel4 snManage" href="/product/serialnumber/list.action"><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="snManage">class="MenuLevel5"</#if>>序列号管理</span></a>
	     </#if>
	     </div>
     </#if>
     <!-- CMS发布管理 -->
     <#if subject.isPermitted("productApp:list")||subject.isPermitted("productPublish:list")||subject.isPermitted("cmsSolution:list")||subject.isPermitted("systemPublish:list")>
	     <#assign b=menuClass!="productDBClass"&&menuClass!="productPublish"&&menuClass!="systemClass"&&menuClass!="systemPublish">
	     <div class="MenuLevel1">CMS发布管理 <span><img src="/images/<#if b>2<#else>1</#if>.gif" border="0"/></span></div>
	     <div class="<#if b>SubMenuLayerHidden</#if> SubMenu"> 
	     <#if subject.isPermitted("productApp:list")>
	      <a class="MenuLevel4 productDBClass" href="/productApp/class/list.action" ><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="productDBClass">class="MenuLevel5"</#if>>产品库分类</span></a>
	     </#if>
	     <#if subject.isPermitted("productPublish:list")>
	      <a class="MenuLevel4 productPublish" href="/productApp/sub/list.action" ><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="productPublish">class="MenuLevel5"</#if>>产品发布</span></a>
	     </#if>
	     <#if subject.isPermitted("cmsSolution:list")>
	      <a class="MenuLevel4 systemClass" href="/cmsSolution/class/list.action" ><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="systemClass">class="MenuLevel5"</#if>>系统分类</span></a>
	     </#if>
	     <#if subject.isPermitted("systemPublish:list")>
	      <a class="MenuLevel4 systemPublish" href="/cmsSolution/sub/list.action" ><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="systemPublish">class="MenuLevel5"</#if>>系统发布</span></a>
	     </#if>
	     </div>
     </#if>
     <!-- 开发者管理 -->
     <#if subject.isPermitted("app:appList")||subject.isPermitted("app:auditAppList")||subject.isPermitted("app:publishAppList")||subject.isPermitted("scene:list")||subject.isPermitted("user:list")>
	     <#assign c=menuClass!="appView"&&menuClass!="appAudit"&&menuClass!="appPublish"&&menuClass!="sceneManage"&&menuClass!="userManage">
	     <div class="MenuLevel1">开发者管理 <span><img src="/images/<#if c>2<#else>1</#if>.gif" border="0"/></span></div>
	     <div class="<#if c>SubMenuLayerHidden</#if> SubMenu">
	     <#if subject.isPermitted("app:appList")>
		      <a class="MenuLevel4 appView" href="/app/getAppList.action" > <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="appView">class="MenuLevel5"</#if>>应用查看</span></a>
	     </#if>
	     <#if subject.isPermitted("app:auditAppList")>
	      	<a class="MenuLevel4 appAudit" href="/app/auditapplist.action" > <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="appAudit">class="MenuLevel5"</#if>>应用审核</span></a>
	     </#if>
	     <#if subject.isPermitted("app:publishAppList")>
	        <a class="MenuLevel4 appPublish" href="/app/getDisplayList.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="appPublish">class="MenuLevel5"</#if>>应用上线</span></a>
	     </#if>
	     <#if subject.isPermitted("scene:list")>
		 	<a class="MenuLevel4 sceneManage" href="/scene/list.action" ><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="sceneManage">class="MenuLevel5"</#if>>场景管理</span></a>
   	     </#if>
   	     <#if subject.isPermitted("user:list")>
		    <a class="MenuLevel4 userManage" href="/user/list.action" ><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="userManage">class="MenuLevel5"</#if>>网站用户</span></a>
	     </#if>
	     </div>
    </#if>



     <!--微服务 -->
 <#assign d=menuClass!="mpsClass"&&menuClass!="mpsRuleClass"&&menuClass!="mpsOpsClass" >
     <div class="MenuLevel1"> 微服务 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
        <div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
          <#if subject.isPermitted("mpCustomer:list")>
            <a class="MenuLevel4 mps" href="/mps/list.action"><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="mpsClass">class="MenuLevel5"</#if>>公众帐号管理</span></a>
          </#if>
          <#if subject.isPermitted("mpRule:list")>
            <a class="MenuLevel4 mps" href="/mps/rules.action"><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="mpsRuleClass">class="MenuLevel5"</#if>>规则设定</span></a>
          </#if>
          <#if subject.isPermitted("mpOps:list")>
            <a class="MenuLevel4 mps" href="/mps/opls.action"><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="mpsOpsClass">class="MenuLevel5"</#if>>操作记录</span></a>
          </#if>
        </div>






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
		
		<#if subject.isPermitted("customer_account_role:list")>
		    <a class="MenuLevel4 customerAccountRole" href="/customer/account/role/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="customerAccountRole">class="MenuLevel5"</#if>>客户角色</span></a>
		</#if>
		
		<#if subject.isPermitted("customer:list")>
		    <a class="MenuLevel4 customerManage" href="/customer/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="customerManage">class="MenuLevel5"</#if>>客户帐号</span></a>
		</#if>
		<!--项目管理-->
		<#if subject.isPermitted("project:list")>
			<a class="MenuLevel4 projectManage" href="/project/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="projectManage">class="MenuLevel5"</#if>>项目管理</span></a>
		</#if>
		
      	<a class="MenuLevel4 editPassword" href="/password.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="editPassword">class="MenuLevel"</#if>>修改密码</span></a>
     </div>
     
      <!-- 邮件管理 -->
     <div class="MenuLevel1"> 邮件管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     <div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
      	<a class="MenuLevel4 editPassword" href="/zpEmalTemplate/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="editPassword">class=""</#if>>邮件模版</span></a>
     </div>
     
     <!--qq客户管理 -->
     <div class="MenuLevel1"> qq客户管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     <div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
      	<a class="MenuLevel4 editPassword" href="/zpHrInfo/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="editPassword">class=""</#if>>qq客户管理</span></a>
     </div>
     
     <!-- 简历管理 -->
     <div class="MenuLevel1"> 简历管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     <div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
      	<a class="MenuLevel4 editPassword" href="/zpJlInfo/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="editPassword">class=""</#if>>简历管理</span></a>
     </div>
     
     <!-- 客户管理 -->
     <div class="MenuLevel1"> 客户管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     <div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
      	<a class="MenuLevel4 editPassword" href="/zpCompanyInfo/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="editPassword">class=""</#if>>客户管理</span></a>
     	<a class="MenuLevel4 editPassword" href="/zpCompanyJobInfo/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="editPassword">class=""</#if>>职位管理</span></a>
     	<a class="MenuLevel4 editPassword" href="/zpJobMatchingInfo/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="editPassword">class=""</#if>>职位匹配列表</span></a>
     	
     </div>
     
     
    </div>
	</div>
   <#--主体内容-->
   ${body}
   
  </div>
 </div>
 <div class="foot">
   <div class="footer">北京时代凌宇科技有限公司京ICP备10042645号 Copyright-2007 Loit CO LTD. all rights reserved</div>
  </div>
</body>
</html>
