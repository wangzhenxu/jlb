
<!-- 
		
	    jobId;  //职位id
	    companyId;  //所属公司
	    typeId;  //职位类型
	    name;  //公司名称
	    jobPositionLevelId;  //职位级别
	    expectedYearMoney;  //预计年薪 逗号分隔
	    reportObject;  //汇报对象
	    zpPersonCount;  //招聘人数
	    downTeamPersonCount;  //团队人数
	    desc;  //职位描述
	    zpRequire;  //招聘要求
	    sex;  //要求性别
	    educationId;  //要求学历
	    englishLevelId;  //要求英语等级
	    topSpecialty;  //要求专业
	    jobTemptText;  //职位诱惑
	    jobTemptItem;  //诱惑都好项,逗号分隔
	    moreDesc;  //更多描述
	    inPerson;  //录入人
	    inDatetime;  //录入时间
	    lastUpdateTime;  //最后更新时间
	    isDelete;  //是否删除
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
     <div class="location01">您现在的位置是：首页 &gt; <strong>hrQQ</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">产品分类</div>
     <div class="query">
      <ul>
       <li style="width:22%">
       	<span class="classify">职位名称：</span>
    	<input name="name" type="text"  class="input"  id="name" value="${name!''}"/>
       </li>
       <li style="width:15%">
       	<span class="classify">职位类型：</span>
    	<select id="typeId">
    		 <option value="" > 请选择 </option>
    		 <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
    		 	<option value="${c.dictionaryId}" <#if typeId??> <#if typeId==c.dictionaryId> selected </#if> </#if>  > ${c.name!''} </option>
 			 </#list>
    	</select>
       </li>
       <li style="width:15%">
       	<span class="classify">职位级别：</span>
    	<select id="jobPositionLevelId">
    		 <option value="" > 请选择 </option>
    		 <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION_LEVE.getCode()) as c>
    		 	<option value="${c.dictionaryId}" <#if jobPositionLevelId??> <#if jobPositionLevelId==c.dictionaryId> selected </#if> </#if> > ${c.name!''} </option>
 			 </#list>
    	</select>
       </li>
       <li style="width:20%">
       		<span class="classify">工作年限：</span>
    	    <input name="workTermStart" type="text" style="width: 50px;"  class="input"  id="workTermStart" value="${workTermStart!''}"/>
    	    	至
    	    <input name="workTermEnd" type="text" style="width: 50px;"  class="input"  id="workTermEnd" value="${workTermEnd!''}"/>
    		年
       </li>
        <li style="width:20%">
       		<span class="classify">薪水要求：</span>
    	    <input name="expectedYearMoneyStart" id="expectedYearMoneyStart" type="text" style="width: 50px;"  class="input"   value="${JLBUtils.dealYearMoney(expectedYearMoneyStart)}"/>
    	    	至
    	    <input name="expectedYearMoneyEnd" id="expectedYearMoneyEnd" type="text" style="width: 50px;"  class="input" value="${JLBUtils.dealYearMoney(expectedYearMoneyEnd)}"/>
    		万
       </li>
      
       <li style="width:5%"><a href="javascript:void(0)"><img src="/images/erji_06.jpg" width="64" height="26" onclick="companyJob.query();"/></a></li>
      </ul>
     </div>
    </div>
    <div class="form">
      <#if subject.isPermitted("productClass:add")>
     	<div style="display:none;" class="form1"><a href="javascript:void(0)"><img src="/images/erji_18.jpg" width="83" height="22" border="0"  name="addpro"  onclick="companyJob.toAdd();"/></a></div>
     </#if>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>公司名称</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>职位名称</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>职位类型</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>职位级别</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>工作年限</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>预计年薪</strong></td>
        
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>年龄</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>婚否</strong></td>
        
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>招聘人数</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>录入人</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>录入时间</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
       <#list pager.data as c>
       <tr>
       <td align="center" class="hui" title="${c.name!''}">${StringUtil.truncate(c.name,14,"...")}</td>
        <td align="center" class="hui" title="${c.name!''}">${StringUtil.truncate(c.name,14,"...")}</td>
        <td align="center" class="hui">
      	  <#if c.typeId??> 	
        	${DictionaryUtil.getName(c.typeId)}<#else>无
      	  </#if>
        </td>
        <td align="center" class="hui">
    	 <#if c.jobPositionLevelId??> 	
    		${DictionaryUtil.getName(c.jobPositionLevelId)}<#else>无
  	 	 </#if>
        </td>
         <td align="center" class="hui">
          	${JLBUtils.dealWordTerm(c.workTermStart,c.workTermEnd)}
        </td>
        <td align="center" class="hui">
       		${JLBUtils.dealExpectedYearMoney(c.expectedYearMoneyStart,c.expectedYearMoneyEnd)}
        </td>
          <td align="center" class="hui">
       		${JLBUtils.dealAgeRange(c.ageStart,c.ageEnd)}
          </td>
          <td align="center" class="hui">
       		<#if c.maritalId??> 	
    		 ${DictionaryUtil.getName(c.maritalId)}
  	 	 	</#if>	
         </td>
        
        <td align="center" class="hui">
        	${c.zpPersonCount!'0'}人
        </td>
         <td align="center" class="hui">
	        ${c.inPerson!''}
        </td>
         <td align="center" class="hui">
        	 <#if c.inDatetime??>
        		 ${c.inDatetime?string("yyyy-MM-dd")}
 			</#if>
        </td>
        
        <td align="center" class="hui">
       			 <a  href="javascript:">详情</a>
        		 <a  href="javascript:">修改</a>
         		 <a  href="javascript:">删除</a>
         		 <a  href="javascript:">发布职位</a>
        </td>
         		
       </tr>
       </#list>
       <tr>
     	 <td colspan="10" valign="middle" class="d">
     	 	<a href="javascript:emalModal.openTemplateModal();" class=""><img src="/images/del.jpg" width="74" height="26">
     	 	</a>
     	 </td>
       </tr>
      </table>
     </div>
	 <#-- 分页栏 -->
     <@pageBar pager=pager url="/zpCompanyJobInfo/list.action?name=${name!''}&typeId=${typeId!''}&jobPositionLevelId=${jobPositionLevelId!''}&expectedYearMoneyStart=${expectedYearMoneyStart!''}&expectedYearMoneyEnd=${expectedYearMoneyEnd!''}&workTermStart=${workTermStart!''}&workTermEnd=${workTermEnd!''}" join="&"></@pageBar>
    </div>
   </div>
  <!-- 弹窗 结束 -->
	<#include "../include/deleteConfirmModal.ftl">
	
    <script src="/js/companyJob.js"></script>
</html>

