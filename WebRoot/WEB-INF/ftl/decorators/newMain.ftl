
<#assign menuClass=menuClass!"editPassword">
<#setting number_format="#">

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
   <div class="position01">欢迎您,<span class="org">${Session[Const.SESSION_USER_KEY].username}</span>,今天是${.now}</div>
  
     <div class="position02"><img src="/images/hy_06.jpg" style="vertical-align:middle"/>&nbsp;<a href="javascript:suggestInfo.toAddSuggestInfo();" >提建议和bug</a></div>
  
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
		    <a class="MenuLevel4 accountManage" href="/account/list.action" > <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span <#if menuClass="accountManage">class="MenuLevel5"</#if>>后台帐号</span></a>
		</#if>
		
		<#if subject.isPermitted("accountExpandInfo:edit")>
				<a class="MenuLevel4 editPassword"  
					 <#if Session[Const.SESSION_USER_KEY].iphone?? 
					  && Session[Const.SESSION_USER_KEY].iphone?length gt 0> 
					  href="/accountExpandInfo/toView.action?id=${Session[Const.SESSION_USER_KEY].expandId}" 
					  <#else>  
					  href="/accountExpandInfo/toEdit.action?id=${Session[Const.SESSION_USER_KEY].expandId}" 
					</#if>   > 
					<img src="/images/bullet_sarrow.gif"/> 
					&nbsp;&nbsp;<span id="accountExpandInfo_list">个人信息</span>
			   </a>
		</#if>
		
		<#if subject.isPermitted("accountExpandInfo:list") && (Session[Const.SESSION_USER_KEY].type==AccountType.SALARY_MANAGER.getCode() ||  Session[Const.SESSION_USER_KEY].type==AccountType.ADMIN.getCode()) >
		    <a class="MenuLevel4 accountManage" href="/accountExpandInfo/list.action" > <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="accountExpandInfo_list_all">用户扩展信息</span></a>
		</#if>
      	
      	<a class="MenuLevel4 editPassword" href="/password.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="editPassword">修改密码</span></a>
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
     
      <#if subject.isPermitted("companyInterface:list")>
    	 <!-- 企业对接管理 -->
     	<div class="MenuLevel1"> 企业对接管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     		<div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
      			<a class="MenuLevel4 editPassword" href="/zpRecommendFlowInfo/companyInterfaceList.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="companyInterface_list">企业对接管理</span></a>
     	</div>
     </#if>
     	    
     <#if subject.isPermitted("headhunterInterface:list")>
     	 <!-- 顾问对接管理 -->
     	<div class="MenuLevel1"> 顾问对接管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     		<div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
      			<a class="MenuLevel4 editPassword" href="/zpRecommendFlowInfo/headhunterInterfaceList.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="headhunterInterface_list">顾问对接管理</span></a>
     	</div>
      </#if>
     
     <#if subject.isPermitted("zpRecommendFlowInfo:list")>
     	 <!-- 流程管理 -->
     	<div class="MenuLevel1"> 推荐流程管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     		<div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
      			<a class="MenuLevel4 editPassword" href="/zpRecommendFlowInfo/list.action"> <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="zpRecommendFlowInfo_list">推荐流程管理</span></a>
     	</div>
     </#if>
     
     
      <!-- 推广帐号管理 -->
     <#assign d=menuClass!="accountRole"&&menuClass!="accountManage"&&menuClass!="editPassword"&&menuClass!="customerManage"&&menuClass!="projectManage" &&menuClass!="customerAccountRole" >
     <div class="MenuLevel1"> 推广帐号管理 <span><img src="/images/<#if d>2<#else>1</#if>.gif" border="0"/></span></div>
     <div class="<#if d>SubMenuLayerHidden</#if> SubMenu">
   	    <#if subject.isPermitted("tgRole:list")>
      		<a class="MenuLevel4 tgAccountRole" href="/tgAccount/role/list.action"><img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="tgRole_list" >后台角色</span></a>
      	</#if>
		<#if subject.isPermitted("tgAccount:list")>
		    <a class="MenuLevel4" href="/tgAccount/list.action" > <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="tgAccount_list">后台帐号</span></a>
		</#if>
		
		<#if subject.isPermitted("tgAccountExpandInfo:list") && (Session[Const.SESSION_USER_KEY].type==AccountType.ADMIN.getCode()) >
		    <a class="MenuLevel4 accountManage" href="/tgAccountExpandInfo/list.action" > <img src="/images/bullet_sarrow.gif"/> &nbsp;&nbsp;<span id="tgAccountExpandInfo_list_all">用户扩展信息</span></a>
		</#if>
     </div>
     
    </div>
	</div>
   <#--主体内容-->
   ${body}
   
  </div>
 </div>
 <div class="foot" style="display:none;" >
   <div class="footer"  >北京璟仪科技有限公司京ICP备10042645号 Copyright-2015 Loit CO LTD. all rights reserved</div>
  </div>
  
  <script>
  
   $('input, textarea').placeholder();
  
  //停止操作
  function disableOperator(){
     $(".left_menu").find("a").each(function(){
  	 	if($(this).find("span").attr("id")!="accountExpandInfo_list"){
  	  	 	$(this).attr("href","javascript:void(0)");
  	   		$(this).click(function (){
  	   		common.alert("请先填写个人信息");
  	   		return;
  	   		});
  		 }
  		});
  }
  <#if  Session[Const.SESSION_USER_KEY].iphone?? && Session[Const.SESSION_USER_KEY].iphone?length gt 0  >
  	<#elseif Session[Const.SESSION_USER_KEY].type!=AccountType.ADMIN.getCode()>
  		disableOperator();
  </#if>
  </script>
  
  
<div id="suggestModal" class="pop_sure modal hide fade"></div>
</body>
</html>

