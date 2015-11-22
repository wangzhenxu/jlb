

  	<#include "../include/comm_jlb_macro.ftl"/>
<html>
	<head>
	<title>网站后台管理系统-${pageTitle!''}管理</title>
	<@gmc_common_js "select" />
</head>
	<body>
	<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong class="m_title"></strong></div>
    </div>
    <div class="sort">
     <div class="sort1 m_title" ></div>
     <div class="query">
  	
	<form id="queryForm" >
	<ul>
			 <li style="width:22%">
		       	<span class="classify">公司名称：</span>
		    	<input name="name" type="text"   class="input"  id="name" value=""/>
		      </li>
			       <li style="width:15%">
			       	<span class="classify">公司职位：</span>
			    	<select id="companyJobId" name="companyJobId">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_INDUSTRY.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  companyJobId?? && companyJobId!="" > <#if companyJobId?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    	</select>
			       </li>
			      
			      
			      
		    <li style="width:5%"><a href="javascript:void(0)">
  		 		<button type="button" class="btn btn-default" id="queryBtn" >查&nbsp;询</button>
       		</li>
      </ul>
      
      	<ul>
				       
				       
				       <li style="width:15%">
				       	<span class="classify">hr通知状态：</span>
				    	<select id="hrNoticeStatus" name="hrNoticeStatus">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_INDUSTRY.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  hrNoticeStatus?? && hrNoticeStatus!="" > <#if hrNoticeStatus?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    		  </select>
				       </li>
				       
				       <li style="width:15%">
				       	<span class="classify">是否去面试：</span>
				    	<select id="hunterGotoInterviewStatus" name="hunterGotoInterviewStatus">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_INDUSTRY.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  hunterGotoInterviewStatus?? && hunterGotoInterviewStatus!="" > <#if hunterGotoInterviewStatus?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    		  </select>
				       </li>
				      
				       <li style="width:15%">
				       	<span class="classify">流程状态：</span>
				    	<select id="flowStatus" name="flowStatus">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_INDUSTRY.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  flowStatus?? && flowStatus!="" > <#if flowStatus?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    		  </select>
				       </li>
				      
      	</ul>
  </form>
     </div>
    </div>
    <div class="form">
      <#if subject.isPermitted("zpJlInfo:list")>  <#--zpRecommendFlowInfo:add  -->
    		<div class="btn-group">
			  <button type="button" class="btn btn-default"  onclick="recommendflow.toAdd();">增加流程</button>
	      	</div>
     </#if>
     <div class="form2">
     
<table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
      
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>公司职位</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>简历</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>匹配</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>技术审核人</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>技术评审时间</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>技术评审状态</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>流程状态</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
       <#list pager.data as c>
       <tr>
       
	 	  <td align="center" class="hui">
	 	  <#if c.companyJobId??>
	 	    	${DictionaryUtil.getName(c.companyJobId)} 
	 	  </#if>
	 	   </td>
	 	  <td align="center" class="hui">
	 	  <#if c.jlId??>
	 	    	${DictionaryUtil.getName(c.jlId)} 
	 	  </#if>
	 	   </td>
	 	  <td align="center" class="hui">
	 	  <#if c.matchId??>
	 	    	${DictionaryUtil.getName(c.matchId)} 
	 	  </#if>
	 	   </td>
	 	  <td align="center" class="hui">
	 	  <#if c.technicianAuditPerson??>
	 	    	${DictionaryUtil.getName(c.technicianAuditPerson)} 
	 	  </#if>
	 	   </td>
		 <td align="center" class="hui">
    			 <#if c.technicianAuditTime??>
	        	 	 ${c.technicianAuditTime?string("yyyy-MM-dd")}
	 		 	 </#if>
	 	 </td>
		  <td align="center" class="hui">${c.technicianAuditStatus!''}</td>
	 	 
	 	 
		
		 
		 
	 	  <td align="center" class="hui">
	 	  <#if c.flowStatus??>
	 	    	${DictionaryUtil.getName(c.flowStatus)} 
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
       <tr>
     	 <td colspan="10" valign="middle" class="d">
     	 
      			<#if subject.isPermitted("zpJlInfo:list")>  <#--zpRecommendFlowInfo:delete  -->
     	 	 <div class="btn-group" style="display:none;">
			   <button type="button" class="btn btn-default"  onclick="javascipt:void(0);">删除</button>
      	 	 </div>
				</#if>
     	 	
     	 </td>
       </tr>
      </table>
     
     </div>
     <@pageBar   pager=pager url="/zpRecommendFlowInfo/list.action?jsonParam=${jsonParam!''}" join="&"> </@pageBar> 
    
    </div>
   </div>
  <!-- 弹窗 结束 -->
	<#include "../include/deleteConfirmModal.ftl">
    <script src="/js/recommendflow.js"></script>
    <script>
		recommendflow.initPage();
	</script>
</html>



