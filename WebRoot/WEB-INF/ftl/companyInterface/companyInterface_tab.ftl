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
		        	 	 ${c.technicianAuditTime?string("yyyy-MM-dd HH:mm:ss")}
		 		 	 </#if>
		 	 </td>
		 	  <td align="center" class="hui">
		 	   <#if c.flowStatus??>
         			${RecommendFlowType.get(c.flowStatus).getTitle()}
        		</#if>
		 	 </td>
			 <td align="center" class="hui" style="width:300px;"  >
		       		<div class="btn-group">
					  <button type="button" class="btn btn-default"  onclick="companyInterface.toDetail('${c.auditId}')">详情</button>
		      		</div>
	        </td>
	       </tr>
	       </#list>
</tbody></table>
 </#if>
 
 
 <#if flowStatus?? && flowStatus==RecommendFlowType.WAIT_RECOMMEND_COMPANY.getCode()>
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
		        	 	 ${c.technicianAuditTime?string("yyyy-MM-dd HH:mm:ss")}
		 		 	 </#if>
		 	 </td>
		 	  <td align="center" class="hui">
		 	   <#if c.flowStatus??>
         			${RecommendFlowType.get(c.flowStatus).getTitle()}
        		</#if>
		 	 </td>
			 <td align="center" class="hui" style="width:300px;"  >
		       		<div class="btn-group">
					  <button type="button" class="btn btn-default"  onclick="companyInterface.toDetail('${c.auditId}')">详情</button>
					  <button type="button" class="btn btn-default"  onclick="companyInterface.recommandJlToCompany('${c.auditId}')">推荐</button>
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
		        	 	 ${c.technicianAuditTime?string("yyyy-MM-dd HH:mm:ss")}
		 		 	 </#if>
		 	 </td>
		 	  <td align="center" class="hui">
		 	   <#if c.flowStatus??>
         			${RecommendFlowType.get(c.flowStatus).getTitle()}
        		</#if>
		 	 </td>
			 <td align="center" class="hui" style="width:300px;"  >
		       		<div class="btn-group">
					  <button type="button" class="btn btn-default"  onclick="companyInterface.audit('${c.auditId!""}','${c.jlName!""}')">企业反馈</button>
					 </div>
			</td>	
	       </tr>
	       </#list>
</tbody></table>



 </#if>