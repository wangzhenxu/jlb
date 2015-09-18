<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-系统分类</title>
<#include "../include/bootstrap.ftl"/>
<#include "../include/pager.ftl">
<link href="/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
</head>

<script LANGUAGE="javascript">
<!--
var RightMenuUID = "";
function spreadMenu(n){
 var szSubMenuClassName1 = document.getElementById('SubMenu1').className ;
 document.getElementById('SubMenu1').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowLayer1Down').style.display = '' ;
 document.getElementById('ArrowLayer1Right').style.display = 'none' ;
 var szSubMenuClassName2 = document.getElementById('SubMenu2').className ;
 document.getElementById('SubMenu2').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowLayer2Down').style.display = '' ;
 document.getElementById('ArrowLayer2Right').style.display = 'none' ;
 var szSubMenuClassName3 = document.getElementById('SubMenu3').className ;
 document.getElementById('SubMenu3').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowLayer3Down').style.display = '' ;
 document.getElementById('ArrowLayer3Right').style.display = 'none' ;
 var szSubMenuClassName4 = document.getElementById('SubMenu4').className ;
 document.getElementById('SubMenu4').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowLayer4Down').style.display = '' ;
 document.getElementById('ArrowLayer4Right').style.display = 'none' ;
 switch (n){
  case 1 :
   if (szSubMenuClassName1 == 'SubMenuLayerHidden'){
    document.getElementById('SubMenu1').className = 'SubMenuLayer' ;
    document.getElementById('ArrowLayer1Down').style.display = 'none' ;
    document.getElementById('ArrowLayer1Right').style.display = '' ;
   }
   else{
    document.getElementById('SubMenu1').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowLayer1Down').style.display = '' ;
    document.getElementById('ArrowLayer1Right').style.display = 'none' ;
   }
   break ;
  case 2 :
   if (szSubMenuClassName2 == 'SubMenuLayerHidden'){
    document.getElementById('SubMenu2').className = 'SubMenuLayer' ;
    document.getElementById('ArrowLayer2Down').style.display = 'none' ;
    document.getElementById('ArrowLayer2Right').style.display = '' ;
   }
   else{
    document.getElementById('SubMenu2').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowLayer2Down').style.display = '' ;
    document.getElementById('ArrowLayer2Right').style.display = 'none' ;
   }
   break ;
  case 3 :
   if (szSubMenuClassName3 == 'SubMenuLayerHidden'){
    document.getElementById('SubMenu3').className = 'SubMenuLayer' ;
    document.getElementById('ArrowLayer3Down').style.display = 'none' ;
    document.getElementById('ArrowLayer3Right').style.display = '' ;
   }
   else{
    document.getElementById('SubMenu3').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowLayer3Down').style.display = '' ;
    document.getElementById('ArrowLayer3Right').style.display = 'none' ;
   }
   break ;
  case 4 :
   if (szSubMenuClassName4 == 'SubMenuLayerHidden'){
    document.getElementById('SubMenu4').className = 'SubMenuLayer' ;
    document.getElementById('ArrowLayer4Down').style.display = 'none' ;
    document.getElementById('ArrowLayer4Right').style.display = '' ;
   }
   else{
    document.getElementById('SubMenu4').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowLayer4Down').style.display = '' ;
    document.getElementById('ArrowLayer4Right').style.display = 'none' ;
   }
   break ;
 }
}
function spreadSubMenu(k){
 var szSubMenuClassName1 = document.getElementById('SubSubMenu1').className ;
 document.getElementById('SubSubMenu1').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowSubLayer1Down').style.display = '' ;
 document.getElementById('ArrowSubLayer1Right').style.display = 'none' ;
 var szSubMenuClassName2 = document.getElementById('SubSubMenu2').className ;
 document.getElementById('SubSubMenu2').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowSubLayer2Down').style.display = '' ;
 document.getElementById('ArrowSubLayer2Right').style.display = 'none' ;
 var szSubMenuClassName3 = document.getElementById('SubSubMenu3').className ;
 document.getElementById('SubSubMenu3').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowSubLayer3Down').style.display = '' ;
 document.getElementById('ArrowSubLayer3Right').style.display = 'none' ;
 var szSubMenuClassName3 = document.getElementById('SubSubMenu4').className ;
 document.getElementById('SubSubMenu4').className = 'SubMenuLayerHidden' ;
 document.getElementById('ArrowSubLayer4Down').style.display = '' ;
 document.getElementById('ArrowSubLayer4Right').style.display = 'none' ;
 switch (k){
  case 1 :
   if (szSubMenuClassName1 == 'SubMenuLayerHidden'){
    document.getElementById('SubSubMenu1').className = 'SubMenuLayer' ;
    document.getElementById('ArrowSubLayer1Down').style.display = 'none' ;
    document.getElementById('ArrowSubLayer1Right').style.display = '' ;
   }
   else{
    document.getElementById('SubSubMenu1').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowSubLayer1Down').style.display = '' ;
    document.getElementById('ArrowSubLayer1Right').style.display = 'none' ;
   }
   break ;
  case 2 :
   if (szSubMenuClassName2 == 'SubMenuLayerHidden'){
    document.getElementById('SubSubMenu2').className = 'SubMenuLayer' ;
    document.getElementById('ArrowSubLayer2Down').style.display = 'none' ;
    document.getElementById('ArrowSubLayer2Right').style.display = '' ;
   }
   else{
    document.getElementById('SubSubMenu2').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowSubLayer2Down').style.display = '' ;
    document.getElementById('ArrowSubLayer2Right').style.display = 'none' ;
   }
   break ;
  case 3 :
   if (szSubMenuClassName3 == 'SubMenuLayerHidden'){
    document.getElementById('SubSubMenu3').className = 'SubMenuLayer' ;
    document.getElementById('ArrowSubLayer3Down').style.display = 'none' ;
    document.getElementById('ArrowSubLayer3Right').style.display = '' ;
   }
   else{
    document.getElementById('SubSubMenu3').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowSubLayer3Down').style.display = '' ;
    document.getElementById('ArrowSubLayer3Right').style.display = 'none' ;
   }
   break ;
  
   case 4 :
   if (szSubMenuClassName3 == 'SubMenuLayerHidden'){
    document.getElementById('SubSubMenu4').className = 'SubMenuLayer' ;
    document.getElementById('ArrowSubLayer4Down').style.display = 'none' ;
    document.getElementById('ArrowSubLayer4Right').style.display = '' ;
   }
   else{
    document.getElementById('SubSubMenu4').className = 'SubMenuLayerHidden' ;
    document.getElementById('ArrowSubLayer4Down').style.display = '' ;
    document.getElementById('ArrowSubLayer4Right').style.display = 'none' ;
   }
   break ;
  
 }
}
//-->
</script>
<body>
 <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; 开发者管理 <strong>&gt; 应用审核</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">应用审核</div>
     <div class="query">
     <form action="/app/auditapplist.action" method="post" id="queryform">
       <table width="100%" border="0">
         <tr>
           <td width="11%" align="right" class="classify">应用名称：</td>
           <td width="25%" align="left"><input name="app_name" type="text"  value="${app_name}" class="inputa" id="app_name"/>
           <input name="query_type" type="hidden" id="query_type"  value="${query_type}" class="inputa"/>
           </td>
           <td width="14%" align="right" class="classify">应用类型：</td>
           <td width="50%" align="left">
           <select name="platform_type" id="${platform_type!""}" class="input sel">
            <option value="-1">请选择</option>
             <option value="0" <#if platform_type=0>selected="selected"</#if>>站内应用</option>
             <option value="1" <#if platform_type=1>selected="selected"</#if>>客户端-桌面</option>
             <option value="2" <#if platform_type=2>selected="selected"</#if>>客户端-手机</option>
           </select>
             
            <select name="platform_str" id="${platform_str!""}" class="inputy sel_sub">
           	   <option value="">请选择</option>
           	   <#if platform_type=0>
          	   <option value="" <#if platform_str="">selected="selected"</#if>>站内应用</option>
          	   </#if>
          	   
          	   <#if platform_type=2>
               <option value="iPhone" <#if platform_str="iPhone">selected="selected"</#if>>iPhone</option>
               <option value="Android" <#if platform_str="Android">selected="selected"</#if>>Android</option>
               <option value="Windows Phone" <#if platform_str="Windows Phone">selected="selected"</#if>>Windows Phone</option>
               <option value="Symbian" <#if platform_str="Symbian">selected="selected"</#if>>Symbian</option>
               <option value="BlackBerry" <#if platform_str="BlackBerry">selected="selected"</#if>>BlackBerry</option>
               <option value="WebOS" <#if platform_str="WebOS">selected="selected"</#if>>WebOS</option>
               <option value="Other" <#if platform_str="Other">selected="selected"</#if>>Other</option>
                </#if>
                
                <#if platform_type=1>
               <option value="Windows" <#if platform_str="Windows">selected="selected"</#if>>Windows</option>
               <option value="Mac" <#if platform_str="Mac">selected="selected"</#if>>Mac</option>
			   <option value="Linux" <#if platform_str="Linux">selected="selected"</#if>>Linux</option>
               <option value="Other" <#if platform_str="Other">selected="selected"</#if>>Other</option>
                </#if>
          </select></td>
           <td width="0%" rowspan="2" align="center" valign="bottom"><a href="#"></a></td>
         </tr>
         <tr>
           <td align="right" class="classify">应用分类：</td>
           <td colspan="2" align="left" class="hui2">
           <select name="ati_id" id="ati_id" class="inputa">
            <option value="0">请选择</option>
            <#list appTypes as appType>
             <option value="${appType.atiId}" <#if appType.atiId=ati_id>selected="selected"</#if>>${appType.typeName}</option>
            </#list>
           </select> </td>
           <td align="right" valign="bottom"><a href="javascript:;" onclick="$(this).parents('form').submit();"><img src="/images/erji_06.jpg" width="64" height="26" /></a></td>
         </tr>
       </table>
     </form>
     </div>
    </div>
    <div class="form">
     <div class="form1">
     
     <#if query_type=0>
      <div id="js1">
       <div class="bian">
	    <div class="bianb">
	    <div class="biantop">
		 <ul>
		  <li class="list"><a href="javascript:;" onclick="query(0);">应用初审</a></li>
		  <li><a href="javascript:;" onclick="query(1);">应用复审</a></li>
		  <li><a href="javascript:;" onclick="query(2);">发布上线</a></li>
		 </ul>
		</div>
	   </div>
	    <div class="biao1">
		<table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
         <tr class="lan">
           <td width="7%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序列号</strong></td>
           <td width="10%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用名称</strong></td>
           <td width="9%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用类型</strong></td>
           <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>开发者类型</strong></td>
           <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>开发者名称</strong></td>
           <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>提交审核时间</strong></td>
           <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用状态</strong></td>
           <td width="23%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作</strong></td>
           </tr>
         <#if pager.data?size=0>
          <tr>
           <td align="center" class="hui" colspan="8">没有符合您条件的数据</td>
         </tr>
         </#if>  
         <#list pager.data as app>
         <tr id="${app.appId}">
           <td align="center" class="hui">${app.appId}</td>
           <td align="center" class="hui"><p>${app.appName}</p></td>
           <td align="center" class="hui"> 
           <#if app.platformType=0>站内应用</#if>
           <#if app.platformType=1>客户端-桌面</#if>
           <#if app.platformType=2>客户端-手机</#if>
           </td>
           <td align="center" class="hui">
           <#if app.user.userType=0>个人</#if>
           <#if app.user.userType=1>机构</#if></td>
           <td align="center" class="hui">${StringUtil.isBlankToDefault(app.user.realName,app.user.loginName!'空')}</td>
           <td align="center" class="hui">${app.lastTime?string("yyyy-MM-dd HH:mm:ss")}</td>
           <td align="center" class="hui">${AuditStatus.get(app.auditStatus).getTitle()}</td>
           <td align="center" class="hui">
           <#if subject.isPermitted("app:check")>
	           <a href="/app/check.action?appId=${app.appId}&menuClass=appAudit">查看</a>&nbsp;
	       </#if>
           <#if subject.isPermitted("app:firstCheck")>
        	   <a id="cs" href="javascript:;" onclick="cspass(${app.appId});">初审通过</a>&nbsp;<a id="csbh" href="javascript:;" onclick="refuse(${app.appId},${app.user.userId});">初审驳回</a>&nbsp;
			</#if>
           <#if subject.isPermitted("app:delete")>
            	<a id="sc" href="javascript:;" onclick="deleteapp(${app.appId},'${app.appName}');"> 删除 </a>&nbsp;&nbsp;</td>
           </#if>
         </tr>
        </#list>
       </table>
       </div>
       </div>
      </div>
     </#if> 
      
      <#if query_type=1>
      <div id="js2">
       <div class="bian">
	    <div class="bianb">
	    <div class="biantop">
		 <ul>
		  <li><a href="javascript:;" onclick="query(0);">应用初审</a></li>
		  <li class="list"><a href="javascript:;" onclick="query(1);">应用复审</a></li>
		  <li><a href="javascript:;" onclick="query(2);">发布上线</a></li>
		 </ul>
		</div>
	   </div>
	    <div class="biao1">
		<table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
         <tr class="lan">
           <td width="7%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序列号</strong></td>
           <td width="10%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用名称</strong></td>
           <td width="9%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用类型</strong></td>
           <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>开发者类型</strong></td>
           <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>开发者名称</strong></td>
           <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>初审通过时间</strong></td>
           <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用状态</strong></td>
           <td width="23%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作</strong></td>
           </tr>
         <#if pager.data?size=0>
          <tr>
           <td align="center" class="hui" colspan="8">没有符合您条件的数据</td>
         </tr>
         </#if>  
         <#list pager.data as app>
         <tr id="${app.appId}">
           <td align="center" class="hui">${app.appId}</td>
           <td align="center" class="hui"><p>${app.appName}</p></td>
           <td align="center" class="hui"> 
           <#if app.platformType=0>站内应用</#if>
           <#if app.platformType=1>客户端-桌面</#if>
           <#if app.platformType=2>客户端-手机</#if>
           </td>
           <td align="center" class="hui">
           <#if app.user.userType=0>个人</#if>
           <#if app.user.userType=1>机构</#if></td>
           <td align="center" class="hui">${StringUtil.isBlankToDefault(app.user.realName,app.user.loginName!'空')}</td>
           <td align="center" class="hui">${app.lastTime?string("yyyy-MM-dd HH:mm:ss")}</td>
           <td align="center" class="hui">${AuditStatus.get(app.auditStatus).getTitle()}</td>
           <td align="center" class="hui">
           <#if subject.isPermitted("app:check")>
	           <a href="/app/check.action?appId=${app.appId}&menuClass=appAudit">查看</a>&nbsp;
	       </#if>
	       <#if subject.isPermitted("app:secondCheck")>
	           <a id="fs" href="javascript:;" onclick="recheck(${app.appId});">复审通过</a>&nbsp;
	           <a  id="fsbh" href="javascript:;" onclick="recheckrefusebox(${app.appId});">复审驳回</a>&nbsp;&nbsp;&nbsp;
           </#if>
           </td>
         </tr>
        </#list>
       </table>
       </div>
       </div>
      </div>
      </#if>
       <#if query_type=2>
      <div id="js3">
       <div class="bian">
	    <div class="bianb">
	    <div class="biantop">
		 <ul>
		  <li><a href="javascript:;" onclick="query(0);">应用初审</a></li>
		  <li><a href="javascript:;" onclick="query(1);">应用复审</a></li>
		  <li class="list"><a href="javascript:;" onclick="query(2);">发布上线</a></li>
		 </ul>
		</div>
	   </div>
	    <div class="biao1">
		<table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
         <tr class="lan">
           <td width="7%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序列号</strong></td>
           <td width="10%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用名称</strong></td>
           <td width="9%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用类型</strong></td>
           <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>开发者类型</strong></td>
           <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>开发者名称</strong></td>
           <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>复审通过时间</strong></td>
           <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用状态</strong></td>
           <td width="23%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作</strong></td>
           </tr>
         <#if pager.data?size=0>
          <tr>
           <td align="center" class="hui" colspan="8">没有符合您条件的数据</td>
         </tr>
         </#if>  
        <#list pager.data as app>
         <tr id="${app.appId}">
           <td align="center" class="hui">${app.appId}</td>
           <td align="center" class="hui"><p>${app.appName}</p></td>
           <td align="center" class="hui"> 
           <#if app.platformType=0>站内应用</#if>
           <#if app.platformType=1>客户端-桌面</#if>
           <#if app.platformType=2>客户端-手机</#if>
           </td>
           <td align="center" class="hui">
           <#if app.user.userType=0>个人</#if>
           <#if app.user.userType=1>机构</#if></td>
           <td align="center" class="hui">${StringUtil.isBlankToDefault(app.user.realName,app.user.loginName!'空')}</td>
           <td align="center" class="hui">${app.lastTime?string("yyyy-MM-dd HH:mm:ss")}</td>
           <td align="center" class="hui">${AuditStatus.get(app.auditStatus).getTitle()}</td>
           <td align="center" class="hui">
           <#if subject.isPermitted("app:check")>
	           <a href="/app/check.action?appId=${app.appId}&menuClass=appAudit">查看</a>&nbsp;
	       </#if>
           <#if subject.isPermitted("app:publish")>
           		<a id="sx" href="javascript:;" onclick="updateappdeploystatus(${app.appId},${app.user.userId},'${app.appName}');">上线发布</a>&nbsp;&nbsp;
           </#if>
           </td>
           </tr>
         </#list>
       </table>
       </div>
       </div>
      </div>
      </#if>
     </div>
	<#-- 分页栏 -->
	  <@pageBar pager=pager url="/app/auditapplist.action?app_name="+app_name+"&&platform_type="+platform_type+"&&ati_id="+ati_id+"&&platform_str="+platform_str+"&&query_type="+query_type join="&"></@pageBar>
    </div>
   </div>
<script>
$(function(){
	$('[name="platform_type"]').click(function(){
		val3 = $('[name="platform_type"]').val();
		switch(val3){
					case "0":
							$('[name="platform_str"] option').remove();
							$('[name="platform_str"]').append('<option value="">站内应用</option>');
					break;
					case "1":
					        $('[name="platform_str"] option').remove();
					        $('[name="platform_str"]').append('<option value="">请选择</option>');
                            $('[name="platform_str"]').append('<option value="Windows">Windows</option>');
							$('[name="platform_str"]').append('<option value="Mac">Mac</option>');
                            $('[name="platform_str"]').append('<option value="Linux">Linux</option>');
							$('[name="platform_str"]').append('<option value="Other">Other</option>');
					break;
					case "2":
							$('[name="platform_str"] option').remove();
							$('[name="platform_str"]').append('<option value="">请选择</option>');
							$('[name="platform_str"]').append('<option value="iPhone">iPhone</option>');
							$('[name="platform_str"]').append('<option value="Android">Android</option>');
							$('[name="platform_str"]').append('<option value="Windows Phone">Windows Phone</option>');
							$('[name="platform_str"]').append('<option value="Symbian">Symbian</option>');
							$('[name="platform_str"]').append('<option value="BlackBerry">BlackBerry</option>');
							$('[name="platform_str"]').append('<option value="WebOS">WebOS</option>');
							$('[name="platform_str"]').append('<option value="Other">Other</option>');
					break;
					case "-1":
							$('[name="platform_str"] option').remove();
							$('[name="platform_str"]').append('<option value="">请选择</option>');
					break;
                    default:
					        return false; 
                    };
	})
});
</script>
 <script LANGUAGE="javascript">
 function cspass(appid){
 $("#app_id").val(appid);
$(".xin2").modal().css({
    'width':'432px',
	'margin-top': function () {
        return -($(this).height()/2)},
    'margin-left': function () {
        return -($(this).width()/2);
    }
});
 }
 
 
function Initialapp() {
 var appId=$("#app_id").val();
 var atiId=$("#atiId").val();
	$.post("/app/Initialapp.action", {
				appId : appId,atiId : atiId
			}, function(resp) {
				if (resp.s == 1) {
				    $('.xin2').modal('hide');
					query(0);
					}
			});
}
function firstreject() {
    var appId=$("#reappid").val();
    var operator=$("#operator").val();
    var value="";
    if($("#res").attr("checked")){
    value+=","+$("#res").val();
    }
    if($("#res1").attr("checked")){
    value+=","+$("#res1").val();
    }
	$.post("/app/firstreject.action", {
				appId : appId,refuseCode:value,comments:$("#comments").val(),operator:operator
			}, function(resp) {
				if (resp.s == 1) {
				$('.firstrefuse').modal('hide');
					query(0);
					}
			});
}

//初审驳回
function refuse(appid,userid){
$("#reappid").val(appid);
$("#operator").val(userid);
$(".firstrefuse").modal().css({
	'margin-top': function () {
        return -($(this).height()/2)},
    'margin-left': function () {
        return -($(this).width()/2);
    }
});
}

//弹出复审驳回框
function recheckrefusebox(appId) {
$("#recheckappId").val(appId);
	$(".recheckreject").modal().css({
	'margin-top': function () {
        return -($(this).height()/2)},
    'margin-left': function () {
        return -($(this).width()/2);
    }
});
}

//复审驳回
function recheckreject() {
    var appId=$("#recheckappId").val();
	$.post("/app/recheckreject.action", {
				appId :appId,comments:$("#recheckcomments").val()
			}, function(resp) {
				if (resp.s == 1) {
				$('.recheckreject').modal('hide');
					query(1);
					}
			});
}

//复审通过
function recheck(appId) {
	$.post("/app/recheck.action", {
				appId : appId
			}, function(resp) {
				if (resp.s == 1) {
					$("#"+appId).remove();
				$('.recheckreject').modal('hide');
					query(1);
					}
			});
}

function deleteapp(appId,appName) {
	    $(".pop_sure").modal().css({
	                'width':'390px',
                    'margin-top': function () {
        			return -($(this).height()/2);
                    },	                
                    'margin-left': function () {
        			return -($(this).width()/2);
                    }
               });
        $(".pop_sure .mar").click(function() {
					$.post("/app/deleteapp.action", {
					appid : appId
				}, function(resp) {
					if (resp.s == 1) {
					    $('.pop_sure').modal('hide');
						$("#"+appId).remove();
						}
				});
		});	
}

function query(query_type) {
	$("#query_type").val(query_type);
	queryform.submit();
}

function updateappdeploystatus(appId,userId,appName) {
	$.post("/app/updateappdeploystatus.action", {
				appId : appId,operator:userId,action:appName
			}, function(resp) {
				if (resp.s == 1) {
					query(2);
					}
			});
}

</script>

<div class="xin1 modal hide fade firstrefuse">
  <div class="xin1_1">
   <div class="whitea">初审驳回理由</div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd1">
     <table width="100%" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="16%" align="left" class="hui1">驳回事项：
        <input type="hidden" name="appid" id="reappid"/>
        <input type="hidden" name="operator" id="operator"/>
        </td>
        <td width="35%" class="hui"><input type="checkbox" name="checkbox" id="res"  style="vertical-align:middle" value="1"/>开发者身份认证审核</td>
        <td width="49%" class="hui">
          <input type="checkbox" name="checkbox2" id="res1"  style="vertical-align:middle" value="2"/>
          完善应用信息</td>
        </tr>
      <tr>
        <td colspan="3" class="hui1"><p>驳回内容描述：</p></td>
        </tr>
      <tr>
        <td colspan="3">
          <textarea name="textarea" id="comments" class="texta1"></textarea></td>
        </tr>
      <tr>
        <td colspan="3" class="org">要求控制在20字以内。</td>
      </tr>
     </table>

    </div>
   </div>
   <div class="caidan2"><a href="javascript:;" onclick="firstreject();"><img src="/images/bh.jpg" /></a>&nbsp; <a href="#"><img src="/images/bjwj_05.jpg" data-dismiss="modal"/></a></div>
  </div>
 </div>
 
 
 
 <div class="xin2 modal hide fade">
  <div class="xin1_1">
   <div class="whitea">选择应用分类</div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd1">
     <table width="100%" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="16%" height="45" align="left" class="hui1">应用分类：
        <input type="hidden" name="app_id" id="app_id"/></td>
        <td class="hui">
        <select name="atiId" id="atiId" class="input">
          <#list appTypes as apptype>
          <option value="${apptype.atiId}">${apptype.typeName}</option>
          </#list>
        </select>
        </td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="hui">（请对用户创建的应用进行应用分类）</td>
      </tr>
     </table>

    </div>
   </div>
   <div class="caidan2"><a href="javascript:;" onclick="Initialapp();"><img src="/images/bjwj03.jpg" /></a>&nbsp; <a href="#"><img src="/images/bjwj_05.jpg" data-dismiss="modal"/></a></div>
  </div>
 </div>
 
 <!--复审驳回弹出框-->
 <div class="xin1 modal hide fade recheckreject">
  <div class="xin1_1">
   <div class="whitea">复审驳回理由</div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd1">
     <table width="100%" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="3" class="hui1"><p>驳回内容描述：</p></td>
        <input type="hidden" name="appId" id="recheckappId"/>
        </tr>
      <tr>
        <td colspan="3">
          <textarea name="textarea" name="comments" id="recheckcomments" class="texta1"></textarea></td>
        </tr>
      <tr>
        <td colspan="3" class="org">要求控制在20字以内。</td>
      </tr>
     </table>
    </div>
   </div>
   <div class="caidan2"><a href="javascript:;" onclick="recheckreject();"><img src="/images/bh.jpg" /></a>&nbsp; <a href="#"><img src="/images/bjwj_05.jpg" data-dismiss="modal"/></a></div>
  </div>
 </div>
 
 
 
 
  <!-- 弹窗 开始 -->
<div class="pop_sure modal hide fade">
  <div class="title0">确认框<a class="x" href="javascript:void(0)"  data-dismiss="modal"></a></div>
  <div class="text0">你确定删除吗？</div>
  <div class="w100">
    <ul class="r50">
      <li><a class="button mar" href="javascript:void(0)" value=false><span>确定</span></a><a class="button" 

href="javascript:void(0)"  data-dismiss="modal"><span>取消</span></a></li>
    </ul>
</div>
<!-- 弹窗 结束 --> 
</body>
</html>
