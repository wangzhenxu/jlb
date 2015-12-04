
<html>
	<head>
	<title>网站后台管理系统-简历管理</title>
	<#include "../include/bootstrap.ftl"/>
	<#include "../include/pager.ftl">
	<script src="/js/source/jquery.validationEngine.js"></script>
	<script src="/js/source/jquery.validationEngine.min.js"></script>
	<link href="/js/source/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="/js/hiAlert/jquery.alert.js"></script>
	<link href="/css/alert.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		body {
			background-image: url(/images/erji_22.jpg);
			background-repeat: repeat-x;
			}
	</style>
</head>
	<body>
	<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong>评审管理</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">简历查询</div>
     <div class="query">	
     <form id="queryForm" >
     <ul>
			 <li style="width:22%">
		       	<span class="classify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：</span>
		    	<input name="name" type="text"   class="input"  id="name" value="${name!''}"/>
		      </li>
				       <li style="width:15%">
				       	<span class="classify">职位级别：</span>
				    	<select id="jobPositionLevelId" name="jobPositionLevelId">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION_LEVE.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  jobPositionLevelId?? && jobPositionLevelId!='' > <#if jobPositionLevelId?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    		  </select>
				       </li>
				       <li style="width:15%">
			       	<span class="classify">婚否：</span>
			    	<select id="maritalId" name="maritalId">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.IS_MARRY.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  maritalId?? && maritalId!=''> <#if maritalId?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    	</select>
			       </li>
			        <li style="width:15%">
			       	<span class="classify">性别：</span>
			    	<select id="sex" name="sex">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.SEX.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  sex?? && sex!=''> <#if sex?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    	</select>
			       </li>
				      <li style="width:15%"><a href="javascript:void(0)">
  				 		<button type="button" class="btn btn-default" onclick="jlInfo.query();">查&nbsp;询</button>
       				</a></li>
      </ul>
      
      	<ul>
      	 			
			       <li style="width:22%">
			       	<span class="classify">薪水要求：</span>
			    	<select id="salaryRequireId" name="salaryRequireId" style="width:160px;">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.SALARY_REQUIRE.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  salaryRequireId?? && salaryRequireId!=""> <#if salaryRequireId?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    	</select>
			       </li>
      	
			       
			       <li style="width:15%">
			       	<span class="classify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学历：</span>
			    	<select id="educationId" name="educationId">
		    		 <option value="" > 请选择 </option>
		    		    <#list DictionaryUtil.getTypes(DictionaryType.EDUCATION.getCode()) as c>
		    		 		 <option value="${c.dictionaryId}" <#if  educationId?? && educationId!=""> <#if educationId?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
		 			 	</#list>
		    		  </select>
			       </li>
			       
			        <li style="width:15%">
			       	<span class="classify">技术评审状态：</span>
			    	<select id="auditTypeId" name="auditTypeId">
		    		 <option value="" > 请选择 </option>
		    		    <#list JlAuditType.values() as c>
		    		 		 <option value="${c.code}" <#if  auditTypeId?? && auditTypeId!=""> <#if auditTypeId?number==c.code> selected </#if> </#if>  > ${c.title!''} </option>
		 			 	</#list>
		    		  </select>
			       </li>
			       
			        <li style="width:15%">
			       	<span class="classify">推荐状态：</span>
			    	<select id="recommendFlowStatus" name="recommendFlowStatus">
		    		 <option value="" > 请选择 </option>
		    		    <#list JlFlowType.values() as c>
		    		 		 <option value="${c.code}" <#if  recommendFlowStatus?? && recommendFlowStatus!=""> <#if recommendFlowStatus?number==c.code> selected </#if> </#if>  > ${c.title!''} </option>
		 			 	</#list>
		    		  </select>
			       </li>
				      
      	</ul>
      </form>
     </div>
    </div>
    <div class="form">
      <#if subject.isPermitted("zpJlInfo:add")>
	      <div class="btn-group">
	   		 <button style="display:none" type="button" class="btn btn-default"  onclick="jlInfo.toAdd();" >增加简历</button>
	      </div>
     </#if>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
        <td  style="display:none;" height="37" align="center" valign="middle" background="/images/erji_22.jpg">
			<input type="checkbox" style="vertical-align:middle " onclick="if(this.checked){$('.check').attr('checked',true)}else $('.check').attr('checked',false)  ">
		</td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>姓名</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>技术评审状态</strong></td>
         
         <#if Session[Const.SESSION_USER_KEY].type!=AccountType.TECHICAL_AUDIT.getCode()>
	      	<td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>评审人</strong></td>
         </#if>
        
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>职位</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>级别</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>薪水要求</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>年龄</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>性别</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>最高学历</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>猎人</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>录入时间</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>推荐状态</strong></td>
        
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
       <#list pager.data as c>
       <tr>
       <td  style="display:none;" align="center" class="hui"><input type="checkbox" name="checkbox" value="${c.jlId!''}" postionAttr="${c.jobPositionId!''}" class="check"></td>
        <td align="center" class="hui">${c.name!''}</td>
         <td align="center" class="hui">
	          <#if c.auditTypeId?? &&  c.auditTypeId==JlAuditType.WAIT_AUDIT.getCode()>
	       	  <span class="badge badge-important">
	       	  	${JlAuditType.get(c.auditTypeId).getTitle()}
	       	  </span>
	       </#if>
	       <#if c.auditTypeId?? &&  c.auditTypeId==JlAuditType.AUDIT_OK.getCode()>
	       	  <span class="badge badge-success">
	       	  	${JlAuditType.get(c.auditTypeId).getTitle()}
	       	  </span>
	       </#if>
	       <#if c.auditTypeId?? &&  c.auditTypeId==JlAuditType.AUDIT_NO_PASS.getCode()>
	       	  <span class="label label-info">
	       	  	${JlAuditType.get(c.auditTypeId).getTitle()}
	       	  </span>
	       </#if>
         </td>
         
         <#if Session[Const.SESSION_USER_KEY].type!=AccountType.TECHICAL_AUDIT.getCode()>
	         <td align="center" class="hui">
		          ${c.technicianAuditPersonName!''}
	         </td>
         </#if>
         
         
        
        
        <td align="center" class="hui">
        <#if c.jobPositionId??>
        	${DictionaryUtil.getName(c.jobPositionId)}
        </#if>
       </td>
        <td align="center" class="hui">
	        <#list c.zpJlJobLevels as h>
	       		 ${DictionaryUtil.getName(h.jobLevelId)}
	        </#list>
	    	 
	    </td>
	    <td align="center" class="hui">
	    	 <#if c.salaryRequireId??>
	    		${DictionaryUtil.getName(c.salaryRequireId)}
	    	 </#if>
	    </td>
	    <td align="center" class="hui">
	    	<#if c.birthday??>
	   		 	${DateUtil.compareDate(DateUtil.toString(c.getBirthday(), DateUtil.DEFAULT_SHORT_FORMAT), null, 2)}岁 <#else> 无
	    	</#if>
	    </td>
	    <td align="center" class="hui">
	    	 <#if c.sex??>
	    		${DictionaryUtil.getName(c.sex)}
	    	 </#if>
	    </td>
	     <td align="center" class="hui">
	    	 <#if c.educationId??>
	    		${DictionaryUtil.getName(c.educationId)}
	    	 </#if>
	    </td>
	    
	      <td align="center" class="hui">
        	${c.inPersonName!''}
	    </td>
	   
	 
		
	    <td align="center" class="hui">
	    	     <#if c.inTime??>
        			 ${c.inTime?string("yyyy-MM-dd HH:mm:ss")}
 				</#if>
	    </td>
	     <td align="center" class="hui">
			<#if c.auditTypeId?? &&  c.auditTypeId==JlAuditType.AUDIT_OK.getCode()>
	   			<#if c.recommendFlowStatus??>
	   			  ${JlFlowType.get(c.recommendFlowStatus).getTitle()}
	            </#if>
			</#if>
		</td>
	    
		<td align="left" class="hui" style="width:300px;">
	    	<div class="btn-group">
      		    <#if subject.isPermitted("zpJobMatchingInfo:add")>
      		   		<button type="button" class="btn btn-default"  onclick="jlInfo.matchJob('${c.jlId!""}');">匹配职位</button>
      		   	</#if>
	   			
	     		&nbsp;&nbsp;&nbsp;&nbsp;
	     		
	     		 <#if subject.isPermitted("zpJlInfo:auditOk")>
		     		 <#if c.auditTypeId??>
		       	  		<#if JlAuditType.WAIT_AUDIT.getCode()==c.auditTypeId>
		       	  				<button type="button"  class="btn btn-default" onclick="jlInfo.audit('${c.jlId!""}','${c.name!""}');" >请评审</button>
	       	  			<#else>
		       	  				<button type="button"  class="btn btn-default disabled" >已评审</button>
		       	  		</#if>
		       	 	</#if>
		       	 </#if>
		       	 
		       	<#if subject.isPermitted("zpRecommendFlowInfo:list")>
		      		 	<#if c.auditTypeId?? &&  c.auditTypeId==JlAuditType.AUDIT_OK.getCode()>
			   					<#if c.recommendFlowStatus??>
      		   						<button type="button" class="btn btn-default"  onclick="recommendflow.tolist(${c.jlId})">查看流程</button>
			            		</#if>
							</#if>
      		 	</#if>
	     		
      		 </div>
	     </td>
	    
       </tr>
       </#list>
       <tr>
     	 <td colspan="7" valign="middle" class="d">
     	    <button style="display:none;" type="button" class="btn btn-default"  onclick="jlInfo.selectAuditPerson()">选择评审</button>
     	 </td>
       </tr>
      </table>
     </div>
	 <#-- 分页栏 -->
     <@pageBar   pager=pager url="/zpJlInfo/auditList.action?jsonParam=${jsonParam!''}" join="&"> </@pageBar> 
    </div>
   </div>
  <!-- 弹窗 结束 -->
  <#include "../include/deleteConfirmModal.ftl">

<!-- 弹窗 开始 -->
<div class="pop_sure modal hide fade" id="match_job_pop">
  <div class="title0">确认框<a class="x" href="javascript:void(0)"  data-dismiss="modal"></a></div>
  <div class="text0" id="match_job_pop_title"></div>
  <div class="w100">
    <ul class="r50">
      <li id="match_job_pop_li">
        <a class="button mar" id="selete_match_btn"  href="javascript:void(0)" value=false><span>查看结果</span></a>
        <a class="button mar" id="match_job_btn"  href="javascript:void(0)" value=false><span>重新匹配</span></a>
        <a class="button" href="javascript:void(0)"  data-dismiss="modal"><span>取消</span></a>
      </li>
    </ul>
</div>
</div>




<!-- 评审简历 -->
<div id="auditModal" class="modal fade xin1">
<div class="xin1">
  <div class="xin1_1">
   <div class="whitea">评审简历</div>
   <div class="close"><img data-dismiss="modal" src="/images/xinjian_03.gif" width="18" height="18"/></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd1">
     <table width="100%" border="0">
        <tr>
	        <td align="left" class="hui1"  >求职者：<span id="audit_name"></span></td>
     	 </tr>
       <tr>
        <td align="center" class="hui1" >
        	<input type="radio" class="radio" class="radio validate[required]" name="audit_type" value="${JlAuditType.AUDIT_NO_PASS.getCode()}" /> ${JlAuditType.AUDIT_NO_PASS.getTitle()} 
        </td>
      </tr>
      </table>
    </div>
   </div>
   <div class="caidan2" style="margin-top: 40px;">
			    <button type="button" class="btn btn-default" id="audit_ok_btn">确定</button>
						  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 	<button type="button" data-dismiss="modal" class="btn btn-default" >取消</button>
   	</div>
  </div>
 </div>
 </div>
	<style type="text/css">
	 	.close{opacity:1;}
	 </style>
</div>




<script src="/js/zpJlAudit.js"></script>
<script src="/js/recommendflow.js"></script>

<script>
	common.initLeftMenuSelected(jlInfo.left_menu_selected_id);
</script>
</html>