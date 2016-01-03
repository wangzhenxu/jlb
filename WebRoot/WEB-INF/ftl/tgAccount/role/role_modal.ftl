 <link href="/css/shiro.css" rel="stylesheet" type="text/css" />
 <div class="modal hide fade quanxian" id="roleModal">
 	<form id="saveRoleForm" action="/tgAccount/role/save.action" method="post">
 	<input type="hidden" name="roleId" value=""/>
 	<div id="permissionList"></div>
 	
  <div class="quanxian1">
   <div class="whitea" id="roleModalTitle">添加角色</div>
   <#-- 关闭 -->
   <div class="close"><img onclick="closeModal();" src="/images/xinjian_03.gif" width="18" height="18"/></div>
  </div>
  <div class="quanxian2">
   <div class="caidan1">
    <div class="quanxian2_1">
     <table width="100%" border="0">
      <tr>
   		<#-- 角色名称 -->
        <td width="11%" align="right" class="hui1">角色名称：</td>
        <td width="89%" align="left" valign="middle">
        	<input name="roleName" id="rolename" type="text" class="input" validate="validate[required]"/><span style="color:red;padding-left:5px;" id="roleNameTip"></span>
        </td>
      </tr>
      </table>
    </div>
    <div class="quanxian3">
     <div class="limitsShiro">权限划分：<span style="color:red;padding-left:5px;" id="permissionListTip"></span></div>
     <div class="limitsShiro1">
      <div class="limits1_1" style="width: 350px;">
       <ul>
       	<#-- 后台角色 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="roleManagement-parent" id="roleManagement" value="10100" style=" vertical-align:middle" /><label for="roleManagement">&nbsp;后台角色</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="roleManagement-child" id="roleManagementAdd" value="10101" style=" vertical-align:middle" /><label for="roleManagementAdd">&nbsp;添加角色</label>
          <input type="checkbox" class="roleManagement-child" id="roleManagementDelete" value="10102" style=" vertical-align:middle" /><label for="roleManagementDelete">&nbsp;删除角色</label>
          <input type="checkbox" class="roleManagement-child" id="roleManagementEdit" value="10103" style=" vertical-align:middle" /><label for="roleManagementEdit">&nbsp;修改角色</label>
         </div>
        </li>
        <#-- 后台账号 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="accountInfo-parent" id="accountInfo" value="10200" style=" vertical-align:middle" /><label for="accountInfo">&nbsp;后台账号</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="accountInfo-child" id="accountInfoAdd" value="10201" style=" vertical-align:middle" /><label for="accountInfoAdd">&nbsp;添加账号</label>
          <input type="checkbox" class="accountInfo-child" id="accountInfoDelete" value="10202" style=" vertical-align:middle" /><label for="accountInfoDelete">&nbsp;删除账号</label>
          <input type="checkbox" class="accountInfo-child" id="accountInfoEdit" value="10203" style=" vertical-align:middle" /><label for="accountInfoEdit">&nbsp;修改账号</label>
          <input type="checkbox" class="accountInfo-child" id="accountInfoDisableAndEnabled" value="10204" style=" vertical-align:middle" /><label for="accountInfoDisableAndEnabled">&nbsp;停用启用账号</label>
          
         </div>
        </li>
        
         <#-- 账号扩展信息 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="accountExpandInfo-parent" id="accountExpandInfo" value="10300" style=" vertical-align:middle" /><label for="accountExpandInfo">&nbsp;账号扩展信息</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="accountExpandInfo-child" id="accountExpandInfoEdit" value="10301" style=" vertical-align:middle" /><label for="accountExpandInfoEdit">&nbsp;修改自己个人信息</label>
          <input type="checkbox" class="accountExpandInfo-child" id="accountExpandInfoDetail" value="10302" style=" vertical-align:middle" /><label for="accountExpandInfoDetail">&nbsp;个人信息详情</label>
          <input type="checkbox" class="accountExpandInfo-child" id="accountExpandInfoEitAll" value="10303" style=" vertical-align:middle" /><label for="accountExpandInfoEitAll">&nbsp;修改所有个人信息</label>
          
         </div>
        </li>
        
        
       </ul>
      </div>
      <div class="limits2_1">
       <ul>
        
        
          <#-- 用户建议管理 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="tgSuggestInfo-parent" id="tgSuggestInfo" value="10400" style=" vertical-align:middle" /><label for="tgSuggestInfo">&nbsp;用户建议管理</label></strong>
         </div>
         <div class="top1">
                    
         </div>
        </li>
        
          <#-- 用户bug管理 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="tgBugInfo-parent" id="tgBugInfo" value="10500" style=" vertical-align:middle" /><label for="tgBugInfo">&nbsp;用户bug管理 </label></strong>
         </div>
         <div class="top1">
                    
         </div>
        </li>
        
         <#-- 客户管理 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="zpCompanyInfo-parent" id="zpCompanyInfo" value="10600" style=" vertical-align:middle" /><label for="zpCompanyInfo">&nbsp;客户管理<label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="zpCompanyInfo-child" id="zpCompanyInfoAdd" value="10601" style=" vertical-align:middle" /><label for="zpCompanyInfoAdd">&nbsp;添加客户</label>
          <input type="checkbox" class="zpCompanyInfo-child" id="zpCompanyInfoDelete" value="10602" style=" vertical-align:middle" /><label for="zpCompanyInfoDelete">&nbsp;停用启用客户</label>    
          <input type="checkbox" class="zpCompanyInfo-child" id="zpCompanyInfoUpdate" value="10603" style=" vertical-align:middle" /><label for="zpCompanyInfoUpdate">&nbsp;修改客户</label>     
          <input type="checkbox" class="zpCompanyInfo-child" id="zpCompanyInfoDetail" value="10604" style=" vertical-align:middle" /><label for="zpCompanyInfoDetail">&nbsp;客户详情</label>     
         </div>
        </li>
        
        
        
       </ul>
      </div>
     </div>
    </div>
   </div>
   
   <div class="caidan2">
        <#-- 确定 -->
   		<a href="javascript:saveRole();" id="btnOkModal"><img src="/images/bjwj03.jpg" width="62" height="23" /></a>&nbsp;
   		<#-- 取消 -->
   		<a href="javascript:closeModal();"  id="btnCancelModal"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a>
   	</div>
  </div>
  </form>
 </div>