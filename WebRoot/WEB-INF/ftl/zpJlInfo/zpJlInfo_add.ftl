

<script>
	 left_menu_class_num=1;
	 leftMenuNum=1;
</script>
<script type="text/javascript" src="/js/source/c_jquery.validationEngine.js"></script>
<script type="text/javascript" src="/js/source/c_jquery.validationEngine.min.js"></script>
<link href="/css/c_validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<script src="/js/zpJlInfo.js"></script>
<script src="/js/ajaxfileupload.js"></script>
<script src="/js/my97/WdatePicker.js" type="text/javascript" > </script>

<form id="addform" name="form" action="/zpJlInfo/add.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="jlFilePath" id="jlFilePath" />
<input type="hidden" name="jlContent" id="jlContent" />
<input type="hidden" name="jobPositionLevelIds" id="jobPositionLevelIds" />

<!-- 右侧 开始 -->
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">CMS发布管理</a> &gt; 系统发布 &gt;<strong> 增加系统</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">系统发布</div>
	</div>
     <div class="query1">
       <table width="100%" border="0" align="left">
         <tr>
           <td colspan="4" class="red">* 号为必填项</td>
         </tr>
         <tr>
           <td  align="right" class="hui1">上传简历：</td>
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
           <td  align="right" class="hui1">姓名：</td>
           <td  align="left" valign="middle">
          	 <input name="name" id="name" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
           </td>
          <td align="right" class="hui1">电话：</td>
          <td  align="left" valign="middle">
          	 <input name="phone" id="phone" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
          </td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1">性别：</td>
           <td  align="left" valign="middle">
	          	 <#list DictionaryUtil.getTypes(DictionaryType.SEX.getCode()) as c>
	          	 	<input class="radio" name="sex" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
	          	 </#list>
           </td>
          <td align="right" class="hui1">邮箱：</td>
          <td  align="left" valign="middle">
          	 <input name="emal" id="emal" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
          </td>
         </tr>
          <tr>
           <td  align="right" class="hui1">身份证：</td>
           <td  align="left" valign="middle">
          	 <input name="identityCard" id="identityCard" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
           </td>
          <td align="right" class="hui1">婚否：</td>
          <td  align="left" valign="middle">
				 <#list DictionaryUtil.getTypes(DictionaryType.IS_MARRY.getCode()) as c>
	          	 	<input class="radio" name="maritalId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
	          	 </#list>
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1">最高学历：</td>
           <td  align="left" valign="middle">
          	 <#list DictionaryUtil.getTypes(DictionaryType.EDUCATION.getCode()) as c>
	          	 	<input class="radio" name="educationId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
          	 </#list> 
           </td>
          <td align="right" class="hui1">学校名称：</td>
          <td  align="left" valign="middle">
          	 <input name="schoolTag" id="schoolTag" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
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
           <td  align="right" class="hui1">出生年月：</td>
           <td  align="left" valign="middle">
          	 <input name="birthdayT" id="birthday" onClick="WdatePicker({dateFmt:'yyyy-MM'})" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
           </td>
          <td align="right" class="hui1"></td>
          <td  align="left" valign="middle">
          </td>
         </tr>
          <tr>
           <td  align="right" class="hui1">工作开始时间：</td>
           <td  align="left" valign="middle">
          	 <input name="jobStartTimeT" id="jobStartTimeT" onClick="WdatePicker({dateFmt:'yyyy-MM'})" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
           </td>
          <td align="right" class="hui1">现住址：</td>
          <td  align="left" valign="middle">
                       <input name="nowAddress" id="nowAddress" type="text" class="inputa error-field" validate="validate[required,custom[eightCha]]">
          </td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1">职位：</td>
           <td  align="left" valign="middle" clospan="3">
	         <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
          	  	 <input class="radio" name="jobPositionId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
          	 </#list>
          </td>
         </tr>
         <tr>
           <td  align="right" class="hui1">职位级别：</td>
           <td  align="left" valign="middle" clospan="3">
			 <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION_LEVE.getCode()) as c>
          	  	 <input class="radio" name="jobPositionLevelId" type="checkbox" value="${c.dictionaryId}" > ${c.name!''} 
          	 </#list>
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1">薪水要求：</td>
           <td  align="left" valign="middle" clospan="3">
			<#list DictionaryUtil.getTypes(DictionaryType.SALARY_REQUIRE.getCode()) as c>
          	  	 <input class="radio" name="salaryRequireId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
          	 </#list>
           </td>
         </tr>
         </table>

     </div>
    </div>
    <div class="anniu">
	   <a href="javascript:void(0)"><img id="addBtn" src="/images/erji1_19.jpg" width="101" height="29" /></a>
	   &nbsp;&nbsp;<a href="/cmsSolution/sub/list.action"><img   src="/images/gddc_05.jpg"  /></a>
    </div>
   </div>



<!-- 右侧 结束 -->
</form>

<script>
	jlInfo.initAddPage();
</script>
