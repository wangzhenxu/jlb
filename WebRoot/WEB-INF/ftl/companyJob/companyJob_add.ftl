
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
	    zpUrgencyStatusId : $("#zpUrgencyStatusId"), //招聘紧急状态
		areaId : $("#areaId"), //所在城区
-->
<#include "../include/comm_jlb_macro.ftl"/>
<@gmc_common_js from="add"/>
<script type="text/javascript" src="http://www.loiot.com/c/ckeditor/ckeditor.js"></script>			

<form id="addform" name="form" action="/zpCompanyJobInfo/add.action" method="post">
<input type="hidden" name="desc" id="desc" />
<input type="hidden" name="moreDesc" id="moreDesc" />
<input type="hidden" name="companyId" id="${company.companyId!''}" />  
<input type="hidden" name="expectedYearMoney" id="expectedYearMoney" />  


<!-- 右侧 开始 -->
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">客户管理</a> &gt; 职位管理 &gt;<strong> 增加职位</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">增加职位</div>
	</div>
     <div class="query1">
       <table width="100%" border="0" align="left">
         <tr>
           <td colspan="4" class="red">* 号为必填项</td>
         </tr>
         <tr>
           <td  align="right" class="hui1">公司名称：</td>
           <td  align="left" valign="middle">
           ${company.name}
          </td>
          <td align="right" class="hui1">职位名称：</td>
          <td  align="left" valign="middle">
			 <input name="name" id="name" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1">招聘职位：</td>
           <td  align="left" valign="middle" clospan="3">
	         <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
          	  	 <input class="radio" name="typeId" type="radio" value="${c.dictionaryId}" /> ${c.name!''} 
          	 </#list>
          </td>
         </tr>
         
           <tr>
           <td  align="right" class="hui1">职位级别：</td>
           <td  align="left" valign="middle" clospan="3">
	         <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION_LEVE.getCode()) as c>
          	  	 <input class="radio" name="jobPositionLevelId" type="radio" value="${c.dictionaryId}" /> ${c.name!''} 
          	 </#list>
          </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1">所在城区：</td>
           <td  align="left" valign="middle" clospan="3">
            	<#list DictionaryUtil.getTypes(DictionaryType.COMPANY_AREA.getCode()) as c>
          	  	  <input class="radio" name="areaId" type="radio" <#if company.areaId??> <#if company.areaId==c.dictionaryId> checked </#if> </#if> value="${c.dictionaryId}" > ${c.name!''} 
          	 	</#list>
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1">招聘人数：</td>
           <td  align="left" valign="middle">
          	 <input name="zpPersonCount" id="zpPersonCount" type="text" style="width:50px;" class="inputa error-field" validate="validate[required,custom[eightCha]]">
           &nbsp;人
           </td>
          <td align="right" class="hui1">团队人数：</td>
          <td  align="left" valign="middle">
			 <input name="downTeamPersonCount" id="downTeamPersonCount" type="text" style="width:50px;" class="inputa error-field" validate="validate[required,custom[eightCha]]">
           	 &nbsp;人
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1">预计年薪：</td>
           <td  align="left" valign="middle">
          	 <input name="expectedYearMoneyStart" id="expectedYearMoneyStart" type="text" style="width:50px;"  class="inputa error-field" validate="validate[required,custom[eightCha]]">
           	 -
           	 <input name="expectedYearMoneyEnd" id="expectedYearMoneyEnd" type="text" style="width:50px;"  class="inputa error-field" validate="validate[required,custom[eightCha]]">
           	 &nbsp;万
           </td>
          <td align="right" class="hui1">要求工作年限：</td>
          <td  align="left" valign="middle">
          		<input name="workTermStart" id="workTermStart" type="text" style="width:50px;"  class="inputa error-field" validate="validate[required,custom[eightCha]]">
           	 -
           	 <input name="workTermEnd" id="workTermEnd" type="text" style="width:50px;"  class="inputa error-field" validate="validate[required,custom[eightCha]]">
           	 &nbsp;年
           </td>
         </tr>
         
         
         <tr>
           <td  align="right" class="hui1">年龄：</td>
           <td  align="left" valign="middle">
          	 <input name="ageStart" id="ageStart" type="text" style="width:50px;"  class="inputa error-field" validate="validate[required,custom[eightCha]]">
           	 -
           	 <input name="ageEnd" id="ageEnd" type="text" style="width:50px;"  class="inputa error-field" validate="validate[required,custom[eightCha]]">
           	 &nbsp;岁
           </td>
          <td align="right" class="hui1">婚否：</td>
          <td  align="left" valign="middle">
          	<#list DictionaryUtil.getTypes(DictionaryType.IS_MARRY.getCode()) as c>
	          	 	<input class="radio" name="maritalId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
	        </#list>
           </td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1">性别：</td>
           <td  align="left" valign="middle">
	          	 <#list DictionaryUtil.getTypes(DictionaryType.SEX.getCode()) as c>
	          	 	<input class="radio" name="sex" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
	          	 </#list>
           </td>
          <td align="right" class="hui1">学历：</td>
          <td  align="left" valign="middle">
 				<#list DictionaryUtil.getTypes(DictionaryType.EDUCATION.getCode()) as c>
	          	 	<input class="radio" name="educationId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
          	 	</#list>  
         </td>
         </tr>
         
         
         <tr>
           <td  align="right" class="hui1">是否急招：</td>
           <td  align="left" valign="middle">
	          	 <#list DictionaryUtil.getTypes(DictionaryType.JOB_URGENCY.getCode()) as c>
	          	 	<input class="radio" name="zpUrgencyStatusId" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
	          	 </#list>
           </td>
          <td align="right" class="hui1"></td>
          <td  align="left" valign="middle">
 				
         </td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1">专业：</td>
           <td  align="left" valign="middle">
          	   <input name="topSpecialty" id="topSpecialty" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
           </td>
          <td align="right" class="hui1">英语等级：</td>
          <td  align="left" valign="middle">
	 		 <#list DictionaryUtil.getTypes(DictionaryType.ENGLISH_LEVEL.getCode()) as c>
	          	 	<input class="radio" name="englishLevelId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
          	 </#list> 
		  </td>
         </tr>
         
        
         
          <tr>
           <td  align="right" class="hui1">职位诱惑：</td>
           <td  align="left" valign="middle">
          	   <input name="jobTemptText" id="jobTemptText" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
           </td>
          <td align="right" class="hui1">诱惑都好项：</td>
          <td  align="left" valign="middle">
           	   <input name="jobTemptItem" id="jobTemptItem" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
		  </td>
         </tr>
          <tr>
           <td  align="right" class="hui1">招聘要求：</td>
           <td  align="left" valign="middle">
          	   <input name="zpRequire" id="zpRequire" type="text"  style="width: 300px;" class="inputa error-field" validate="validate[required,custom[eightCha]]">
           		&nbsp;关键字由逗号份分隔
           </td>
          <td align="right" class="hui1">汇报对象：</td>
          <td  align="left" valign="middle">
          			 <input name="reportObject" id="reportObject" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
		  </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1">职位描述：</td>
           <td  align="left" valign="middle" clospan="3">
           		<textarea  cols="45" rows="5" class="input validate[required,length[1000] text-input mokuainr ckeditor" name="desc1"  id="desc1" ></textarea>
           </td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1">更多描述：</td>
           <td  align="left" valign="middle" clospan="3">
           		<textarea  cols="45" rows="5" class="input validate[required,length[1000] text-input mokuainr ckeditor" name="desc2"  id="desc2" ></textarea>
           </td>
         </tr>
         
         </table>

     </div>
    </div>
    <div class="anniu">
    	<div class="btn-group">
				 <button type="button" class="btn btn-default" id="addBtn">保 &nbsp;存</button>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  		 <button type="button" class="btn btn-default" onclick="companyJob.tolist();">返&nbsp; 回</button>
      	</div>
	  
    </div>
   </div>
<!-- 右侧 结束 -->
</form>
<script src="/js/companyJob.js"></script>
<script>
	companyJob.initAddPage();
</script>
