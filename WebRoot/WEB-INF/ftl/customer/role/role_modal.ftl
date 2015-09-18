 <link href="/css/shiro.css" rel="stylesheet" type="text/css" />
 <div class="modal hide fade quanxian" id="roleModal">
 	<form id="saveRoleForm" action="/customer/account/role/save.action" method="post">
 	<input type="hidden" name="roleId" value=""/>
 	<div id="permissionList"></div>
 	
 	 <div class="quanxian">
  <div class="quanxian1">
   <div class="whitea" id="roleModalTitle" >添加客户角色</div>
   <div class="close" ><img  src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="quanxian2">
   <div class="caidan1">
     <table width="100%" border="0">
      <tr>
        <td width="11%" align="right" class="hui1"><span class="red">*</span> 角色名称：</td>
        <td width="89%" align="left" valign="middle">
         <input name="roleName" id="rolename" type="text" class="input" validate="validate[required]"/><span style="color:red;padding-left:5px;" id="roleNameTip"></span>
          
        </td>
      </tr>
      <tr>
        <td align="right" class="hui1"><span class="red">*</span> 选择项目：</td>
        <td align="left" valign="middle">
          <select name="projectId" id="projectId" class="input">
          	 <#list plist as p>
          	    <#if  p_index==1>
           			<option value='${p.projectId}' checked> ${p.name} </option>
           			 <#else>
           			 <option value='${p.projectId}'> ${p.name} </option>
           	 	</#if>
           	 </#list>
          </select></td>
      </tr>
      </table>
    </div>
    <div class="quanxian3">
     <div class="limitsShiro">权限划分：<span id="permissionListTip" style="color:red;padding-left:5px;"></span></div>
     <div class="limitsShiro1" style="height:450px;">
      <div class="cpgl1">
       <ul>
       
       <li>
         <fieldset>
           <legend><input type="checkbox" value="60" level="one"  name="checkbox" id="checkbox" style=" vertical-align:middle" /> 
          <strong>首页</strong></legend>
         </fieldset>
        </li>
       
       <!-- 产品管理 start -->
        <li>
          <fieldset>
           <legend><input  type="checkbox"  value="1" level="one" name="checkbox" id="checkbox" style="vertical-align:middle;display:none;" /> 
          <strong>产品管理</strong></legend>
          
          <div class="cpgl2">
          
           <div class="top2">
            <input type="checkbox" value="2" level="two" name="checkbox" id="checkbox" style=" vertical-align:middle" /> 
            <strong>产品配置</strong>
           </div>
           
           <div class="top3">
            <input type="checkbox" value="3" level="three" name="checkbox2" id="checkbox2" style=" vertical-align:middle" />
				增加网关级产品&nbsp;
				<input type="checkbox" value="4" level="three" name="checkbox2" id="checkbox2" style=" vertical-align:middle" />
				增加节点级产品&nbsp;
				<input type="checkbox" value="5" level="three" name="checkbox2" id="checkbox2" style=" vertical-align:middle" />
				产品修改&nbsp;<br />
				<input type="checkbox" value="6" level="three" name="checkbox2" id="checkbox2" style=" vertical-align:middle" />
				产品查询 
				<input type="checkbox" value="8" level="three" name="checkbox10" id="checkbox11" style=" vertical-align:middle" />
				产品删除</div>
          </div>
          
          
          <div class="cpgl4">
           <div class="top2">
            <input type="checkbox" level="two" value="9" name="checkbox" id="checkbox" style=" vertical-align:middle" /> 
            <strong>序列号管理</strong>
           </div>
           <div class="top3">
                <input type="checkbox"  value="10" level="three" name="checkbox2" id="checkbox2" style=" vertical-align:middle" />
				生成序列号&nbsp;
				<input type="checkbox" value="11" level="three" name="checkbox2" id="checkbox2" style=" vertical-align:middle" />
				下载序列号&nbsp;
				<br>
				<input type="checkbox" value="64" level="three" name="checkbox2" id="checkbox2" style=" vertical-align:middle" />
				导入序列号&nbsp;
				 <input type="checkbox"  value="63" level="three" name="checkbox2" id="checkbox2" style=" vertical-align:middle" />
				删除序列号&nbsp;
				
				</div>
          </div>
         </fieldset>
        </li>
         <!-- 产品管理 end -->
        
        
         <!-- 微服务 start -->
          <li>
         <fieldset>
           <legend><input type="checkbox" value="12" level="one" name="checkbox" id="checkbox" style=" vertical-align:middle;display:none;" /> 
          <strong>微服务</strong></legend>
          <div class="cpgl3">
           <div class="top2">
            <input type="checkbox" value="17" level="two" name="checkbox"  id="checkbox" style=" vertical-align:middle" /> 
            <strong>公众帐号管理</strong>
           </div>
           <div class="top3">
            <input type="checkbox" value="25"  level="three" name="checkbox" id="checkbox" style=" vertical-align:middle" /> 
        	  新增帐号&nbsp; 
           <input type="checkbox" value="26" level="three" name="checkbox" id="checkbox" style=" vertical-align:middle" /> 
         	 修改帐号         
          <input type="checkbox" value="28" level="three" name="checkbox3" id="checkbox3" style=" vertical-align:middle" />
			查看帐号&nbsp;
			<input type="checkbox" value="27" level="three" name="checkbox3" id="checkbox3" style=" vertical-align:middle" />
			删除帐号<br />
			<input type="checkbox" value="29" level="three" name="checkbox4" id="checkbox4" style=" vertical-align:middle" />
			停用/启用帐号&nbsp;
			<input type="checkbox" value="31" level="three" name="checkbox4" id="checkbox5" style=" vertical-align:middle" />
			查看授权记录 
			<input type="checkbox" value="30" level="three" name="checkbox4" id="checkbox4" style=" vertical-align:middle" />
			完善信息
			</div>
         </div>
          <div class="cpgl4">
          <div class="top">
          <input type="checkbox" level="two" value="18" name="gzsd" id="checkbox" style=" vertical-align:middle" /> 
          <strong>规则设定</strong>
         </div>
          <div class="top1">
          <strong>
          <input type="checkbox" value="32" level="three" name="gzsd" id="checkbox12" style=" vertical-align:middle" />
		          产品规则</strong></div>
		          <div class="top3">
		          <input type="checkbox" value="37" level="four" name="gzsd" id="checkbox" style=" vertical-align:middle" /> 
		        	  新增产品规则
           <input type="checkbox" value="38" level="four" name="gzsd" id="checkbox7" style=" vertical-align:middle" />
					查看/修改产品规则 
			         <br />
			<input type="checkbox" value="50" level="four" name="gzsd" id="checkbox8" style=" vertical-align:middle" />
					删除产品规则
			<input type="checkbox" value="61" level="four" name="gzsd" id="checkbox9" style=" vertical-align:middle;" />
					上线产品规则 </div>    
         <div class="top1">
          <strong>
          <input type="checkbox" value="20" level="three" name="gzsd" id="checkbox13" style=" vertical-align:middle" />
			         			 被关注回复规则</strong></div>
			          <div class="top3">
			          <input type="checkbox" value="62" level="four" name="gzsd" id="checkbox" style=" vertical-align:middle" /> 
			         			添加/修改被关注 回复规则
			         </div>
			         <div class="top1">
			          <strong>
			          <input type="checkbox" value="21" level="three" name="gzsd" id="checkbox14" style=" vertical-align:middle" />
			          		关键字规则</strong></div>
			          <div class="top3">
			           <input type="checkbox" value="39" level="four" name="gzsd" id="checkbox" style=" vertical-align:middle" /> 
			          	添加关键字规则
			          <input type="checkbox" value="40" level="four" name="gzsd" id="checkbox" style=" vertical-align:middle" /> 
			       		   修改关键字规则<br />
          			 <input type="checkbox" value="41" level="four" name="gzsd" id="checkbox7" style=" vertical-align:middle" />
						查看关键字规则
					<input type="checkbox" value="42" level="four" name="gzsd" id="checkbox8" style=" vertical-align:middle" />
						删除关键字规则</div>
				         <div class="top1">
				          <strong>
				          <input type="checkbox" value="23" level="three" name="gzsd" id="checkbox15" style=" vertical-align:middle" />
				          	图文信息管理</strong></div>
				          <div class="top3">
				          <input type="checkbox" value="43" level="four" name="gzsd" id="checkbox" style=" vertical-align:middle" /> 
				         	 新增图文信息
				          <input type="checkbox" value="44" level="four" name="gzsd" id="checkbox7" style=" vertical-align:middle" />
							修改图文信息
							<input type="checkbox" value="45" level="four" name="gzsd" id="checkbox8" style=" vertical-align:middle" />
							删除图文信息<br />
         </div>
        </div>
          <div class="cpgl3">
         <div class="top2">
          <input type="checkbox" value="19" level="two" name="checkbox" id="checkbox" style=" vertical-align:middle" /> 
          <strong>操作记录</strong>
         </div>
         <div class="top4">
         </div>
        </div>
          <div class="cpgl2">
           <div class="top2">
            <input type="checkbox" level="two"  name="checkbox" id="checkbox" style=" vertical-align:middle" />
           <strong>
            <span class='qxTitle' style='border:2px solid red;'>自定义菜单设置</span>
           </strong>
           </div>
           <div class="top3">
            <input type="checkbox" level="three"  name="checkbox" id="checkbox" style=" vertical-align:middle" />
          启用菜单
            <input type="checkbox" level="three"  name="checkbox" id="checkbox" style=" vertical-align:middle" />
          停用菜单
            <input type="checkbox" level="three"  name="checkbox" id="checkbox" style=" vertical-align:middle" />
           发布菜单
            <input type="checkbox" level="three"  name="checkbox" id="checkbox" style=" vertical-align:middle" />
          新增菜单
            <input type="checkbox" level="three" name="checkbox" id="checkbox" style=" vertical-align:middle" />
          预览菜单</div>
        </div>
         </fieldset>
        </li>
     <!-- 微服务 end -->   
     
     <!-- 用户管理 start -->   
	     <li>
	         <fieldset>
	           <legend><input  type="checkbox" value="13" level="one" name="checkbox" id="checkbox" style=" vertical-align:middle;display:none;" /> 
	          <strong>用户管理</strong></legend>
	         <div class="top2">
	          <input type="checkbox" value="15" level="two" name="checkbox" id="checkbox" style=" vertical-align:middle" /> 
	          <strong>用户信息</strong>
	         </div>
	         <div class="top3">
	          <input type="checkbox" value="16" level="three" name="checkbox" id="checkbox" style=" vertical-align:middle" />
	         	 查看用户信息</div>
	         </fieldset>
	      </li>
    <!-- 用户管理 end -->    
    
    
    <!-- 餐饮管理 start -->    
    	<li>
         <fieldset>
           <legend><input type="checkbox" value="33" level="one" name="checkbox" id="checkbox" style=" vertical-align:middle;display:none;" /> 
          <strong>餐饮管理</strong></legend>
          <div class="cpgl3">
           <div class="top2">
            <input type="checkbox" value="52" level="two" name="checkbox" id="checkbox" style=" vertical-align:middle" /> 
           <strong>坐席类型管理</strong>
          </div>
           <div class="top3">
          <input type="checkbox" value="53" level="three" name="checkbox" id="checkbox" style=" vertical-align:middle" />
	        	  新增坐席类型
	          <input type="checkbox" value="54" level="three" name="checkbox5" id="checkbox6" style=" vertical-align:middle" />
				删除坐席类型
	         <input type="checkbox" value="55" level="three" name="checkbox5" id="checkbox6" style=" vertical-align:middle" />
				移动坐席类型
	          </div>
	          </div>
	          
	          <div class="cpgl5">
           <div class="top2">
            <input type="checkbox" value="56" level="two" name="checkbox" id="checkbox" style=" vertical-align:middle" /> 
            <strong>排队管理页(大屏播报)</strong>
           </div>
           <div class="top4" >
           </div>
        </div>
          <div class="cpgl3">
	           <div class="top2">
	            <input type="checkbox" value="57" level="two"  style="vertical-align:middle" /> 
	            <strong>排队管理页(本页播报)</strong>
	           </div>
	           <div class="top4">
	           		
	           </div>
          </div>
          <div class="cpgl4">
           <div class="top2">
          <input type="checkbox" value="51"  level="two" name="checkbox" id="checkbox" style=" vertical-align:middle" /> 
          <strong>商家信息</strong>
         </div>
         <div class="top3">
          <input type="checkbox" value="46"  level="three" name="checkbox" id="checkbox" style=" vertical-align:middle" />
          		新增分店
          <input type="checkbox" value="47" level="three" name="checkbox5" id="checkbox6" style=" vertical-align:middle" />
				查看分店
         <input type="checkbox" value="48" level="three" name="checkbox5" id="checkbox6" style=" vertical-align:middle" />
				修改分店<br />
		<input type="checkbox" value="49" level="three" name="checkbox" id="checkbox" style=" vertical-align:middle" />
   			       删除分店
          <input type="checkbox" value="36" level="three" name="checkbox5" id="checkbox6" style=" vertical-align:middle" />
			       查看单店商家信息 
         </div>
        </div>
          <div class="cpgl2">
	           <div class="top2">
	            <input type="checkbox" value="58" level="two" name="checkbox" id="checkbox" style=" vertical-align:middle" /> 
	            <strong> 排队管理页(取号)</strong>
	           </div>
	           <div class="top4">
		            
	            </div>
           </div>
           
           <div class="cpgl4">
           <div class="top2">
            <input type="checkbox"  value="59" level="two" style=" vertical-align:middle" id="checkbox" name="checkbox"> 
             <strong>大屏展示</strong>
            </div>
            <div class="top4"></div>
           </div>
          
           
         </fieldset>
        </li>
        <!-- 餐饮管理 end -->    
        
        
       </ul>
      </div>
     </div>
     </div>
    </div>
   </div>
   <div class="caidan2"><a href="javascript:saveRole();" id="btnOkModal"><img src="/images/bjwj03.jpg" width="62" height="23" /></a>&nbsp; <a href="#"><img data-dismiss="modal" src="/images/bjwj_05.jpg" width="62" height="23" /></a></div>
  </div>
   </form>
 </div>