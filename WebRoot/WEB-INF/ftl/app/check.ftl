<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站后台管理系统-开发者管理-应用查看</title>
<#include "../include/bootstrap.ftl"/>
</head>
   <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">开发者管理</a> &gt; <strong>应用查看 </strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">应用查看</div>
	</div>
     <div class="nav">
      <div class="ckyy">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#e8e8e8" style=" border-collapse:collapse;">
         <#if app.deployStatus=0> 
         <!--未发布-->
         <#switch app.auditStatus>
         <#case 0> 
        	 <tr>
	           <td width="177" align="right" class="hui1">应用发布状态：</td>
	           <td width="913" align="left" valign="middle" class="org"><strong>${AuditStatus.UNSUBMIT.getTitle()} </strong></td>
	         </tr>
	         <tr>
	           <td align="right" valign="top" class="hui1">创建时间：</td>
	           <td class="hui">${app.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
	         </tr>
         	<#break> 
   		 <#case 1> 
   		 	<tr>
	           <td width="177" align="right" class="hui1">应用发布状态：</td>
	           <td width="913" align="left" valign="middle" class="org"><strong>${AuditStatus.FIRST_AUDITING.getTitle()}</strong></td>
	         </tr>
	         <tr>
	           <td align="right" valign="top" class="hui1">创建时间：</td>
	           <td class="hui">${app.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
	         </tr>
        	<#break> 
  		 <#case 2>
  		 	 <tr>
	           <td width="177" align="right" class="hui1">应用发布状态：</td>
	           <td width="913" align="left" valign="middle" class="org"><strong>${AuditStatus.FIRST_AUDIT_FAIL.getTitle()}</strong></td>
	         </tr>
	         <#list appLogList as appLog>
			     <#if appLog_index == appLogList?size-1>
			     	<tr>
			           <td align="right" class="hui1">驳回申请事项：</td>
			           <td align="left" valign="middle" class="hui">${appLog.action}</td>
			           </tr>
			         <tr>
			           <td align="right" valign="top" class="hui1">驳回申请原因：</td>
			           <td class="hui">${appLog.comments?default('空')}</td>
			           </tr>
			         <tr>
			           <td align="right" valign="top" class="hui1">驳回时间：</td>
			           <td class="hui">${appLog.operateTime?string("yyyy-MM-dd HH:mm:ss")}</td>
			         </tr>
			     </#if>
			 </#list>
            <#break>
        <#case 3>
	 	 <tr>
           <td width="177" align="right" class="hui1">应用发布状态：</td>
           <td width="913" align="left" valign="middle" class="org"><strong>${AuditStatus.SECOND_AUDITING.getTitle()}</strong></td>
         </tr>
         <tr>
           <td align="right" valign="top" class="hui1">创建时间：</td>
           <td class="hui">${app.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
         </tr>
        <#break>
        <#case 4>
  		 	 <tr>
	           <td width="177" align="right" class="hui1">应用发布状态：</td>
	           <td width="913" align="left" valign="middle" class="org"><strong>${AuditStatus.SECOND_AUDIT_FAIL.getTitle()}</strong></td>
	         </tr>
	         <#list appLogList as appLog>
			     <#if appLog_index == appLogList?size-1>
			     	<tr>
			           <td align="right" class="hui1">驳回申请事项：</td>
			           <td align="left" valign="middle" class="hui">${appLog.action}</td>
			           </tr>
			         <tr>
			           <td align="right" valign="top" class="hui1">驳回申请原因：</td>
			           <td class="hui">${appLog.comments?default('空')}</td>
			           </tr>
			         <tr>
			           <td align="right" valign="top" class="hui1">驳回时间：</td>
			           <td class="hui">${appLog.operateTime?string("yyyy-MM-dd HH:mm:ss")}</td>
			         </tr>
			     </#if>
			 </#list>
         <#break>
  		 <#default>
  		 	<tr>
	           <td width="177" align="right" class="hui1">应用发布状态：</td>
	           <td width="913" align="left" valign="middle" class="org"><strong>${AuditStatus.AUDIT_PASS.getTitle()}</strong></td>
	         </tr>
	         <tr>
	           <td align="right" valign="top" class="hui1">审核通过时间：</td>
	           <td class="hui">${app.lastTime?string("yyyy-MM-dd HH:mm:ss")}</td>
	         </tr>
         </#switch>
         <#else> 
	         <!--发布后-->
	         <#switch app.deployStatus>
	         <#case 1>
		         <tr>
		           <td width="177" align="right" class="hui1">应用发布状态：</td>
		           <td width="913" align="left" valign="middle" class="org"><strong>${DeployStatus.PUBLISHING.getTitle()}</strong></td>
		         </tr>
		         <tr>
		           <td align="right" valign="top" class="hui1">上线发布时间：</td>
		           <td class="hui">
		           <#list appLogList as appLog>
		         	<#if appLog.actionType=ActionType.DEPLOY.getCode()>
		           		${appLog.operateTime?string("yyyy-MM-dd HH:mm:ss")}
		           	<#break> 
		           	</#if>
		           </#list>
		           </td>
		         </tr>
	         	<#break>
	         <#case 2>
	         	 <tr>
		           <td width="177" align="right" class="hui1">应用发布状态：</td>
		           <td width="913" align="left" valign="middle" class="org"><strong>${DeployStatus.MAINTAINING.getTitle()}</strong></td>
		         </tr>
		         <tr>
		           <td align="right" valign="top" class="hui1">上线发布时间：</td>
		           <td class="hui">
		           <#list appLogList as appLog>
		           	<#if appLog.actionType=ActionType.DEPLOY.getCode()>
		           		${appLog.operateTime?string("yyyy-MM-dd HH:mm:ss")}
		           	<#break>
		           	</#if>
		           </#list>
		           </td>
		         </tr>
	        	 <#break>
	  		 <#default>
	  		 	<tr>
		           <td width="177" align="right" class="hui1">应用发布状态：</td>
		           <td width="913" align="left" valign="middle" class="org"><strong>${DeployStatus.UNPUBLISH.getTitle()}</strong></td>
		         </tr>
		         <#list appLogList as appLog>
			     <#if appLog_index == 0>
			         <tr>
			           <td align="right" valign="top" class="hui1">下线时间：</td>
			           <td class="hui">${appLog.operateTime?string("yyyy-MM-dd HH:mm:ss")}</td>
			         </tr>
			     </#if>
			 	</#list>
	  		 </#switch>
         </#if>
         <#if subject.isPermitted("app:logCheck")>
	         <tr>
	           <td align="right" valign="top" class="hui1">操作日志：</td>
	           <td class="hui"><a href="javascript:popLog(${app.appId});">查看</a></td>
	         </tr>
		</#if>
       </table>
      </div>
     </div>
     <div class="basic">
	 <div class="basic01">应用信息</div>
	</div>
     <div class="nav">
      <div class="ckyy">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#e8e8e8" style=" border-collapse:collapse;">
         <tr>
           <td width="177" align="right" class="hui1">应用名称：</td>
           <td width="913" align="left" valign="middle" class="hui">${app.appName}</td>
         </tr>
         <tr>
           <td align="right" valign="top" class="hui1">应用介绍：</td>
           <td align="left" valign="middle" class="hui"><p>${app.description}</p></td>
         </tr>
         <tr>
           <td align="right" class="hui1">应用类型：</td>
           <td align="left" valign="middle" class="hui">
			<#switch app.platformType>
         	<#case 0>
         		站内应用
         		<#break>
         	<#case 1>
         		客户端-桌面&nbsp&nbsp${app.platformStr?default('')}	
         		<#break>
         	<#default>
         		客户端-手机&nbsp&nbsp${app.platformStr?default('')}	
         	</#switch>
			</td>
         </tr>
         <tr>
           <td align="right" valign="top" class="hui1">标签TAGS：</td>
           <td align="left" valign="top" class="hui"><p>
			<#list tagsList as tags>
				<#if tags_index=0>
					${tags}
				<#else>
					，${tags}
				</#if>
			</#list>
			</p></td>
         </tr>
         <tr>
           <td align="right" class="hui1">开发者：</td>
           <td align="left" valign="middle" class="hui">${coderName?default('空')}</td>
         </tr>
         <tr>
           <td align="right" class="hui1">创建时间：</td>
           <td align="left" valign="middle" class="hui"><span class="hui">${app.createTime?string("yyyy-MM-dd HH:mm:ss")}</span></td>
         </tr>
         <tr>
           <td align="right" class="hui1">应用地址：</td>
           <td align="left" valign="middle" class="hui">${app.appUrl?default('空')}</td>
         </tr>
         <tr>
           <td align="right" class="hui1">Iframe高度：</td>
           <td align="left" valign="middle" class="hui">
				<#if app.iframeHeight?default(0) = 0>
				高度自适应
				<#else>
				${app.iframeHeight}
				</#if>
			</td>
         </tr>
         <tr>
           <td align="right" class="hui1">数据公开类型：</td>
           <td align="left" valign="middle" class="hui">
           <#if app.iframeHeight?default(1) = 0>
				公开
				<#else>
				不公开
			</#if></td>
         </tr>
         <tr>
           <td align="right" class="hui1">产品图片：</td>
           <td align="left" valign="middle" class="hui">
           	<img src="${ApplicationConst.APP_UPLOAD_PIC_URL}${app.smallIcon?default('../images/zw.jpg')}?temp=${RandomUtil.nextString(10)}" width="64" height="64"/>64*64 
           	<img src="${ApplicationConst.APP_UPLOAD_PIC_URL}${app.largeIcon?default('../images/zw.jpg')}?temp=${RandomUtil.nextString(10)}" width="128" height="128"/>128*128
           </td>
         </tr>
         </table>
      </div>
     </div>  
     
     <!-- 提交审核之后，显示以下信息 -->
     <#if app.auditStatus!=0>
     
   <#if subject.isPermitted("app:identityCheck")>
     <div class="basic">
	 <div class="basic01">身份信息</div>
	</div>
     <div class="nav">
      <div class="ckyy">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#e8e8e8" style=" border-collapse:collapse;">
         <tr>
           <td width="177" align="right" class="hui1">身份认证：</td>
           <td width="913" align="left" valign="middle" class="hui"><a href="javascript:popIdentity(${app.appId},${app.userId})">查看身份信息</a></td>
         </tr>
         </table>
      </div>
     </div>    
   </#if>  
     <div class="basic">
	 <div class="basic01">用户管理</div>
	</div>
     <div class="nav">
      <div class="ckyy">
       <table width="80%" border="1" cellpadding="0" cellspacing="0" bordercolor="#cccccc" style=" border-collapse:collapse;">
         <tr>
           <td width="378" align="center" bgcolor="#e8e8e8" class="hui1"><strong>角色名称</strong></td>
           <td width="496" align="center" valign="middle" bgcolor="#e8e8e8" class="hui"><strong class="hui1">用户名</strong></td>
         </tr>
         <tr>
           <td align="center" class="hui1"><span class="hui">开发者</span></td>
           <td align="center" valign="middle" class="hui">${coderName?default('空')}</td>
         </tr>
         <#list testerNameList as testerName>
         <tr>
           <td align="center" class="hui1"><span class="hui">测试用户</span></td>
           <td align="center" valign="middle" class="hui">${testerName}</td>
         </tr>
         </#list>
         </table>
      </div>
     </div>  
    <#if subject.isPermitted("app:maintenanceLogCheck")>  
     <div class="basic">
	 <div class="basic01">运营信息</div>
	</div>
     <div class="nav">
      <div class="ckyy">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#e8e8e8" style=" border-collapse:collapse;">
         <tr>
           <td width="177" align="right" class="hui1">维护选项状态：</td>
           <td width="913" align="left" valign="middle" class="hui">
			<#if app.deployStatus=2>
           		启用
           	<#else>
           		关闭
           	</#if>
			</td>
         </tr>
         <!--
         <tr>
           <td align="right" class="hui1">维护通告：</td>
           <td align="left" valign="middle" class="hui">无</td>
         </tr>
         <tr>
           <td align="right" class="hui1">维护原因：</td>
           <td align="left" valign="middle" class="hui">无</td>
         </tr>
         -->
         <tr>
           <td align="right" class="hui1">沙河状态：</td>
           <td align="left" valign="middle" class="hui">
			<#if app.sandboxStatus=0>
           		关闭
           	<#else>
           		开启
           	</#if>
			</td>
         </tr>
         <tr>
           <td align="right" class="hui1">运营日志：</td>
           <td class="hui"><a href="javascript:popMaintenanceLog(${app.appId})">查看</a></td>
         </tr>
         </table>
      </div>
     </div>   
   </#if>  
     <div class="basic">
	 <div class="basic01">安全设置</div>
	</div>
     <div class="nav">
      <div class="ckyy">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#e8e8e8" style=" border-collapse:collapse;">
         <tr>
           <td width="177" align="right" class="hui1">取消后回调地址：</td>
           <td width="913" align="left" valign="middle" class="hui">${app.unauthCallback?default('www.loiot.com')}</td>
         </tr>
         <tr>
           <td align="right" class="hui1">授权回调地址：</td>
           <td align="left" valign="middle" class="hui">${app.authCallback?default('www.loiot.com')}</td>
         </tr>
         <tr>
           <td align="right" class="hui1">用户ID：</td>
           <td align="left" valign="middle" class="hui">${app.clientId}</td>
         </tr>
         <tr>
           <td align="right" class="hui1">当前APP密码：</td>
           <td align="left" valign="middle" class="hui"><p>${app.appSecret}</p></td>
         </tr>
         </table>
      </div>
     </div>  
   <#if subject.isPermitted("app:getAppUserLogList")>       
     <!--上线发布之后，显示数据统计-->
     <#if app.deployStatus!=0>
     <div class="basic">
	 <div class="basic01">数据统计</div>
	</div>
     <div class="nav">
      <div class="ckyy">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#e8e8e8" style=" border-collapse:collapse;">
         <tr>
           <td width="87" align="right" class="hui1">当前用户数量：</td>
           <td width="691" align="left" valign="middle" class="hui">${app.userCount}</td>
         </tr>
         <tr>
         <td colspan="2">
              <div class="c_wrap">
     <div class="usern_wrap">
        <div class="tn clearfix">
          <ul class="tab clearfix">
            <li class="show0" id="1" onclick="groupTypeChange(1)">日</li>
            <li id="2" onclick="groupTypeChange(2)">月</li>
            <input type="hidden" value="1" id="groupType">
          </ul>
		  <ul class="sel clearfix w1" >
            <li><input class="Wdate" type="text" id="Wdate1" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></li>
            <li>至</li>
			<li><input class="Wdate" type="text" id="Wdate2" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></li>
          </ul>
		  <a href="javascript:void(0);" class="button3" onclick="searchFun()" id="search">搜索</a>
        </div>
        <ul class="taba clearfix">
          <li rel="w11" class="show0" onclick="appUserLogTypeChange(${AppUserLogType.AUTHORIZED.getCode()})"><span class="a001">新增用户数</span></li>
          <li rel="w12" onclick="appUserLogTypeChange(${AppUserLogType.UNAUTHORIZED.getCode()})"><span class="a002">解除绑定用户数</span></li>
          <li rel="w13" onclick="appUserLogTypeChange(${AppUserLogType.ACCESS.getCode()})"><span class="a003">活跃用户数</span></li>
          <input type="hidden" value="0" id="appUserLogType">
        </ul>
      </div>
      <div id="dataDiv"><#include "data.ftl"></div>
     </div>
    </div>
  </#if>       
         
         </td>
         </tr>
         </table>
      </div>
     </div>  
    <div class="anniu">&nbsp;<a href="javascript:history.go(-1)"><img src="/images/gddc_05.jpg" /></a></div>
   </div>
  </div>
 </div>
 </#if>
</#if>
  <!-- 操作日志弹窗开始 -->
 <div class="xin1 modal hide fade log" id="logDiv">
 
 </div>
 <!-- 弹窗 结束 -->
 <!-- 身份验证弹窗开始 -->
 <div class="xin1 modal hide fade identity" id="identityDiv">
 
 </div>
 <!-- 弹窗 结束 -->
 <!-- 运营信息弹窗开始 -->
 <div class="xin1 modal hide fade maintenanceLog" id="maintenanceLogDiv">
 
 </div>
 <!-- 弹窗 结束 -->
 
 <!--数据统计-->
 <script type="text/javascript">
 
 function popLog(appId) {
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
function popIdentity(appId,userId) {
	
	$.get("/app/identityCheck.action",{"appId":appId,"userId":userId},function(data){
		$("#identityDiv").html(data);
    });
	    $(".identity").modal().css({
	                'width':'430px',
                    'margin-top': '-150',     
                    'margin-left': function () {
        			return -($(this).width()/2);
                    }
               });
}
function popMaintenanceLog(appId) {
	$.get("/app/maintenanceLogCheck.action",{"appId":appId},function(data){
		$("#maintenanceLogDiv").html(data);
    });

	    $(".maintenanceLog").modal().css({
	                'width':'798px',
                    'margin-top': '-150',	                
                    'margin-left': function () {
        			return -($(this).width()/2);
                    }
               });
}
 
 
$(function() {
    $(".tab li").click(function() {
        var curList = $(".tab li.show0").attr("rel");
        var $newList = $(this);
        $(".tab li").removeClass("show0");
        $newList.addClass("show0");
        var listID = $newList.attr("rel");
        if (listID != curList) {
            $("."+curList).hide();
            $("."+listID).show();
        }                
        return false;
    });
});
$(function() {
    $(".taba li").click(function() {
        var curList = $(".taba li.show0").attr("rel");
        var $newList = $(this);
        $(".taba li").removeClass("show0");
        $newList.addClass("show0");
        var listID = $newList.attr("rel");
        if (listID != curList) {
            $("."+curList).hide();
            $("."+listID).show();
        }                
        return false;
    });
});

function searchFun() {
        var startTime = $("ul #Wdate1").val();//第一个input框时间
        var endTime = $("ul #Wdate2").val();//第二个input框时间
        var appUserLogType = $("#appUserLogType").val();
        var groupType = $("#groupType").val();
        $.get("/app/getAppUserLogList.action",{groupType:groupType,appUserLogType:appUserLogType,startTime:startTime,endTime:endTime,appId:${app.appId}},function(data){
			$("#dataDiv").html(data);
		});
}
function groupTypeChange(type){
	$("#groupType").val(type);
}
function appUserLogTypeChange(type){
	$("#appUserLogType").val(type);
    var startTime = $("ul #Wdate1").val();//第一个input框时间
    var endTime = $("ul #Wdate2").val();//第二个input框时间
    var appUserLogType = $("#appUserLogType").val();
    var groupType = $("#groupType").val();
    $.get("/app/getAppUserLogList.action",{groupType:groupType,appUserLogType:appUserLogType,startTime:startTime,endTime:endTime,appId:${app.appId}},function(data){
		$("#dataDiv").html(data);
	});
}
//添加时间
$(function(){
$("#Wdate1").addTime(7);//添加一周前时间
$("#Wdate2").addTime(0);//添加当前时间
})
</script>
<script src="/js/my97/WdatePicker.js"></script>
<script src="/js/highcharts/highcharts.js"></script>
<script src="http://www.loiot.com/c/loiot.core.min.js"></script>
<script src="http://www.loiot.com/c/addTime/jquery.addTime.js"></script>
<script src="/js/checkIamge.js"></script>
<script src="/js/ajaxfileupload.js"></script>