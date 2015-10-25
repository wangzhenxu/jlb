
<html>
	<head>
	<title>网站后台管理系统-简历管理</title>
	<#include "../include/bootstrap.ftl"/>
	<#include "../include/pager.ftl">
	<script src="/js/source/jquery.validationEngine.js"></script>
	<script src="/js/source/jquery.validationEngine.min.js"></script>
	<link href="/js/source/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="/js/hiAlert/jquery.alert.js"></script>
    <script src="/js/zpJlInfo.js"></script>
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
     <div class="location01">您现在的位置是：首页 &gt; <strong>简历管理</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">简历管理</div>
     <div class="query">	
     <form id="queryForm" >
     <ul>
			 <li style="width:22%">
		       	<span class="classify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：</span>
		    	<input name="name" type="text"   class="input"  id="name" value="${name!''}"/>
		      </li>
			        <li style="width:15%">
				       	<span class="classify">职位：</span>
				    	<select id="jobPositionId" name="jobPositionId">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  jobPositionId?? && jobPositionId!=''> <#if jobPositionId?number==c.dictionaryId> selected </#if> </#if>  > ${c.name!''} </option>
			 			 	</#list>
			    		  </select>
				       </li>
				       <li style="width:15%">
				       	<span class="classify">职位级别：</span>
				    	<select id="jobPositionLevelId" name="jobPositionLevelId">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION_LEVE.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  jobPositionLevelId?? && jobPositionLevelId!='' > <#if jobPositionLevelId?number==c.dictionaryId> selected </#if> </#if>  > ${c.name!''} </option>
			 			 	</#list>
			    		  </select>
				       </li>
				       <li style="width:15%">
			       	<span class="classify">婚否：</span>
			    	<select id="maritalId" name="maritalId">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.IS_MARRY.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  maritalId?? && maritalId!=''> <#if maritalId?number==c.dictionaryId> selected </#if> </#if>  > ${c.name!''} </option>
			 			 	</#list>
			    	</select>
			       </li>
			        <li style="width:15%">
			       	<span class="classify">性别：</span>
			    	<select id="sex" name="sex">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.SEX.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  sex?? && sex!=''> <#if sex?number==c.dictionaryId> selected </#if> </#if>  > ${c.name!''} </option>
			 			 	</#list>
			    	</select>
			       </li>
				      <li style="width:5%"><a href="javascript:void(0)">
  				 		<button type="button" class="btn btn-default" onclick="jlInfo.query();">查&nbsp;询</button>
       				</a></li>
      </ul>
      
      	<ul>
      	 			
			       <li style="width:22%">
			       	<span class="classify">薪水要求：</span>
			    	<select id="salaryRequireId" name="salaryRequireId" style="width:160px;">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.SALARY_REQUIRE.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  salaryRequireId?? && salaryRequireId!=""> <#if salaryRequireId?number==c.dictionaryId> selected </#if> </#if>  > ${c.name!''} </option>
			 			 	</#list>
			    	</select>
			       </li>
      	
			       
			       <li style="width:15%">
			       	<span class="classify">学历：</span>
			    	<select id="educationId" name="educationId">
		    		 <option value="" > 请选择 </option>
		    		    <#list DictionaryUtil.getTypes(DictionaryType.EDUCATION.getCode()) as c>
		    		 		 <option value="${c.dictionaryId}" <#if  educationId?? && educationId!=""> <#if educationId?number==c.dictionaryId> selected </#if> </#if>  > ${c.name!''} </option>
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
	   		 <button type="button" class="btn btn-default"  onclick="jlInfo.toAdd();" >增加简历</button>
	      </div>
     </#if>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg">
			<input type="checkbox" style="vertical-align:middle " onclick="if(this.checked){$('.check').attr('checked',true)}else $('.check').attr('checked',false)  ">
		</td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>姓名</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>手机</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>邮箱</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>职位</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>级别</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>薪水要求</strong></td>
        
      
        <!-- hr角色隐藏吧列太多 -->
        <#if Session[Const.SESSION_USER_KEY].type!=AccountType.HR.getCode()>
	        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>年龄 </strong></td>
	        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>性别</strong></td>
        </#if>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>最高学历</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>评审人</strong></td>
         <!-- hr角色隐藏吧列太多 -->
        <#if Session[Const.SESSION_USER_KEY].type!=AccountType.HR.getCode()>
        	<td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>录入人</strong></td>
        </#if>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>录入时间</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
       <#list pager.data as c>
       <tr>
       <td align="center" class="hui"><input type="checkbox" name="checkbox" value="${c.jlId!''}" postionAttr="${c.jobPositionId!''}" class="check"></td>
        <td align="center" class="hui">${c.name!''}</td>
        <td align="center" class="hui">${c.phone!''}</td>
        <td align="center" class="hui">
        	 ${c.emal!''}
        </td>
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
	    
	      <!-- hr角色隐藏吧列太多 -->
        <#if Session[Const.SESSION_USER_KEY].type!=AccountType.HR.getCode()>
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
	    </#if>
	    
	   
	     <td align="center" class="hui">
	    	 <#if c.educationId??>
	    		${DictionaryUtil.getName(c.educationId)}
	    	 </#if>
	    </td>
	     <td align="center" class="hui">
	     <span class="label label-info">
	    	    ${c.technicianAuditPersonName!'待选择'}
		 </span>
	    </td>
	     <!-- hr角色隐藏吧列太多 -->
        <#if Session[Const.SESSION_USER_KEY].type!=AccountType.HR.getCode()>
			<td align="center" class="hui">
				 ${c.inPersonName!''}
			</td>
       </#if>
	     
	    
	    <td align="center" class="hui">
	    	     <#if c.inTime??>
        			 ${c.inTime?string("yyyy-MM-dd HH:mm:ss")}
 				</#if>
	    </td>
	   
	    
		<td align="center" class="hui" style="width:300px;">
	    	<div class="btn-group">
	    	  <#if subject.isPermitted("zpJlInfo:detail")>
			   <button type="button" class="btn btn-default"  onclick="jlInfo.toDetail('${c.jlId}')">详情</button>
			  </#if>
			    <#if subject.isPermitted("zpJlInfo:edit")>
			   <button type="button" class="btn btn-default"  onclick="jlInfo.toEdit('${c.jlId}')">修改</button>
      		   </#if>
      		    <#if subject.isPermitted("zpJobMatchingInfo:add")>
      		   <button type="button" class="btn btn-default"  onclick="jlInfo.matchJob('${c.jlId!""}');">匹配职位</button>
      		    </#if>
      		    <#if subject.isPermitted("zpJlInfo:down")>
      		  	  <#if c.jlFilePath??>
      		   		<button type="button" class="btn btn-default"  onclick="jlInfo.downJl('${ApplicationConst.UPLOAD_JL_URL}${c.jlFilePath}')">下载</button>
      		 	  </#if>
      		 	</#if>
      		 </div>
	     </td>
	    
       </tr>
       </#list>
       <tr>
     	 <td colspan="7" valign="middle" class="d">
     	        <#if subject.isPermitted("zpJlInfo:assignAuditPerson")>
     	   		 	<button type="button" class="btn btn-default"  onclick="jlInfo.selectAuditPerson()">选择评审</button>
     	 		</#if>
     	 </td>
       </tr>
      </table>
     </div>
	 <#-- 分页栏 -->
     <@pageBar   pager=pager url="/zpJlInfo/list.action?jsonParam=${jsonParam!''}" join="&"> </@pageBar> 
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


<!-- 选择技术评pop 开始 -->
<div class="pop_sure modal hide fade" id="auditPersonPop">
	  <div class="content">
	 <div class="quanxian">
	  <div class="quanxian1">
	   <div class="whitea">评审列表</div>
	   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
	  </div>
	  <div class="quanxian2">
	   <div class="czrz">
	     <table id="" width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
	       <tr class="lan">
	       	 <td width="3%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong></strong></td>
	         <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>评审经理</strong></td>
	         <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>已评审数量</strong></td>
	         <td width="11%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>等待评审数量</strong></td>
	         <td width="10%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>最后评审时间</strong></td>
	       </tr>
	     </table>
	   </div>
	   
	   <div class="anniu">
	   		<div class="btn-group">
				 <button type="button" class="btn btn-default" id="addAuditBtn">确&nbsp;定</button>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  		 <button type="button" class="btn btn-default" data-dismiss="modal">取&nbsp;消</button>
      		</div>
    	</div>
    
	   
	  </div>
	 </div>
	 </div>
</div>









<script>
	common.initLeftMenuSelected(jlInfo.left_menu_selected_id);
</script>
</html>