
<div class="xin1">
	<form id="saveAccountForm" action="/account/add.action" method="post">
	  	<div class="xin1_1">
	   		<div class="whitea">添加用户</div>
	   		<div class="close"><img data-dismiss="modal" src="/images/xinjian_03.gif" width="18" height="18"/></div>
	  	</div>
	  	<div class="caidan">
	   		<div class="caidan1">
		    	<div class="cd1">
		     		<table width="100%" border="0">
		      			<tr>
					        <td width="25%" align="right" class="hui1">用户名：</td>
					        <td width="75%" align="left" valign="middle">
					        	<input name="username" type="text" class="input" id="textfield" validate="validate[required]"/>
					        	<span class='tip'></span>
		        			</td>
		      			</tr>
		      			<tr>
					        <td align="right" class="hui1">用户密码：</td>
					        <td align="left" valign="middle">
					        	<input name="password" type="password" class="input" id="textfield2" validate="validate[required,length[4,20]]"/>
					        	<span class='tip'></span>
					        </td>
					      </tr>
					      <tr>
					        <td align="right" class="hui1">确认密码：</td>
					        <td align="left" valign="middle">
					        	<input name="retryPassword" type="password" class="input" id="textfield3" validate="validate[required,confirm[textfield2]]"/>
					        	<span class='tip'></span>
					        </td>
					      </tr>
					      <tr>
					        <td align="right" class="hui1">选择角色：</td>
					        <td align="left" valign="middle">
					          <select name="role.roleId" class="input">
					          		<#list roleList as role>
					          			<option value="${role.roleId}">${role.roleName}</option>
					          		</#list>
					          </select>
					          <span class='tip'></span>
					         </td>
					      </tr>
					      
					      <tr>
					        <td align="right" class="hui1">用户类型：</td>
					        <td align="left" valign="middle">
					          		<#list AccountType.values() as type>
              							<input class="radio" validate="validate[required]"  onchange="accountTypeSelected(this)" name="type" id="type" type="radio" value="${type.code}" > ${type.title}
 									</#list>
					          <span class='tip'></span>
					         </td>
					      </tr>
					      
					       <tr id="auditPostion_id" style="display:none">
					        <td align="right" class="hui1">评审职位：</td>
					        <td align="left" valign="middle">
					        	<select id="auditPositionId" name="auditPositionId">
			    		 			<option value="" > 请选择 </option>
			    		    		<#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
			    		 				 <option value="${c.dictionaryId}" <#if  jobPositionId?? && jobPositionId!=''> <#if jobPositionId?number==c.dictionaryId> selected </#if> </#if>  > ${c.name!''} </option>
			 			 			</#list>
			    		  		</select>
					          <span class='tip'></span>
					         </td>
					      </tr>
					      
					      
					      
		      		</table>
		    	</div>
	   		</div>
		   <div class="caidan2">
		   		<a href="javascript:addAccount();" ><img src="/images/bjwj03.jpg" width="62" height="23" /></a>&nbsp;
		   		<a href="#" data-dismiss="modal"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a>
		   	</div>
	  	</div>
  	</form>
 </div>
<style type="text/css">
 	.close{opacity:1;}
 	.tip{padding-left:10px;color:red;}
 </style>