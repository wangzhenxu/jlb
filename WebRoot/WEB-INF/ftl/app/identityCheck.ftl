 <div class="xin1">
  <div class="xin1_1">
   <div class="whitea">身份信息</div>
   <div class="close"><img src="../images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd1">
     <table width="100%" align="left" cellpadding="0" cellspacing="0">
     <#if isUser>
      <tr>
        <td width="16%" height="45" align="right" class="hui1">真实姓名：</td>
        <td class="hui">${appIdentity.name}</td>
      </tr>
      <tr>
        <td height="45" align="right" class="hui1">是否外籍：</td>
        <td class="hui">
        	<#if appIdentity.foreignNationality>
        	否
        	<#else>
        	是
        	</#if>
        </td>
      </tr>
      <#else>
	      <tr>
	        <td width="16%" height="45" align="right" class="hui1">企业名称：</td>
	        <td class="hui">${appIdentity.name}</td>
	      </tr>
	      <tr>
	        <td height="45" align="right" class="hui1">是否外企：</td>
	        <td class="hui">
	        	<#if appIdentity.foreignNationality>
	        	否
	        	<#else>
	        	是
	        	</#if>
	        </td>
	      </tr>
      </#if>
      <tr>
        <td height="45" align="right" class="hui1">证件类型：</td>
        <td class="hui">
        <#if isUser>
        	<#if appIdentity.certificateType=1>
        	身份证
        	<#else>
        	护照
        	</#if>
    	<#else>
	    	<#if appIdentity.certificateType=1>
        	营业执照
        	<#else>
        	组织机构代码证
        	</#if>
    	</#if>
        </td>
      </tr>
      <tr>
        <td height="45" align="right" class="hui1">证件号码：</td>
        <td class="hui">${appIdentity.certificateCode}</td>
      </tr>
      <tr>
        <td align="right" valign="top" class="hui1">证件照片：</td>
        <td valign="middle" class="zhaopian"><img src="${ApplicationConst.APP_UPLOAD_PIC_URL}${StringUtil.isBlankToDefault(appIdentity.certificatePic,'/images/zw.jpg')}" width="150" height="90" /></td>
      </tr>
      <tr>
      <#if isUser>
        <td height="45" align="right" class="hui1">手机号码：</td>
      <#else>
        <td height="45" align="right" class="hui1">电话号码：</td>
      </#if>
        <td class="hui">${appIdentity.mobileNumber?default('空')}</td>
      </tr>
     </table>
    </div>
   </div>
   <div class="caidan2">&nbsp;</div>
  </div>
 </div>
