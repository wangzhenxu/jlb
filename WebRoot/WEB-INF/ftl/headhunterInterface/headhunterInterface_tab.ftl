 <!-- 所有 -->
 <#if flowStatus??> 
  <#else>
 <table class="table_style03">
    <tbody><tr>
        <th width="9%">公司名称</th>
        <th width="11%">职位名称</th>
        <th width="11%">求职者</th>
        <th width="15%">技术审核人</th>
        <th width="16%">技术评审时间</th>
        <th width="15%">状态</th>
        <th width="16%">操作</th>
    </tr>
    
      <#list pager.data as c>
	       <tr>
	       
		 	  <td align="center" class="hui">
		 	 	${c.companyName!''}
		 	   </td>
		 	  <td align="center" class="hui">
		 	  	${c.companyJobName!''}
		 	   </td>
		 	  <td align="center" class="hui">
		 	 		${c.jlName!''}
		 	   </td>
		 	     <td align="center" class="hui">
		 	 		${c.technicianAuditPersonName!''}
		 	   </td>
			 <td align="center" class="hui">
	    			 <#if c.technicianAuditTime??>
		        	 	 ${c.technicianAuditTime?string("yyyy-MM-dd")}
		 		 	 </#if>
		 	 </td>
		 	  <td align="center" class="hui">
		 	   <#if c.flowStatus??>
         			${RecommendFlowType.get(c.flowStatus).getTitle()}
        		</#if>
		 	 </td>
			 <td align="center" class="hui" style="width:300px;"  >
		       		<div class="btn-group">
	      			<#if subject.isPermitted("zpJlInfo:list")>   <#--zpRecommendFlowInfo:detail  -->
					  <button type="button" class="btn btn-default"  onclick="recommendflow.toDetail('${c.auditId}')">详情</button>
					 </#if>
		      		</div>
	        </td>
	       </tr>
	       </#list>
</tbody></table>
 </#if>
 
 <!--已通知-->
 <#if flowStatus?? && flowStatus==RecommendFlowType.COMPANY_INVITATION_INTERVIEW.getCode()>
 <table class="table_style03">
    <tbody><tr>
        <th width="9%">公司名称</th>
        <th width="11%">职位名称</th>
        <th width="11%">求职者</th>
        <th width="15%">技术审核人</th>
        <th width="16%">技术评审时间</th>
        <th width="15%">状态</th>
        <th width="16%">操作</th>
    </tr>
    
      <#list pager.data as c>
	       <tr>
	       
		 	  <td align="center" class="hui">
		 	 	${c.companyName!''}
		 	   </td>
		 	  <td align="center" class="hui">
		 	  	${c.companyJobName!''}
		 	   </td>
		 	  <td align="center" class="hui">
		 	 		${c.jlName!''}
		 	   </td>
		 	     <td align="center" class="hui">
		 	 		${c.technicianAuditPersonName!''}
		 	   </td>
			 <td align="center" class="hui">
	    			 <#if c.technicianAuditTime??>
		        	 	 ${c.technicianAuditTime?string("yyyy-MM-dd")}
		 		 	 </#if>
		 	 </td>
		 	  <td align="center" class="hui">
		 	   <#if c.flowStatus??>
         			${RecommendFlowType.get(c.flowStatus).getTitle()}
        		</#if>
		 	 </td>
			 <td align="center" class="hui" style="width:300px;"  >
		       		<div class="btn-group">
	      			<#if subject.isPermitted("zpJlInfo:list")>   <#--zpRecommendFlowInfo:detail  -->
					  <button type="button" class="btn btn-default"  onclick="recommendflow.toDetail('${c.auditId}')">详情</button>
					 </#if>
					 <button type="button" class="btn btn-default"  onclick="headhunterInterface.audit('${c.auditId!""}','${c.jlName!""}')">已通知</button>
		      		</div>
	        </td>
	       </tr>
	       </#list>
</tbody></table>
 </#if>
 
 <!-已推荐到企业待企业回复- -->
 <#if flowStatus?? && flowStatus==RecommendFlowType.ALREADY_RECOMMEND_COMPANY.getCode()>
 <table class="table_style03">
    <tbody><tr>
        <th width="9%">公司名称</th>
        <th width="11%">职位名称</th>
        <th width="11%">求职者</th>
        <th width="15%">技术审核人</th>
        <th width="16%">技术评审时间</th>
        <th width="15%">状态</th>
        <th width="16%">操作</th>
    </tr>
    
      <#list pager.data as c>
	       <tr>
	       
		 	  <td align="center" class="hui">
		 	 	${c.companyName!''}
		 	   </td>
		 	  <td align="center" class="hui">
		 	  	${c.companyJobName!''}
		 	   </td>
		 	  <td align="center" class="hui">
		 	 		${c.jlName!''}
		 	   </td>
		 	     <td align="center" class="hui">
		 	 		${c.technicianAuditPersonName!''}
		 	   </td>
			 <td align="center" class="hui">
	    			 <#if c.technicianAuditTime??>
		        	 	 ${c.technicianAuditTime?string("yyyy-MM-dd")}
		 		 	 </#if>
		 	 </td>
		 	  <td align="center" class="hui">
		 	   <#if c.flowStatus??>
         			${RecommendFlowType.get(c.flowStatus).getTitle()}
        		</#if>
		 	 </td>
			 <td align="center" class="hui" style="width:300px;"  >
		       		<div class="btn-group">
	      			<#if subject.isPermitted("zpJlInfo:list")>   <#--zpRecommendFlowInfo:detail  -->
					 <button type="button" class="btn btn-default"  onclick="headhunterInterface.audit('${c.auditId!""}','${c.jlName!""}')">已通知</button>
					 </#if>
	       </tr>
	       </#list>
</tbody></table>
 </#if>
 
 <!--同意去面试- -->
 <#if flowStatus?? && flowStatus==RecommendFlowType.WAIT_JOBHUNTER_GOTO_INTERVIEW.getCode()>
 <table class="table_style03">
    <tbody><tr>
        <th width="9%">公司名称</th>
        <th width="11%">职位名称</th>
        <th width="11%">求职者</th>
        <th width="15%">技术审核人</th>
        <th width="16%">技术评审时间</th>
        <th width="15%">状态</th>
        <th width="16%">操作</th>
    </tr>
    
      <#list pager.data as c>
	       <tr>
	       
		 	  <td align="center" class="hui">
		 	 	${c.companyName!''}
		 	   </td>
		 	  <td align="center" class="hui">
		 	  	${c.companyJobName!''}
		 	   </td>
		 	  <td align="center" class="hui">
		 	 		${c.jlName!''}
		 	   </td>
		 	     <td align="center" class="hui">
		 	 		${c.technicianAuditPersonName!''}
		 	   </td>
			 <td align="center" class="hui">
	    			 <#if c.technicianAuditTime??>
		        	 	 ${c.technicianAuditTime?string("yyyy-MM-dd")}
		 		 	 </#if>
		 	 </td>
		 	  <td align="center" class="hui">
		 	   <#if c.flowStatus??>
         			${RecommendFlowType.get(c.flowStatus).getTitle()}
        		</#if>
		 	 </td>
			 <td align="center" class="hui" style="width:300px;"  >
		       		<div class="btn-group">
	      			<#if subject.isPermitted("zpJlInfo:list")>   <#--zpRecommendFlowInfo:detail  -->
					 <button type="button" class="btn btn-default"  onclick="headhunterInterface.openIsGotoInterviewPopFeedbackPop('${c.auditId!""}','${c.jlName!""}')">是否去面试</button>
					 </#if>
	       </tr>
	       </#list>
</tbody></table>
 </#if>
 
  <!--已面试- -->
 <#if flowStatus?? && flowStatus==RecommendFlowType.HUNTER_ALREAD_GOTO_INTERVIEW.getCode()>
 <table class="table_style03">
    <tbody><tr>
        <th width="9%">公司名称</th>
        <th width="11%">职位名称</th>
        <th width="11%">求职者</th>
        <th width="15%">技术审核人</th>
        <th width="16%">技术评审时间</th>
        <th width="15%">状态</th>
        <th width="16%">操作</th>
    </tr>
    
      <#list pager.data as c>
	       <tr>
	       
		 	  <td align="center" class="hui">
		 	 	${c.companyName!''}
		 	   </td>
		 	  <td align="center" class="hui">
		 	  	${c.companyJobName!''}
		 	   </td>
		 	  <td align="center" class="hui">
		 	 		${c.jlName!''}
		 	   </td>
		 	     <td align="center" class="hui">
		 	 		${c.technicianAuditPersonName!''}
		 	   </td>
			 <td align="center" class="hui">
	    			 <#if c.technicianAuditTime??>
		        	 	 ${c.technicianAuditTime?string("yyyy-MM-dd")}
		 		 	 </#if>
		 	 </td>
		 	  <td align="center" class="hui">
		 	   <#if c.flowStatus??>
         			${RecommendFlowType.get(c.flowStatus).getTitle()}
        		</#if>
		 	 </td>
			 <td align="center" class="hui" style="width:300px;"  >
		       		<div class="btn-group">
	      			<#if subject.isPermitted("zpJlInfo:list")>   <#--zpRecommendFlowInfo:detail  -->
					 </#if>
					<button type="button" class="btn btn-default"  onclick="headhunterInterface.openInterviewerFeedbackPop('${c.auditId!""}','${c.jlName!""}')">面试结果</button>
	       </tr>
	       </#list>
</tbody></table>
 </#if>