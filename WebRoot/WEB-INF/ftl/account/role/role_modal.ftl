 <link href="/css/shiro.css" rel="stylesheet" type="text/css" />
 <div class="modal hide fade quanxian" id="roleModal">
 	<form id="saveRoleForm" action="/account/role/save.action" method="post">
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
      <div class="limits1_1">
       <ul>
       	<#-- 简历管理 -->
        <li>
         <div class="top">
       		<strong><input type="checkbox" class="zpJlInfo-parent" id="zpJlInfo" value="10300" style=" vertical-align:middle" /><label for="zpJlInfo">&nbsp;简历管理</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="zpJlInfo-child" id="zpJlInfoAdd" value="10301" style=" vertical-align:middle" /><label for="zpJlInfoAdd">&nbsp;添加简历</label> 
          <input type="checkbox" class="zpJlInfo-child" id="zpJlInfoDelete" value="10302" style=" vertical-align:middle" /><label for="zpJlInfoDelete">&nbsp;删除简历</label> 
          <input type="checkbox" class="zpJlInfo-child" id="zpJlInfoUpdate" value="10303" style=" vertical-align:middle" /><label for="zpJlInfoUpdate">&nbsp;修改简历</label>
          <input type="checkbox" class="zpJlInfo-child" id="zpJlInfoDetail" value="10305" style=" vertical-align:middle" /><label for="zpJlInfoDetail">&nbsp;简历详情</label>
          <input type="checkbox" class="zpJlInfo-child" id="zpJlInfoDown" value="10304" style=" vertical-align:middle" /><label for="zpJlInfoDown">&nbsp;下载简历</label>
          <input type="checkbox" class="zpJlInfo-child" id="zpJlInfoAssignAuditPerson" value="10306" style=" vertical-align:middle" /><label for="zpJlInfoAssignAuditPerson">&nbsp;选择评审</label>
         </div>
        </li>
        <#-- 客户管理 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="zpCompanyInfo-parent" id="zpCompanyInfo" value="10400" style=" vertical-align:middle" /><label for="zpCompanyInfo">&nbsp;客户管理<label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="zpCompanyInfo-child" id="zpCompanyInfoAdd" value="10401" style=" vertical-align:middle" /><label for="zpCompanyInfoAdd">&nbsp;添加客户</label>
          <input type="checkbox" class="zpCompanyInfo-child" id="zpCompanyInfoDelete" value="10402" style=" vertical-align:middle" /><label for="zpCompanyInfoDelete">&nbsp;停用启用客户</label>    
          <input type="checkbox" class="zpCompanyInfo-child" id="zpCompanyInfoUpdate" value="10403" style=" vertical-align:middle" /><label for="zpCompanyInfoUpdate">&nbsp;修改客户</label>     
          <input type="checkbox" class="zpCompanyInfo-child" id="zpCompanyInfoDetail" value="10404" style=" vertical-align:middle" /><label for="zpCompanyInfoDetail">&nbsp;客户详情</label>     
         </div>
        </li>
        
       <#-- 职位管理 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="zpCompanyJobInfo-parent" id="zpCompanyJobInfo" value="10500" style=" vertical-align:middle" /><label for="zpCompanyJobInfo">&nbsp;职位管理<label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="zpCompanyJobInfo-child" id="zpCompanyJobInfoAdd" value="10501" style=" vertical-align:middle" /><label for="zpCompanyJobInfoAdd">&nbsp;添加职位</label>
          <input type="checkbox" class="zpCompanyJobInfo-child" id="zpCompanyJobInfoDelete" value="10502" style=" vertical-align:middle" /><label for="zpCompanyJobInfoDelete">&nbsp;停用启用职位</label>    
          <input type="checkbox" class="zpCompanyJobInfo-child" id="zpCompanyJobInfoUpdate" value="10504" style=" vertical-align:middle" /><label for="zpCompanyJobInfoUpdate">&nbsp;修改职位</label>     
          <input type="checkbox" class="zpCompanyJobInfo-child" id="zpCompanyJobInfoDetail" value="10503" style=" vertical-align:middle" /><label for="zpCompanyJobInfoDetail">&nbsp;职位详情</label>     
         </div>
        </li>
        
       </ul>
      </div>
      <div class="limits2_1">
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
        
        <#-- 简历匹配管理 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="zpJobMatchingInfo-parent" id="zpJobMatchingInfo" value="10600" style=" vertical-align:middle" /><label for="zpJobMatchingInfo">&nbsp;简历匹配管理<label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="zpJobMatchingInfo-child" id="zpJobMatchingInfoAdd" value="10601" style=" vertical-align:middle" /><label for="zpJobMatchingInfoAdd">&nbsp;匹配职位</label>
          <input type="checkbox" class="zpJobMatchingInfo-child" id="zpJobMatchingInfoDetail" value="10602" style=" vertical-align:middle" /><label for="zpJobMatchingInfoDetail">&nbsp;匹配详情</label>    
         </div>
        </li>
        
         <#-- 评审管理 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="JlAudit-parent" id="JlAudit" value="10700" style=" vertical-align:middle" /><label for="JlAudit">&nbsp;简历评审管理<label></strong>
         </div>
         <div class="top1">
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
   		<a href="javascript:closeModal();"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a>
   	</div>
  </div>
  </form>
 </div>