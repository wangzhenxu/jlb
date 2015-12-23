
<#include "../include/comm_jlb_macro.ftl"/>

<script>
	 left_menu_class_num=1;
	 leftMenuNum=1;
</script>
<#include "../include/bootstrap.ftl"/>
<script type="text/javascript" src="/js/source/jquery.validationEngine.js"></script>
<script type="text/javascript" src="/js/source/jquery.validationEngine.min.js"></script>
<link href="/css/c_validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<script src="/js/ajaxfileupload.js"></script>
<script src="/js/my97/WdatePicker.js" type="text/javascript" > </script>
<script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>
 

<form id="addform" name="form"  method="post" enctype="multipart/form-data">
<input type="hidden" name="jlId" id="jlId"  value="${pid!''}"  />
<input type="hidden" name="onlyName" id="onlyName"/>
<input type="hidden" name="phoneT" id="phoneT"/>

<input type="hidden" name="jlFilePath" id="jlFilePath" />
<input type="hidden" name="jlContent" id="jlContent" />
<input type="hidden" name="oldFilePath" id="oldFilePath" />
<input type="hidden" name="jobPositionLevelIds" id="jobPositionLevelIds" />
<input type="hidden" name="coordX" id="coordX" />
<input type="hidden" name="coordY" id="coordY" />
<input type="hidden" name="hellpPersonId" id="hellpPersonId" value=${RequestParameters["hellpPersonId"]!0} />







<!-- 右侧 开始 -->
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="javascript:jlInfo.tolist();">简历管理</a> &gt; <strong class="m_title"> 增加简历</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01 m_title" >增加简历</div>
	</div>
     <div class="query1">
       <table width="100%" border="0" align="left">
         <tr>
           <td colspan="4" class="red">* 号为必填项</td>
         </tr>
         <tr>
           <td  align="right" class="hui1"><span class="red">*</span>上传简历：</td>
           <td  align="left" valign="middle">
	         <div class="uploadlay">
	           <div id="ui-upload-holder">
	             <div id="ui-upload-txt">浏览</div>
	             <input type="file" id="ui-upload-input" class="ui-upload-input" name="ui-upload-input" onchange="jlInfo.upload(this);">
	             </div>
	         </div>
          </td>
          <td  clospan="2" ></td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1"><span class="red">*</span>姓名：</td>
           <td  align="left" valign="middle">
          	 <input name="name" id="name" type="text" class="input validate[required],minSize[2]">
           </td>
          <td align="right" class="hui1"><span class="red">*</span>手机：</td>
          <td  align="left" valign="middle">
          	 <input name="phone" id="phone" type="text" class="input validate[required,custom[phone]]">
          </td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1">性别：</td>
           <td  align="left" valign="middle">
	          	 <#list DictionaryUtil.getTypes(DictionaryType.SEX.getCode()) as c>
	          	 	<input class="radio" name="sex" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
	          	 </#list>
           </td>
          <td align="right" class="hui1">邮箱：</td>
          <td  align="left" valign="middle">
          	 <input name="emal" id="emal" type="text" class="input validate[custom[email]]">
          </td>
         </tr>
          <tr>
           <td  align="right" class="hui1">身份证：</td>
           <td  align="left" valign="middle">
          	 <input name="identityCard" id="identityCard" type="text" class="input">
           </td>
          <td align="right" class="hui1">婚否：</td>
          <td  align="left" valign="middle">
				 <#list DictionaryUtil.getTypes(DictionaryType.IS_MARRY.getCode()) as c>
	          	 	<input class="radio" name="maritalId" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
	          	 </#list>
           </td>
         </tr>
         
          <tr>
          <td align="right" class="hui1">毕业学校：</td>
          <td  align="left" valign="middle">
          	 <input name="schoolTag" id="schoolTag" type="text" class="input" >
          </td>
           <td  align="right" class="hui1">最高学历：</td>
           <td  align="left" valign="middle">
          	 <#list DictionaryUtil.getTypes(DictionaryType.EDUCATION.getCode()) as c>
	          	 	<input class="radio" name="educationId" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
          	 </#list> 
           </td>
          
         </tr>
         
         <tr>
           <td  align="right" class="hui1">专业：</td>
           <td  align="left" valign="middle">
          	   <input name="topSpecialty" id="topSpecialty" type="text" class="input" >
           </td>
          <td align="right" class="hui1">英语等级：</td>
          <td  align="left" valign="middle">
	 		 <#list DictionaryUtil.getTypes(DictionaryType.ENGLISH_LEVEL.getCode()) as c>
	          	 	<input class="radio" name="englishLevelId" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
          	 </#list> 
		  </td>
         </tr>
         
         
          <tr>
           <td  align="right" class="hui1"><span class="red">*</span>工作开始时间：</td>
           <td  align="left" valign="middle">
          	 <input name="jobStartTimeT" class="Wdate input validate[required]" id="jobStartTimeT" onClick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-%M'})" type="text" >
           </td>
         	<td  align="right" class="hui1">出生年月：</td>
           	<td  align="left" valign="middle">
          	 <input name="birthdayT" id="birthday" onClick="WdatePicker({dateFmt:'yyyy-MM'})" type="text" class="Wdate input error-field" validate="validate[required,custom[eightCha]]">
           </td>
         </tr>
         
         <tr>
          
          <td align="right" class="hui1">现住址：</td>
          <td  align="left" valign="middle" colspan="3">
              <input name="nowAddress" id="nowAddress" onblur="jlInfo.setLgltInfo(this.value);" type="text" class="input" style="width:400px;" >
          	<span class="hui1">&nbsp;&nbsp;&nbsp;如果添加会匹配附近职位哦</span>
          </td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1"><span class="red">*</span>职位：</td>
           <td  align="left" valign="middle" clospan="3">
	         <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
          	  	 <input class="radio validate[required]" id="jobPositionId" name="jobPositionId" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
          	 </#list>
          </td>
         </tr>
         <tr>
           <td  align="right" class="hui1"><span class="red">*</span>职位级别：</td>
           <td  align="left" valign="middle" clospan="3">
			 <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION_LEVE.getCode()) as c>
          	  	 <input  class="checkbox validate[required]" name="jobPositionLevelId" id="jobPositionLevelId" type="checkbox" value="${c.dictionaryId}" > ${c.showName!''} 
          	 </#list>
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1"><span class="red">*</span>薪水要求：</td>
           <td  align="left" valign="middle" clospan="3">
			<#list DictionaryUtil.getTypes(DictionaryType.SALARY_REQUIRE.getCode()) as c>
          	  	 <input  class="radio validate[required]"  name="salaryRequireId" id="salaryRequireId" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
          	 </#list>
           </td>
         </tr>
         
         
	 	<tr style="display:none;" class="_detail">
           <td  align="right" class="hui1">录入时间：</td>
           <td  align="left" valign="middle" colspan="3" id="inTime">
           </td>
         </tr>
         
         <tr style="display:none;" class="_detail">
           <td  align="right" class="hui1">录入人：</td>
           <td  align="left" valign="middle" colspan="3" id="inPersonName">
           </td>
         </tr>  
         
          <tr style="display:none;" class="_detail">
           <td  align="right" class="hui1" style="width:100px;">简历内容：</td>
           <td  align="left" valign="middle" colspan="3" >
            <pre id="jlContent2" style="font-size: 15px;white-space: pre-wrap;word-wrap: break-word;" >
            </pre>
           </td>
         </tr>  
         
          <tr style="display:none;" class="">
           <td  align="right" class="hui1">所在地：</td>
           <td  align="left" valign="middle" colspan="3" >
            	<div id="mapContainer" style="width:800px;height:400px;position: relative;"></div>
           </td>
         </tr>    
         </table>
     </div>
    </div>
    <div class="anniu">
	    <button type="button" class="btn btn-default" id="addBtn">保 &nbsp;存</button>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 	<button type="button" class="btn btn-default" onclick="jlInfo.tolist();">返&nbsp; 回</button>
    </div>
   </div>
<!-- 右侧 结束 -->
</form>
<#include "../include/deleteConfirmModal.ftl">

<@gmc_model_js from="map" />
<script src="/js/zpJlInfo.js"></script>
<script>
	jlInfo.initPage();
</script>
