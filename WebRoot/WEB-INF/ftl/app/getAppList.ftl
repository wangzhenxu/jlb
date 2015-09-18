<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-系统分类</title>
<#include "../include/bootstrap.ftl"/>
<#include "../include/pager.ftl">
<link href="/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
</script>
</head>
<script LANGUAGE="javascript">
<!--
var subMenu = new Array(3);
subMenu[0] = 'undefine';
subMenu[1] = 'undefine';
subMenu[2] = 'undefine';
subMenu[3] = 'undefine';
subMenu[4] = 'undefine';
function gotoURL(szURL){
 window.open(szURL,'Main','') ;
}
//-->
</script>
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
     <div class="location01">您现在的位置是：首页 &gt; 开发者管理 <strong>&gt; 应用查看</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">应用查看</div>
     <div class="query">
      <!--<ul>
       <li><span class="classify">应用名称：</span>
         <select name="select" id="select" class="input">
         </select>
       </li>
        <li><span class="classify">应用类型：</span>
          <select name="select" id="select" class="input">
            <option>客户端应用</option>
          </select>
       </li>
       <li><select name="select" id="select" class="inputy">
         <option>桌面</option>
         </select> <select name="select" id="select" class="inputy">
           <option>windows</option>
         </select></li>
        <li><span class="classify">应用类型：</span>
          <select name="select" id="select" class="input">
            <option>客户端应用</option>
          </select>
       </li>
      </ul>-->
      <form action="/app/getAppList.action" method="post" id="queryform">
      <table width="100%" border="0">
        <tr>
          <td width="9%" align="right" class="classify">应用名称：</td>
          <td width="25%"><input name="app_name" type="text"  value="${app_name}" class="inputa" id="app_name"/></td>
          <td width="10%" align="right" class="classify">应用类型：</td>
          <td width="48%">
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
          </select>
            </td>
            <td width="8%" rowspan="3" align="center" valign="middle"><a href="javascript:;" onclick="$(this).parents('form').submit();"><img src="/images/erji_06.jpg" width="64" height="26" /></a></td>
          </tr>
        <tr>
          <td align="right" class="classify">应用状态：</td>
          <td colspan="3" class="hui2">
          	<input id="l1" type="checkbox" name="audit_status"  value="0" id="checkbox" style=" vertical-align:middle"  <#if audit_status?contains(AuditStatus.UNSUBMIT.getCode()?string)>checked="true"</#if> />
            <label for="l1">${AuditStatus.UNSUBMIT.getTitle()} &nbsp;</label>
            <input id="l2" type="checkbox" name="audit_status" value="1" id="checkbox2" style=" vertical-align:middle" <#if audit_status?contains(AuditStatus.FIRST_AUDITING.getCode()?string)>checked="true"</#if> />
            <label for="l2">${AuditStatus.FIRST_AUDITING.getTitle()} &nbsp; </label>
            <input id="l3" type="checkbox" name="audit_status" value="3" id="checkbox3" style=" vertical-align:middle" <#if audit_status?contains(AuditStatus.SECOND_AUDITING.getCode()?string)>checked="true"</#if> />
            <label for="l3">${AuditStatus.SECOND_AUDITING.getTitle()}&nbsp; </label>
            <input id="l4" type="checkbox" name="audit_status" value="2" id="checkbox4" style=" vertical-align:middle" <#if audit_status?contains(AuditStatus.FIRST_AUDIT_FAIL.getCode()?string)>checked="true"</#if> />
            <label for="l4">${AuditStatus.FIRST_AUDIT_FAIL.getTitle()} &nbsp;</label>
            <input id="l5" type="checkbox" name="audit_status" value="4" id="checkbox5" style=" vertical-align:middle" <#if audit_status?contains(AuditStatus.SECOND_AUDIT_FAIL.getCode()?string)>checked="true"</#if> />
            <label for="l5">${AuditStatus.SECOND_AUDIT_FAIL.getTitle()}&nbsp;</label>
            <input id="l6" type="checkbox" name="audit_status" value="5" id="checkbox6" style=" vertical-align:middle" <#if audit_status?contains(AuditStatus.AUDIT_PASS.getCode()?string)>checked="true"</#if> />
            <label for="l6">${AuditStatus.AUDIT_PASS.getTitle()}&nbsp;</label>
            </td>
          </tr>
        <tr>
          <td align="right" class="classify">上线状态：</td>
          <td colspan="3" class="hui2">
          	<input id="l7" type="checkbox" name="deploy_status" value="1" id="checkbox8" style=" vertical-align:middle"  <#if deploy_status?contains(DeployStatus.PUBLISHING.getCode()?string)>checked="true"</#if> />
            <label for="l7">${DeployStatus.PUBLISHING.getTitle()}&nbsp;</label>
  			<input id="l8" type="checkbox" name="deploy_status" value="3" id="checkbox9" style=" vertical-align:middle" <#if deploy_status?contains(DeployStatus.UNPUBLISH.getCode()?string)>checked="true"</#if>/>
            <label for="l8">${DeployStatus.UNPUBLISH.getTitle()}&nbsp;</label>
  			<input id="l9" type="checkbox" name="deploy_status" value="2" id="checkbox10" style=" vertical-align:middle" <#if deploy_status?contains(DeployStatus.MAINTAINING.getCode()?string)>checked="true"</#if>/>
            <label for="l9">${DeployStatus.MAINTAINING.getTitle()}</label> 
            	<input id="l9" type="checkbox" name="deploy_status" value="${DeployStatus.READY.getCode()}" id="checkbox10" style=" vertical-align:middle" <#if deploy_status?contains(DeployStatus.READY.getCode()?string)>checked="true"</#if>/>
            <label for="l9">${DeployStatus.READY.getTitle()}</label> 
           </td>
          </tr>
      </table>
      </form>
     </div>
    </div>
    <div class="form">
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
        <td width="10%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序列号</strong></td>
        <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用名称</strong></td>
        <td width="10%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用类型</strong></td>
        <td width="10%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>开发者类型</strong></td>
        <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>开发者名称</strong></td>
        <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作时间</strong></td>
        <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用状态</strong></td>
        <td width="10%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>上线状态</strong></td>
        <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作</strong></td>
       </tr>
        <#if pager.data?size=0>
          <tr>
           <td align="center" class="hui" colspan="8">没有符合您条件的数据</td>
         </tr>
         </#if>  
       <#list pager.data as app>
       <tr>
        <td align="center" class="hui"><p>${app.appId}</p></td>
        <td align="center" class="hui">${app.appName}</td>
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
        <td align="center" class="hui">${DeployStatus.get(app.deployStatus).getTitle()}</td>
        <td align="center" class="hui">
        <#if subject.isPermitted("app:check")>
	        <a href="/app/check.action?appId=${app.appId}&menuClass=appView">查看 </a> &nbsp;
	    </#if>
        <#if subject.isPermitted("app:appLog")>
	        <a href="javascript:;" onclick="getlog(${app.appId});"> 操作日志 </a>
	    </#if>    
        </td>
       </tr>
       </#list>
      </table>
     </div>
	 <#-- 分页栏 -->
	  <@pageBar pager=pager url="/app/getAppList.action?app_name="+app_name+"&&platform_type="+platform_type+"&&audit_status="+audit_status+"&&platform_str="+platform_str+"&&deploy_status="+deploy_status join="&"></@pageBar>
    </div>
   </div>
   <script LANGUAGE="javascript">
$(function(){
	menuClick("c1");
})
function getlog(appId){
	$.get("/app/logCheck.action",{"appId":appId},function(data){
		$("#logDiv").html(data);
    });
	    $(".log").modal().css({
	                'width':'798px',
                    'margin-top': '-150px',	                
                    'margin-left': function () {
        			return -($(this).width()/2);
                    }
    });
}
 </script>
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
							$('[name="platform_str"]').append('<option value="请选择">请选择</option>');
					break;
                    default:
					        return false; 
                    };
	})
})
</script>
  <!-- 操作日志弹窗开始 -->
 <div class="xin1 modal hide fade log" id="logDiv">
 
</body>
</html>
