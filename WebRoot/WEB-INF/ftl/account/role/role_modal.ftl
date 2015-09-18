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
       	<#-- 产品分类 -->
        <li>
         <div class="top">
       		<strong><input type="checkbox" class="productClass-parent" id="productClass" value="10300" style=" vertical-align:middle" /><label for="productClass">&nbsp;产品分类</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="productClass-child" id="productClassAdd" value="10301" style=" vertical-align:middle" /><label for="productClassAdd">&nbsp;添加分类</label> 
          <input type="checkbox" class="productClass-child" id="productClassDelete" value="10302" style=" vertical-align:middle" /><label for="productClassDelete">&nbsp;删除分类</label> 
          <input type="checkbox" class="productClass-child" id="productClassUpdate" value="10303" style=" vertical-align:middle" /><label for="productClassUpdate">&nbsp;修改分类</label>
         </div>
        </li>
        <#-- 产品管理 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="productManagement-parent" id="productManagement" value="10400" style=" vertical-align:middle" /><label for="productManagement">&nbsp;产品管理<label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="productManagement-child" id="productManagementAdd" value="10401" style=" vertical-align:middle" /><label for="productManagementAdd">&nbsp;添加产品</label>
          <input type="checkbox" class="productManagement-child" id="productManagementDelete" value="10402" style=" vertical-align:middle" /><label for="productManagementDelete">&nbsp;删除产品</label>    
          <input type="checkbox" class="productManagement-child" id="productManagementUpdate" value="10403" style=" vertical-align:middle" /><label for="productManagementUpdate">&nbsp;修改产品</label>     
         </div>
        </li>
        
        <#-- 序列号管理 -->
        <li>
         <div class="top">
			<strong><input type="checkbox" class="snManagement-parent" id="snManagement" value="10500" style=" vertical-align:middle" /><label for="snManagement">&nbsp;序列号管理<label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="snManagement-child" id="snManagementGenerate" value="10501" style=" vertical-align:middle" /><label for="snManagementGenerate">&nbsp;生成序列号</label> 
          <input type="checkbox" class="snManagement-child" id="snManagementDownload" value="10502" style=" vertical-align:middle" /><label for="snManagementDownload">&nbsp;下载序列号</label>
         </div>
        </li>
        <#-- 产品库系统分类 -->
        <li>
         <div class="top">
       		<strong><input type="checkbox" class="cmsSolution-parent" id="cmsSolution" value="11000" style=" vertical-align:middle" /><label for="cmsSolution">&nbsp;系统分类</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="cmsSolution-child" id="cmsSolutionAdd" value="11001" style=" vertical-align:middle" /><label for="cmsSolutionAdd">&nbsp;添加系统</label> 
          <input type="checkbox" class="cmsSolution-child" id="cmsSolutionUpdate" value="11003" style=" vertical-align:middle" /><label for="cmsSolutionUpdate">&nbsp;修改系统</label> 
          <input type="checkbox" class="cmsSolution-child" id="cmsSolutionDelete" value="11002" style=" vertical-align:middle" /><label for="cmsSolutionDelete">&nbsp;删除系统</label>
         </div>
        </li>
        <#-- 产品发布 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="productPublish-parent" id="productPublish" value="11200" style=" vertical-align:middle" /><label for="productPublish">&nbsp;产品发布<label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="productPublish-child" id="productPublishAdd" value="11205" style=" vertical-align:middle" /><label for="productPublishAdd">&nbsp;添加</label>
          <input type="checkbox" class="productPublish-child" id="productPublishEdit" value="11202" style=" vertical-align:middle" /><label for="productPublishEdit">&nbsp;编辑</label>    
          <input type="checkbox" class="productPublish-child" id="productPublishDelete" value="11203" style=" vertical-align:middle" /><label for="productPublishDelete">&nbsp;删除</label>     
          <input type="checkbox" class="productPublish-child" id="productPublishType" value="11206" style=" vertical-align:middle" /><label for="productPublishType">&nbsp;发布状态</label>     
         </div>
        </li>
         <#-- 产品库分类 -->
        <li>
         <div class="top">
       		<strong><input type="checkbox" class="productApp-parent" id="productApp" value="11100" style=" vertical-align:middle" /><label for="productApp">&nbsp;产品库分类</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="productApp-child" id="productAppAdd" value="11101" style=" vertical-align:middle" /><label for="productAppAdd">&nbsp;添加系统</label> 
          <input type="checkbox" class="productApp-child" id="productAppDelete" value="11102" style=" vertical-align:middle" /><label for="productAppDelete">&nbsp;删除系统</label> 
          <input type="checkbox" class="productApp-child" id="productAppUpdate" value="11103" style=" vertical-align:middle" /><label for="productAppUpdate">&nbsp;修改系统</label>
         </div>
        </li>
         <#-- 查看场景 -->
        <li>
         <div class="top">
       		<strong><input type="checkbox" class="scene-parent" id="scene" value="10901" style=" vertical-align:middle" /><label for="scene">&nbsp;场景查看</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="scene-child" id="sceneAdd" value="10900" style=" vertical-align:middle" /><label for="sceneAdd">&nbsp;详情查看</label> 
         </div>
        </li>
         <#-- 网站用户 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="userManagement-parent" id="userManagement" value="10700" style=" vertical-align:middle" /><label for="userManagement">&nbsp;网站用户</label></strong>
         </div>
         <div class="top1">
         </div>
        </li>
        
        
         <#-- 客户角色-->
        <li>
         <div class="top">
       		<strong><input type="checkbox" class="customer_account_role-parent" id="customer_account_role" value="11600" style=" vertical-align:middle" /><label for="scene">&nbsp;客户角色</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="customer_account_role-child" id="customer_account_role:save" value="11601" style=" vertical-align:middle" /><label for="customer_account_role:save">&nbsp;增加/编辑</label>
          <input type="checkbox" class="customer_account_role-child" id="customer_account_role:delete" value="11604" style=" vertical-align:middle" /><label for="customer_account_role:delete">&nbsp;删除</label>   
          <input type="checkbox" class="customer_account_role-child" id="customer_account_role:get" value="11602" style=" vertical-align:middle" /><label for="customer_account_role:get">&nbsp;详情</label>
          <input type="checkbox" class="customer_account_role-child" id="customer_account_role:saveRole" value="11603" style=" vertical-align:middle" /><label for="customer_account_role:saveRole">&nbsp;分配</label> 
         </div>
        </li>
        
        <#-- 客户帐号 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="customer-parent" id="customer" value="11400" style=" vertical-align:middle" /><label for="customer">&nbsp;客户帐号<label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="customer-child" id="customerAdd" value="11401" style=" vertical-align:middle" /><label for="customerAdd">&nbsp;添加</label>
          <input type="checkbox" class="customer-child" id="customerDelete" value="11403" style=" vertical-align:middle" /><label for="customerDelete">&nbsp;删除</label>     
          <input type="checkbox" class="customer-child" id="customerEdit" value="11402" style=" vertical-align:middle" /><label for="customerEdit">&nbsp;编辑</label>    
          <input type="checkbox" class="customer-child" id="customerDetail" value="11404" style=" vertical-align:middle" /><label for="customerDetail">&nbsp;详情</label>     
         </div>
        </li>
        
         <#-- 项目管理 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="project-parent" id="project" value="11700" style=" vertical-align:middle" /><label for="project">&nbsp;项目管理<label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="project-child" id="projectAdd" value="11704" style=" vertical-align:middle" /><label for="projectAdd">&nbsp;增加项目</label>
          <input type="checkbox" class="project-child" id="projectDelete" value="11703" style=" vertical-align:middle" /><label for="projectDelete">&nbsp;删除</label>  
          <input type="checkbox" class="project-child" id="projectEdit" value="11702" style=" vertical-align:middle" /><label for="projectEdit">&nbsp;编辑</label>    
          <input type="checkbox" class="project-child" id="projectDetail" value="11701" style=" vertical-align:middle" /><label for="projectDetail">&nbsp;详情</label>     
         </div>
        </li>
        
        
        
        <#-- 统计分析 
        <li>
         <div class="top">
          <strong><input type="checkbox" id="productClassAdd" value="10600" style=" vertical-align:middle" />统计分析</strong>
         </div>
         <div class="top1">
          <input type="checkbox" id="statAnalysisView" value="10601" style=" vertical-align:middle" /><label for="statAnalysisView">统计查看</label>
         </div>
        </li>-->
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
         </div>
        </li>
        
        <#-- 应用详情查看 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="appDetail-parent" id="appDetail" value="10800" style=" vertical-align:middle" /><label for="appDetail">&nbsp;应用详情查看</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="appDetail-child" id="appDetailLogCheck" value="10801" style=" vertical-align:middle" /><label for="appDetailLogCheck">&nbsp;操作日志</label>
          <input type="checkbox" class="appDetail-child" id="appDetailIdentityCheck" value="10802" style=" vertical-align:middle" /><label for="appDetailIdentityCheck">&nbsp;身份验证</label>
          <input type="checkbox" class="appDetail-child" id="appDetailMaintenanceLogCheck" value="10803" style=" vertical-align:middle" /><label for="appDetailMaintenanceLogCheck">&nbsp;运营日志</label>
          <input type="checkbox" class="appDetail-child" id="appDetailGetAppUserLogList" value="10804" style=" vertical-align:middle" /><label for="appDetailGetAppUserLogList">&nbsp;数据统计</label>
         </div>
        </li>
         <#-- 审核应用 -->
        <li>
         <div class="top">
       		<strong><input type="checkbox" class="app-parent" id="app" value="10811" style=" vertical-align:middle" /><label for="app">&nbsp;应用审核</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="app-child" id="appFirstCheck" value="10812" style=" vertical-align:middle" /><label for="appFirstCheck">&nbsp;初审</label>
          <input type="checkbox" class="app-child" id="appSecondCheck" value="10813" style=" vertical-align:middle" /><label for="appSecondCheck">&nbsp;复审</label>
          <input type="checkbox" class="app-child" id="appDelete" value="10814" style=" vertical-align:middle" /><label for="appDelete">&nbsp;删除应用</label>
          <input type="checkbox" class="app-child" id="appPublish" value="10815" style=" vertical-align:middle" /><label for="appPublish">&nbsp;发布应用</label>
         </div>
        </li>
        
        <#-- 应用查看 -->
        <li>
         <div class="top">
       		<strong><input type="checkbox" class="appAll-parent" id="appAll" value="10821" style=" vertical-align:middle" /><label for="appAll">&nbsp;应用查看</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="appAll-child" id="appAllLog" value="10822" style=" vertical-align:middle" /><label for="appAllLog">&nbsp;日志查看</label> 
         </div>
        </li>
        
         <#-- 上线查看 -->
        <li>
         <div class="top">
       		<strong><input type="checkbox" class="appPublished-parent" id="appPublished" value="10831" style=" vertical-align:middle" /><label for="appPublished">&nbsp;上线查看</label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="appPublished-child" id="appPublishedUpdate" value="10833" style=" vertical-align:middle" /><label for="appPublishedUpdate">&nbsp;修改应用</label> 
          <input type="checkbox" class="appPublished-child" id="appPublishedCancel" value="10832" style=" vertical-align:middle" /><label for="appPublishedCancel">&nbsp;取消上线</label> 
         </div>
        </li>
        <#-- 系统发布 -->
        <li>
         <div class="top">
          <strong><input type="checkbox" class="systemPublish-parent" id="systemPublish" value="11300" style=" vertical-align:middle" /><label for="systemPublish">&nbsp;系统发布<label></strong>
         </div>
         <div class="top1">
          <input type="checkbox" class="systemPublish-child" id="systemPublishAdd" value="11305" style=" vertical-align:middle" /><label for="systemPublishAdd">&nbsp;添加</label>
          <input type="checkbox" class="systemPublish-child" id="systemPublishEdit" value="11302" style=" vertical-align:middle" /><label for="systemPublishEdit">&nbsp;编辑</label>    
          <input type="checkbox" class="systemPublish-child" id="systemPublishDelete" value="11303" style=" vertical-align:middle" /><label for="systemPublishDelete">&nbsp;删除</label>     
          <input type="checkbox" class="systemPublish-child" id="systemPublishType" value="11306" style=" vertical-align:middle" /><label for="systemPublishType">&nbsp;发布状态</label>     
         </div>
        </li>
             <#--公众帐号 管理-->
           <li>
               <div class="top">
                   <strong><input type="checkbox" class="systemPublish-parent" id="mpCustomer" value="11501" style=" vertical-align:middle" /><label for="mpCustomer">&nbsp;公共帐号管理<label></strong>
               </div>
               <div class="top1">
                   <input type="checkbox" class="systemPublish-child" id="mpCustomerGrantedList" value="11502" style=" vertical-align:middle" /><label for="mpCustomerGrantedList">&nbsp;授权记录</label>
                   <input type="checkbox" class="systemPublish-child" id="mpCustomerDisabled" value="11503" style=" vertical-align:middle" /><label for="mpCustomerDisabled">&nbsp;停用</label>

               </div>
           </li>

           <#--规则设定-->
            <li>
                <div class="top">
                    <strong><input type="checkbox" class="systemPublish-parent" id="mpsMagt" value="11504" style=" vertical-align:middle" /><label for="mpRule">&nbsp;微服务规则设定<label></strong>
                </div>
                <div class="top1">

                </div>
            </li>

        <#--操作记录-->
            <li>
                <div class="top">
                    <strong><input type="checkbox" class="systemPublish-parent" id="mpOps" value="11505" style=" vertical-align:middle" /><label for="mpOps">&nbsp;公共帐号操作记录<label></strong>
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