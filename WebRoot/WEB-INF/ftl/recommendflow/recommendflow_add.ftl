
<#include "../include/comm_jlb_macro.ftl"/>

<script>
	 left_menu_class_num=1;
	 leftMenuNum=1;
</script>
<#include "../include/bootstrap.ftl"/>
<script type="text/javascript" src="/js/source/jquery.validationEngine.js"></script>
<script type="text/javascript" src="/js/source/jquery.validationEngine.min.js"></script>
<link href="/css/c_validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<script src="/js/ajaxfileupload.js"></script>
<script src="/js/my97/WdatePicker.js" type="text/javascript" > </script>
<script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>
 

<form id="addform" name="form"  method="post" enctype="multipart/form-data">

<!-- 右侧 开始 -->
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="javascript:jlInfo.tolist();">流程管理</a> &gt; <strong > 流程详情</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01" style="width:300px;" >技术评审  
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  求职者: <span style="color:red;">  ${p.jlName!''}</span>   </div>
	</div>
     <div class="query1" style="width:100%;">
       <table width="100%" border="0" align="left">
         <tbody>
         
         <tr>
           <td align="right" class="hui1">技术评审人：</td>
           <td align="left" valign="middle">
				${p.technicianAuditPersonName!''}
           </td>
            <td align="right" class="hui1">评审时间：</td>
           	<td align="left" valign="middle">
           		<#if p.technicianAuditTime??>
        		 	${p.technicianAuditTime?string("yyyy-MM-dd HH:mm:ss")}
 				</#if>
           </td>
         </tr>
         
         <tr>
           <td align="right" class="hui1">评审内容：</td>
           <td align="left" valign="middle" colspan="3">
				<textarea rows="12" style="width: 900px;">${p.technicianAuditContent!''}</textarea>
           </td>
         </tr>
         
         </tbody></table>
     </div>
     
     
    <div class="basic">
	 <div class="basic01" >企业对接</div>
	</div>
	
	<div class="query1" style="width:100%;">
       <table width="100%" border="0" align="left">
         <tbody>
         
         
          <tr>
           <td align="right" class="hui1">企业对接人：</td>
           <td align="left" valign="middle">
				${p.enterpriseInterfacePersonName!''}
           </td>
            <td align="right" class="hui1">推送简历时间：</td>
           	<td align="left" valign="middle">
          		<#if p.enterpriseDockingTime??>
        		 	${p.enterpriseDockingTime?string("yyyy-MM-dd HH:mm:ss")}
 				</#if>
           </td>
         </tr>
         
          <tr>
           <td align="right" class="hui1">推送状态：</td>
           <td align="left" valign="middle" colspan="3">
           		<#if p.enterpriseDockingStatus??>
           			${RecommendFlowType.ALREADY_RECOMMEND_COMPANY.getTitle()}
           		</#if>
           </td>
           
           
           
         </tr>
         
         <tr>
           <td align="right" class="hui1">企业反馈状态：</td>
           <td align="left" valign="middle"  >
				${DictionaryUtil.getName(p.enterpriseReplyStatus)}
           </td>
            <td align="right" class="hui1">企业反馈时间：</td>
           	<td align="left" valign="middle">
          		<#if p.enterpriseReplyTime??>
        		 	${p.enterpriseReplyTime?string("yyyy-MM-dd HH:mm:ss")}
 				</#if>
           </td>
         </tr>
         
         <tr>
          
           <td align="right" class="hui1">企业反馈内容：</td>
           <td align="left" valign="middle" colspan="3">
           	   <textarea rows="6" style="width:900px;">${p.enterpriseReplyContent!''}</textarea>
           </td>
         </tr>
         
         </tbody></table>
     </div>
     
     
     
    <div class="basic">
	 <div class="basic01" >猎头顾问对接</div>
	</div>
	
	<div class="query1" style="width:100%;">
       <table width="100%" border="0" align="left">
         <tbody>
         
          <tr>
           <td align="right" class="hui1">猎头顾问：</td>
           <td align="left" valign="middle">
				${p.headhunterInterfacePersonName!''}
           </td>
            <td align="right" class="hui1">通知面试时间：</td>
           	<td align="left" valign="middle">
          		<#if p.hrNoticeTime??>
        		 	${p.hrNoticeTime?string("yyyy-MM-dd HH:mm:ss")}
 				</#if>
           </td>
         </tr>
         
          <tr>
           <td align="right" class="hui1">反馈状态：</td>
           <td align="left" valign="middle" colspan="3" >
				${DictionaryUtil.getName(p.hrNoticeStatus)}
           </td>
         </tr>
         
         <tr>
          
           <td align="right" class="hui1">反馈内容：</td>
           <td align="left" valign="middle" colspan="3">
           	   <textarea rows="6" style="width:900px;">${p.hrNoticeFeedbackContent!''}</textarea>
           </td>
         </tr>
         
         
         <tr>
           <td align="right" class="hui1">
           	反馈状态：
           </td>
           <td align="left" valign="middle" colspan="3">
				<#if p.hunterGotoInterviewStatus??>
           			<#if p.hunterGotoInterviewStatus==RecommendFlowType.HUNTER_ALREAD_GOTO_INTERVIEW.getCode()>
           				${RecommendFlowType.HUNTER_ALREAD_GOTO_INTERVIEW.getTitle()}
           			</#if>
           			<#if p.hunterGotoInterviewStatus==RecommendFlowType.HUNTER_NO_GOTO_INTERVIEW.getCode()>
           				${RecommendFlowType.HUNTER_NO_GOTO_INTERVIEW.getTitle()}
           			</#if>
           		</#if>
          
         </tr>
         
          <tr>
            <td align="right" class="hui1">面试结果</td>
           	<td align="left" valign="middle">
          		<#if p.hunterInterviewStatus??>
           			<#if p.hunterInterviewStatus==RecommendFlowType.HUNTER_INTERVIEW_PASS.getCode()>
           				${RecommendFlowType.HUNTER_INTERVIEW_PASS.getTitle()}
           			</#if>
           			<#if p.hunterInterviewStatus==RecommendFlowType.HUNTER_INTERVIEW_NO_PASS.getCode()>
           				${RecommendFlowType.HUNTER_INTERVIEW_NO_PASS.getTitle()}
           			</#if>
           		</#if>
           </td>
           <td align="right" class="hui1">反馈时间</td>
           	<td align="left" valign="middle">
          		<#if p.hunterInterviewOperatorTime??>
        		 	${p.hunterInterviewOperatorTime?string("yyyy-MM-dd HH:mm:ss")}
 				</#if>
           </td>
         </tr>
         
         <tr>
           <td align="right" class="hui1">反馈内容：</td>
           <td align="left" valign="middle" colspan="3">
           	   <textarea rows="6" style="width:900px;">${p.hunterInerviewReplayContent!''}</textarea>
           </td>
         </tr>
         
         </tbody></table>
     </div>
     
    </div>
    <div class="anniu">
      <#if (Session[Const.SESSION_USER_KEY].type==AccountType.ADMIN.getCode() || Session[Const.SESSION_USER_KEY].type==AccountType.TECHICAL_AUDIT.getCode() )>
    	<button type="button" class="btn btn-default" onclick="window.open('${p.jlFilePath}')">简历下载</button>
      </#if>
      
	 	<button style="margin-left:30px;" type="button" class="btn btn-default" onclick="location.href='/zpRecommendFlowInfo/list.action'">返&nbsp; 回</button>
    </div>
   </div>
<!-- 右侧 结束 -->
</form>
<#include "../include/deleteConfirmModal.ftl">
<script>
	$("textarea").attr("readonly",true);
</script>
