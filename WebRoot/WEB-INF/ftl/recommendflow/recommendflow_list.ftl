<html>
	<head>
	<title>网站后台管理系统-推荐流程管理</title>
	<#include "../include/bootstrap.ftl"/>
	<#include "../include/pager.ftl">
	<script src="/js/source/jquery.validationEngine.js"></script>
	<script src="/js/source/jquery.validationEngine.min.js"></script>
	<link href="/js/source/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="/js/hiAlert/jquery.alert.js"></script>
    <script type="text/javascript" src="http://www.loiot.com/c/ckeditor/ckeditor.js"></script>			
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
     <div class="location01">您现在的位置是：首页 &gt; <strong>推荐流程管理</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">推荐流程管理</div>
     <div class="query">
 		<form id="queryForm" >
 			<ul>
        	<li style="width:22%">
		       	<span class="classify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;求职者：</span>
		    	<input name="jlName" type="text"   class="input"  id="jlName" value="${jlName!''}"/>
		      </li>
		      <li style="width:22%">
		       	<span class="classify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司名称：</span>
		    	<input name="companyName" type="text"   class="input"  id="name" value="${companyName!''}"/>
		      </li>
			        <li style="width:15%">
				       	<span class="classify">职位：</span>
				    	<select id="jobPositionId" name="jobPositionId">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  jobPositionId?? && jobPositionId!=''> <#if jobPositionId?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    		  </select>
				       </li>
				   
				    <li style="width:25%">
				       	<span class="classify">流程状态：</span>
				    	<select id="flowStatus" name="flowStatus">
			    		 <option value="" > 请选择 </option>
			    		    <#list RecommendFlowType.values() as c>
			    		 		 <option value="${c.code}" <#if  flowStatus?? && flowStatus!=''> <#if flowStatus?number==c.code> selected </#if> </#if>  > ${c.title!''} </option>
			 			 	</#list>
			    		  </select>
				   </li> 
				     
			       
				      <li style="width:5%"><a href="javascript:void(0)">
  				 		<button type="button" class="btn btn-default" onclick="recommendflow.query();">查&nbsp;询</button>
       				</a></li>
      </ul>
        </form>
     </div>
    </div>
    <div class="form">
      <#if subject.isPermitted("zpCompanyInfo:add")>
	      <div class="btn-group">
	      </div>
     </#if>
     <div class="form2">
    
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
	      			<#if subject.isPermitted("zpJlInfo:list")>   <#--zpRecommendFlowInfo:detail  -->
					  <button type="button" class="btn btn-default"  onclick="recommendflow.toDetail('${c.auditId}')">详情</button>
					 </#if>
					 
		      		</div>
	        </td>
	       </tr>
	       </#list>
</tbody></table>
    
     </div>
	 <#-- 分页栏 -->
     <@pageBar pager=pager url="/zpRecommendFlowInfo/list.action?jsonParam=${jsonParam!''}" join="&"></@pageBar>
    </div>
   </div>
  <!-- 弹窗 结束 -->
	<#include "../include/deleteConfirmModal.ftl">
	
    <script src="/js/recommendflow.js"></script>
    <script>
    	recommendflow.initPage();
    </script>
</html>

