
<!-- 
		
	    matchId;  //主建匹配id
	    jobId;  //职位id
	    companyId;  //公司id
	    sexId;  //性别
	    sexStatus;  //sexStatus
	    jobPositionId;  //职位类型
	    jobPositionIdStatus;  //jobPositionIdStatus
	    jobPositionLevelId;  //职位级别
	    jobPositionLevelIdStatus;  //jobPositionLevelIdStatus
	    maritalId;  //婚否
	    maritalIdStatus;  //maritalIdStatus
	    salaryRequireId;  //薪水要求id
	    salaryRequireIdStatus;  //salaryRequireIdStatus
	    educationId;  //学历id
	    educationIdStatus;  //educationIdStatus
	    englishLevelId;  //英语等级
	    englishLevelIdStatus;  //englishLevelIdStatus
	    topSpecialty;  //专业
	    topSpecialtyStatus;  //topSpecialtyStatus
	    birthday;  //年龄
	    birthdayStatus;  //birthdayStatus
	    jobStarttime;  //工作年薪
	    jobStarttimeStatus;  //jobStarttimeStatus
	    matchKeword;  //匹配关键字
	    noMatchKeyword;  //未匹配关键字
	    distance;  //distance
	    distanceStatus;  //distanceStatus
	    inDatetime;  //录入时间
	    inPerson;  //录入人

	
-->
  	<#include "../include/comm_jlb_macro.ftl"/>
<html>
	<head>
	<title>网站后台管理系统-产品分类</title>
	<@gmc_common_js "select" />
</head>
	<body>
	<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong>职位匹配列表</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">职位匹配列表</div>
     <div class="query" >
      <ul style="display:none;">
       <li style="width:22%">
       	<span class="classify">公司名称：</span>
    	<input name="name" type="text"  class="input"  id="name" value=""/>
       </li>
       <li style="width:15%">
       	<span class="classify">所属行业：</span>
    	<select id="industryId">
    		 <option value="" > 请选择 </option>
    		   <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_INDUSTRY.getCode()) as c>
    		 		<option value="${c.dictionaryId}" <#if industryId??> <#if industryId==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
 			 	</#list>
    	</select>
       </li>
       <li style="width:20%">
       	<span class="classify">公司性质：</span>
    	<select id="companyNature">
    		 <option value="" > 请选择 </option>
    		 <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_NATURE.getCode()) as c>
    		 	<option value="${c.dictionaryId}" <#if companyNature??> <#if companyNature==c.dictionaryId> selected </#if> </#if> > ${c.showName!''} </option>
 			 </#list>
    	</select>
       </li>
        <li style="width:20%">
       	<span class="classify">公司规模：</span>
    	<select id="scaleId">
    		 <option value="" > 请选择 </option>
    		 <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_SCALE.getCode()) as c>
    		 	<option value="${c.dictionaryId}" <#if scaleId??> <#if scaleId==c.dictionaryId> selected </#if> </#if> > ${c.showName!''} </option>
 			 </#list>
    	</select>
       </li>
        <li style="width:15%">
       	<span class="classify">融资阶段：</span>
    	<select id="financingLevelId">
    		 <option value="" > 请选择 </option>
    		 <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_FINANCING_LEVEL.getCode()) as c>
    		 	<option value="${c.dictionaryId}" <#if financingLevelId??> <#if financingLevelId==c.dictionaryId> selected </#if> </#if> > ${c.showName!''} </option>
 			 </#list>
    	</select>
       </li>
       <li style="width:5%"><a href="javascript:void(0)"><img src="/images/erji_06.jpg" width="64" height="26" onclick="jobMatchInfo.query();"/></a></li>
      </ul>
     </div>
    </div>
    <div class="form">
      <#if subject.isPermitted("productClass:add")>
     </#if>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
      
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>姓名</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>公司名称</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>职位名称</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>薪水要求</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>学历</strong></td>
         <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>专业</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg" style="display:none;"><strong>英语等级</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg" style="display:none;"><strong>性别</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg" style="display:none;"><strong>婚否</strong></td>
       <td height="37" align="center" valign="middle" background="/images/erji_22.jpg" style="display:none;"><strong>年龄</strong></td>
       <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>工作年限</strong></td>
       <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>距离</strong></td>
       <td height="37" align="center" valign="middle" background="/images/erji_22.jpg" style="display:none;"><strong>用时</strong></td>
       
       <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>总关键字数</strong></td>
       <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>已匹配</strong></td>
       <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>匹配率</strong></td>
       <td height="37"  align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
       <#list pager.data as c>
       
       <tr>
       
       
        <td align="center" class="hui">${c.jlName!''}</td>
        <td align="center" class="hui" title="${c.companyName!''}">${c.companyName!''}</td>
        <td align="center" class="hui" title="${c.jobName!''}"><a href="/zpCompanyJobInfo/toView.action?id=${c.jobId}" target="_blank">${c.jobName!''}</a></td>
        <td align="center" class="hui">
	        <#if c.salaryRequireIdStatus??> 
	    		${JobMatchType.get(c.salaryRequireIdStatus).getTitle()}
	    	</#if>
        </td>
        
        </td>
        <td align="center" class="hui">
        <#if c.educationIdStatus??> 	
    		${JobMatchType.get(c.educationIdStatus).getTitle()}
  	 	 </#if>
        </td>
        
         <td align="center" class="hui">
        <#if c.topSpecialtyStatus??> 	
    		${JobMatchType.get(c.topSpecialtyStatus).getTitle()}
  	 	 </#if>
        </td>
        
        
         <td align="center" class="hui" style="display:none;">
	         <#if c.englishLevelIdStatus??>
	         	${JobMatchType.get(c.englishLevelIdStatus).getTitle()}
	 		</#if>
        </td>
        <td align="center" class="hui" style="display:none;">
	         <#if c.sexStatus??>
	         	${JobMatchType.get(c.sexStatus).getTitle()}
	 		</#if>
        </td>
        
        <td align="center" class="hui" style="display:none;">
	         <#if c.maritalIdStatus??>
	         	${JobMatchType.get(c.maritalIdStatus).getTitle()}
	 		</#if>
        </td>
        
        <td align="center" class="hui" style="display:none;">
	         <#if c.birthdayStatus??>
	         	${JobMatchType.get(c.birthdayStatus).getTitle()}
	 		</#if>
        </td>
        <td align="center" class="hui">
	         <#if c.jobStarttimeStatus??>
	         	${JobMatchType.get(c.jobStarttimeStatus).getTitle()}
	 		</#if>
        </td>
        <td align="center" class="hui">
	        ${JLBUtils.dealDistance(c.distance)}
        </td>
         <td align="center" class="hui" style="display:none;">
	        ${JLBUtils.dealduration(c.duration)}
        </td>
        <td align="center" class="hui">
	         <#if c.keywordCount??>
	         	${c.keywordCount!''}
	 		</#if>
        </td>
        
        <td align="center" class="hui">
		     <#if c.keywordMatchCount??>
		     	${c.keywordMatchCount!''}
			</#if>
        </td>
        
          <td align="center" class="hui">
		     <#if c.keywordPercent??>
		     	${c.keywordPercent!''}%
			</#if>
        </td>
        
        
        <td align="center" class="hui" >
   			 <div class="btn-group" style=";">
			 <#assign match = "">  
			 <#assign noMatch = "">   
	         <#list c.keys as k>
	         	<#if k.isMatch==MatchKeywordType.ALREADY_MATCH.getCode()>
	         	 	<#if match=="">
	         	 			<#assign match =k.keyword > 
	         	 		<#else>
	         	 			<#assign match =match+","+k.keyword > 
	         	 	</#if>
	         	 <#else>
	         	  	<#if noMatch=="">
	         	 			<#assign noMatch =k.keyword > 
	         	 		<#else>
	         	 			<#assign noMatch =noMatch+","+k.keyword > 
	         	 	</#if>
	         	</#if>
   			 </#list>
   			 
   			<button type="button" class="btn btn-default"  title="已匹配关键字：${match} &#10;未匹配关键字：${noMatch}">关键字</button>
      	 	<button  style="margin-left:10px;" type="button" class="btn btn-default" onclick="jobMatchInfo.toMatchJlDetail(${c.matchId});">
      	     <#if Session[Const.SESSION_USER_KEY].type==AccountType.TECHICAL_AUDIT.getCode() || Session[Const.SESSION_USER_KEY].type==AccountType.ADMIN.getCode()>
          		请评审
          	  <#else>
          		详情
             </#if>
      	 		
      	 	
      	 	</button>
      	 	 </div>
        </td>
         		
       </tr>
       </#list>
       </#
       <tr>
     	 <td colspan="10" valign="middle" class="d">
     	 </td>
       </tr>
      </table>
     </div>
       <#-- 分页栏 -->
     <@pageBar pager=pager url="/zpJobMatchingInfo/list.action?jobId=${jobId!''}" join="&"></@pageBar>
    
    </div>
   </div>
  <!-- 弹窗 结束 -->
	<#include "../include/deleteConfirmModal.ftl">
    <script src="/js/jobMatchInfo.js"></script>
    <script>
    		common.initLeftMenuSelected("zpJobMatchingInfo_list");
    </script>
</html>

