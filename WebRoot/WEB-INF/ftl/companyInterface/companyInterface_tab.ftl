 <#if flowStatus?? && flowStatus==RecommendFlowType.WAIT_RECOMMEND_COMPANY.getCode()>
 <table class="table_style03">
    <tbody><tr>
        <th width="9%">公司名称</th>
        <th width="11%">职位名称</th>
        <th width="11%">求职者</th>
        <th width="15%">技术审核人</th>
        <th width="16%">技术评审时间</th>
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
			 <td align="center" class="hui" style="width:300px;"  >
		       		<div class="btn-group">
	      			<#if subject.isPermitted("zpJlInfo:list")>   <#--zpRecommendFlowInfo:detail  -->
					  <button type="button" class="btn btn-default"  onclick="recommendflow.toDetail('${c.auditId}')">详情</button>
					 </#if>
					 
	      			<#if subject.isPermitted("zpJlInfo:list")>  <#--zpRecommendFlowInfo:edit  -->
					  <button type="button" class="btn btn-default"  onclick="recommendflow.toEdit('${c.auditId}')">修改</button>
					 </#if>
					 
	      			<#if subject.isPermitted("zpJlInfo:list")>  <#--zpRecommendFlowInfo:disableAndEnabled  -->
					  <#if c.isDelete??>
					  	<button type="button" class="btn btn-default"  onclick=recommendflow.modifyDeleteStatus('${c.auditId}', '${c.isDelete!""}' );>
					  	 	<#if c.isDelete==PauseStartType.START.getCode()> 暂停 </#if>
					  	 	<#if c.isDelete==PauseStartType.PAUSE.getCode()> 启用 </#if>
					  </button>	
					  </#if>
					 	</#if>
					  <button type="button" class="btn btn-default"  onclick="recommendflow.toAddJob('${c.auditId}')">发布职位</button>
		      		</div>
	        </td>
	       </tr>
	       </#list>
</tbody></table>
 </#if>
 
 
 <#if flowStatus?? && flowStatus==RecommendFlowType.ALREADY_RECOMMEND_COMPANY.getCode()>
 <table class="table_style03">
    <tbody><tr>
        <th width="9%">公司名称</th>
        <th width="11%">职位名称</th>
        <th width="11%">求职者</th>
        <th width="15%">技术审核人</th>
        <th width="16%">技术评审时间</th>
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
			 <td align="center" class="hui" style="width:300px;"  >
		       		<div class="btn-group">
	      			<#if subject.isPermitted("zpJlInfo:list")>   <#--zpRecommendFlowInfo:detail  -->
					  <button type="button" class="btn btn-default"  onclick="recommendflow.toDetail('${c.auditId}')">详情</button>
					 </#if>
					 
	      			<#if subject.isPermitted("zpJlInfo:list")>  <#--zpRecommendFlowInfo:edit  -->
					  <button type="button" class="btn btn-default"  onclick="recommendflow.toEdit('${c.auditId}')">修改</button>
					 </#if>
					 
	      			<#if subject.isPermitted("zpJlInfo:list")>  <#--zpRecommendFlowInfo:disableAndEnabled  -->
					  <#if c.isDelete??>
					  	<button type="button" class="btn btn-default"  onclick=recommendflow.modifyDeleteStatus('${c.auditId}', '${c.isDelete!""}' );>
					  	 	<#if c.isDelete==PauseStartType.START.getCode()> 暂停 </#if>
					  	 	<#if c.isDelete==PauseStartType.PAUSE.getCode()> 启用 </#if>
					  </button>	
					  </#if>
					 	</#if>
					  <button type="button" class="btn btn-default"  onclick="recommendflow.toAddJob('${c.auditId}')">发布职位</button>
		      		</div>
	        </td>
	       </tr>
	       </#list>
</tbody></table>
 </#if>