
<div class="xin1">
  <div class="xin1_1">
   <div class="whitea">查看用户</div>
   <div class="close"><img data-dismiss="modal" src="/images/xinjian_03.gif" width="18" height="18"/></div>
  </div>
  <div class="caidan">
   <div class="caidan1">
    <div class="cd1">
     <table width="100%" border="0">
      <tr>
        <td width="25%" align="right" class="hui1">用户名：</td>
        <td width="75%" align="left" valign="middle">
        	<span>${account.username}<span/>
        </td>
      </tr>
      <tr>
        <td align="right" class="hui1">用户角色：</td>
        <td align="left" valign="middle">
      		<#if account.role??>
      			${account.role.roleName}
      		</#if>
         </td>
      </tr>
      
       <tr>
	        <td align="right" class="hui1">用户类型：</td>
	        <td align="left" valign="middle">
	          		<#list AccountType.values() as type>
						<input class="radio" <#if account.type??> <#if account.type==type.code> checked </#if> </#if> validate="validate[required]"  onchange="accountTypeSelected(this)" name="type" id="type" type="radio" value="${type.code}" > ${type.title}
					</#list>
	          <span class='tip'></span>
	         </td>
	      </tr>
	      
	       <tr id="auditPostion_id" <#if account.type??> <#if account.type==AccountType.TECHICAL_AUDIT.getCode()><#else> style="display:none;" </#if> </#if>   >
	        <td align="right" class="hui1">评审职位：</td>
	        <td align="left" valign="middle">
	        	<select id="auditPositionId" name="auditPositionId">
		 			<option value="" > 请选择 </option>
		    		<#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
		 				 <option value="${c.dictionaryId}" <#if  account.auditPositionId??> <#if account.auditPositionId==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
		 			</#list>
		  		</select>
	          <span class='tip'></span>
	         </td>
	      </tr>
	      
      </table>
    </div>
   </div>
   <div class="caidan2">
   		<a href="#" data-dismiss="modal"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a>
   	</div>
  </div>
 </div>
 </div>
<style type="text/css">
 	.close{opacity:1;}
 </style>