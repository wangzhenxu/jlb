
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
 <script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>			

<form id="addform" name="form"  method="post">
<input type="hidden" name="desc" id="desc" />
<input type="hidden" name="moreDesc" id="moreDesc" />
<input type="hidden" name="companyId" id="companyId"  <#if company??>  value="${company.companyId!''}" </#if> "/>  
<input type="hidden" name="expectedYearMoney" id="expectedYearMoney" />  
<input type="hidden" name="jobId" id="jobId" value="${pid!''}" />
<input type="hidden" name="onlyName" id="onlyName"/>
<input type="hidden" name="coordX" id="coordX" />
<input type="hidden" name="coordY" id="coordY" />
<input type="hidden" name="zpRequire" id="zpRequire" />



<!-- 右侧 开始 -->
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="javascript:companyJob.tolist();">职位管理</a> &gt;<strong class="m_title" tempAttrValue="职位"> 增加职位</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">职位条件</div>
	</div>
     <div class="query1">
       <table width="100%" border="0" align="left">
         <tr>
           <td colspan="4" class="red">* 号为必填项</td>
         </tr>
         <tr>
           <td  align="right" class="hui1">公司名称：</td>
           <td  align="left" valign="middle" id="companyName">
           	<#if company??> ${company.name!''} </#if>
          </td>
          <td align="right" class="hui1">
          	<span class="red">*</span>
          	职位名称：</td>
          <td  align="left" valign="middle">
			 <input name="name" id="name" type="text" class="input validate[required]">
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1"><span class="red">*</span>招聘职位：</td>
           <td  align="left" valign="middle" clospan="3">
	         <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
          	  	 <input class="radio validate[required]" name="typeId" id="typeId" type="radio" value="${c.dictionaryId}" /> ${c.showName!''} 
          	 </#list>
          </td>
         </tr>
         
           <tr>
           <td  align="right" class="hui1"><span class="red">*</span>职位级别：</td>
           <td  align="left" valign="middle" clospan="3">
	         <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION_LEVE.getCode()) as c>
          	  	 <input  class="radio validate[required]" id="jobPositionLevelId" name="jobPositionLevelId" type="radio" value="${c.dictionaryId}" /> ${c.showName!''} 
          	 </#list>
          </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1"><span class="red">*</span>所在城区：</td>
           <td  align="left" valign="middle" clospan="3">
            	<#list DictionaryUtil.getTypes(DictionaryType.COMPANY_AREA.getCode()) as c>
          	  	  <input class="radio validate[required]" class="radio" id="areaId" name="areaId" type="radio"  <#if company??> <#if company.areaId??> <#if company.areaId==c.dictionaryId> checked </#if> </#if> </#if> value="${c.dictionaryId}" > ${c.showName!''} 
          	 	</#list>
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1"><span class="red">*</span>工作地点：</td>
           <td  align="left" valign="middle" clospan="3">
            	<input name="address" id="address" style="width: 330px;" onblur="companyJob.setLgltInfo(this.value);"  type="text" class="input validate[required]" <#if company??> value=${company.address!''} </#if>  >
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1"><span class="red">*</span>招聘人数：</td>
           <td  align="left" valign="middle">
          	 <input name="zpPersonCount" id="zpPersonCount" type="text" style="width:50px;" class="input validate[required,custom[number]]"  >
           &nbsp;人
           </td>
          <td align="right" class="hui1"><span class="red">*</span>是否急招：	</td>
          <td  align="left" valign="middle">
          	 <#list DictionaryUtil.getTypes(DictionaryType.JOB_URGENCY.getCode()) as c>
	          	 	<input class="radio validate[required]" id="zpUrgencyStatusId" name="zpUrgencyStatusId" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
          	 </#list>
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1"><span class="red">*</span>预计年薪：</td>
           <td  align="left" valign="middle">
          	 <input name="expectedYearMoneyStart" id="expectedYearMoneyStart" class="input validate[required,custom[number]]" type="text" style="width:50px;"  >
           	 -
           	 <input name="expectedYearMoneyEnd" id="expectedYearMoneyEnd" type="text" style="width:50px;" class="input validate[required,custom[number]]">
           	 &nbsp;万
           </td>
          <td align="right" class="hui1">要求工作年限：</td>
          <td  align="left" valign="middle">
          		<input name="workTermStart" id="workTermStart" type="text" style="width:50px;"  class="input validate[custom[number]]">
           	 -
           	 <input name="workTermEnd" id="workTermEnd" type="text" style="width:50px;"  class="input validate[custom[number]]">
           	 &nbsp;年
           </td>
         </tr>
         
         
         <tr>
           <td  align="right" class="hui1">年龄：</td>
           <td  align="left" valign="middle">
          	 <input name="ageStart" id="ageStart" type="text" style="width:50px;"  class="input validate[custom[number]]">
           	 -
           	 <input name="ageEnd" id="ageEnd" type="text" style="width:50px;"  class="input validate[custom[number]]">
           	 &nbsp;岁
           </td>
          <td align="right" class="hui1">婚否：</td>
          <td  align="left" valign="middle">
          	<#list DictionaryUtil.getTypes(DictionaryType.IS_MARRY.getCode()) as c>
	          	 	<input class="radio" name="maritalId"  type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
	        </#list>
           </td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1">性别：</td>
           <td  align="left" valign="middle">
	          	 <#list DictionaryUtil.getTypes(DictionaryType.SEX.getCode()) as c>
	          	 	<input class="radio" name="sex" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
	          	 </#list>
           </td>
          <td align="right" class="hui1">学历：</td>
          <td  align="left" valign="middle">
 				<#list DictionaryUtil.getTypes(DictionaryType.EDUCATION.getCode()) as c>
	          	 	<input class="radio" name="educationId" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
          	 	</#list>  
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
	          	 	<input class="radio" name="englishLevelId" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
          	 </#list> 
		  </td>
         </tr>
         
         
         
          <tr>
           <td  align="right" class="hui1"><span class="red">*</span>职位描述：</td>
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
         
         <tr>
           <td  align="right" class="hui1">关键字标签：</td>
           <td  align="left" valign="middle" colspan="2" id="keyWordLable">
           </td>
           <td  class="hui1">
           	可双击删除标签
           </td>
         </tr>
         
         <#if Session[Const.SESSION_USER_KEY].type==AccountType.ADMIN.getCode()>
	       	    <tr>
		           <td  align="right" class="hui1">关键字：</td>
		           <td  align="left" valign="middle" colspan="3">
		           		<input class="input" id="keyInput" name="keyInput" maxlength="10"> 
		           		<button type="button" class="btn btn-small" onclick="companyJob.addKeywordLable($(this).prev().val())">添&nbsp; 加</button>
		           </td>
         		</tr>
	       	<#elseif Session[Const.SESSION_USER_KEY].type==AccountType.TECHICAL_AUDIT.getCode() >
	       	 <tr>
		           <td  align="right" class="hui1"><span class="red">*</span>关键字：</td>
		           <td  align="left" valign="middle" colspan="2">
		           		<input class="input" id="keyInput" name="keyInput" maxlength="10"> 
		           		<button type="button" class="btn btn-small" onclick="companyJob.addKeywordLable($(this).prev().val())">添&nbsp; 加</button>
		           </td>
		           <td  class="hui1">
           				最少添加3个标签（越多精准度越高）
           		   </td>
         	</tr>
	     </#if>
         
         </table>
     </div>
     
     <div class="basic">
	 	<div class="basic01">团队相关</div>
	 </div>
	<div class="query1">
       <table width="100%" border="0">
         <tbody>
         <tr>
           <td  align="right" class="hui1">职位诱惑：</td>
           <td  align="left" valign="middle" clospan="3">
          	   <input name="jobTemptText" id="jobTemptText" type="text" class="input"  style="width:800px;">
           </td>
         </tr>
         
          <tr>
          <td align="right" class="hui1">职位诱惑项：</td>
          <td  align="left" valign="middle" clospan="3">
           	   <input name="jobTemptItem" id="jobTemptItem" type="text" class="input" style="width:800px;">
           	    &nbsp;请逗号分隔
		  </td>
         </tr>
         
         <tr>
           <td align="right" class="hui1">团队人数：</td>
           <td align="left" valign="middle">
 			 <input name="downTeamPersonCount"  id="downTeamPersonCount" type="text" style="width:50px;" class="input validate[custom[number]]">
           	 &nbsp;人
           </td>
          <td align="right" class="hui1">汇报对象：</td>
          <td align="left" valign="middle">
          			 <input name="reportObject" id="reportObject" type="text" class="input" >
           </td>
         </tr>
         
          </tr>
          


	   <tr style="display:none;" class="_detail">
           <td  align="right" class="hui1">录入人：</td>
           <td  align="left" valign="middle"  colspan="3" id="inPersonName">
           </td>
         </tr>
	 	<tr style="display:none;" class="_detail">
           <td  align="right" class="hui1">录入时间：</td>
           <td  align="left" valign="middle" colspan="3" id="inDatetime">
           </td>
         </tr>    
	 	<tr style="display:none;" class="_detail">
           <td  align="right" class="hui1">最后更新时间：</td>
           <td  align="left" valign="middle" colspan="3" id="lastUpdateTime">
           </td>
         </tr>
      <tr style="display:none;" class="_detail">
             <td  align="right" class="hui1">是否停用：</td>
             <td  align="left" valign="middle" colspan="3" id="isDelete">
             
             </td>
         </tr>
          
         <tr style=";" class="">
           <td  align="right" class="hui1">公司所在地：</td>
           <td  align="left" valign="middle" colspan="3" >
            	<div id="mapContainer" style="width:800px;height:400px;position: relative;"></div>
           </td>
         </tr>    
       </tbody>
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
<#include "../include/deleteConfirmModal.ftl">
<@gmc_model_js from="map" />
<script src="/js/companyJob.js"></script>
<script>
	companyJob.initPage();
	var employeeType ="${Session[Const.SESSION_USER_KEY].type}"; 
</script>
