

<!-- 
		
	    expandId;  //id
	    accountId;  //账户id
	    auditPositionId;  //评审职位id
	    realName;  //真实姓名
	    nickName;  //昵称
	    iphone;  //手机
	    email;  //邮箱
	    sexId;  //性别id
	    paymentTypeId;  //支付方式
	    paymentCode;  //支付内容
	    inTime;  //录入时间
	    inPerson;  //录入人
	    lastLoginTime;  //最后登录时间
	    idcard;  //身份证
	    isAcceptAudit;  //是否接受评审
	    currMoney;  //当前余额

	
-->

  	<#include "../include/comm_jlb_macro.ftl"/>
<html>
	<head>
	<title>网站后台管理系统-${pageTitle!''}管理</title>
	<@gmc_common_js "select" />
</head>
	<body>
	<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong class="m_title"></strong></div>
    </div>
    <div class="sort">
     <div class="sort1 m_title" ></div>
     <div class="query">
  	
	<form id="queryForm" >
	<ul>
			 <li style="width:22%">
		       	<span class="classify">真实姓名：</span>
		    	<input name="name" type="text"   class="input"  id="name" value=""/>
		      </li>
			     
			       <li style="width:15%">
			       	<span class="classify">评审职位：</span>
			    	<select id="auditPositionId" name="auditPositionId">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  auditPositionId?? && auditPositionId!="" > <#if auditPositionId?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    	</select>
			       </li>
			       <li style="width:15%">
			       	<span class="classify">性别：</span>
			    	<select id="sexId" name="sexId">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.SEX.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  sexId?? && sexId!="" > <#if sexId?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    	</select>
			       </li>
			       <li style="width:30%">
			       	<span class="classify">支付方式：</span>
			    	<select id="paymentTypeId" name="paymentTypeId">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.PAY_TYPE.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  paymentTypeId?? && paymentTypeId!="" > <#if paymentTypeId?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    	</select>
			       </li>
		    <li style="width:5%"><a href="javascript:void(0)">
  		 		<button type="button" class="btn btn-default" id="queryBtn" >查&nbsp;询</button>
       		</li>
      </ul>
      
      	<ul>
      	 	<li style="width:22%" style="visibility: hidden;">
		    </li>
				       <li style="width:15%">
				       	<span class="classify">评审状态：</span>
				    	<select id="isAcceptAudit" name="isAcceptAudit">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.ACCEPT_AUDIT.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  isAcceptAudit?? && isAcceptAudit!="" > <#if isAcceptAudit?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    		  </select>
				       </li>
      	</ul>
  </form>
     </div>
    </div>
    <div class="form">
      <#if subject.isPermitted("zpJlInfo:list")>  <#--accountExpandInfo:add  -->
    		<div class="btn-group">
	      	</div>
     </#if>
     <div class="form2">
    <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
      
        <td style="display:none;" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>账户</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>账户名</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>真实姓名</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>昵称</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>手机</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>邮箱</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>性别</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>评审职位</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>支付方式</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>支付号码</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>录入时间</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>身份证</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>是否接受评审</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>当前余额</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
        <#list pager.data as c>
       <tr>
       
	 	  <td align="center" class="hui" style="display:none;">
	 	  <#if c.accountId??>
	 	       ${DictionaryUtil.getName(c.accountId)} 
	 	  </#if>
	 	   </td>
	 	  <td align="center" class="hui">
	 	       ${c.inPersonName!''} 
	 	   </td>
		  <td align="center" class="hui">${c.realName!''}</td>
		  <td align="center" class="hui">${c.nickName!''}</td>
		  <td align="center" class="hui">${c.iphone!''}</td>
		  <td align="center" class="hui">${c.email!''}</td>
	 	  <td align="center" class="hui">
	 	  <#if c.sexId??>
	 	       ${DictionaryUtil.getName(c.sexId)} 
	 	  </#if>
	 	   </td>
	 	    <td align="center" class="hui">
	 	  <#if c.auditPositionId??>
	 	       ${DictionaryUtil.getName(c.auditPositionId)} 
	 	  </#if>
	 	   </td>
	 	  <td align="center" class="hui">
	 	  <#if c.paymentTypeId??>
	 	       ${DictionaryUtil.getName(c.paymentTypeId)} 
	 	  </#if>
	 	   </td>
		  <td align="center" class="hui">${c.paymentCode!''}</td>
		 <td align="center" class="hui">
    			 <#if c.inTime??>
	        	 	 ${c.inTime?string("yyyy-MM-dd")}
	 		 	 </#if>
	 	 </td>
	 	 
		 
		  <td align="center" class="hui">${c.idcard!''}</td>
	 	  <td align="center" class="hui">
	 	  <#if c.isAcceptAudit??>
	 	       ${DictionaryUtil.getName(c.isAcceptAudit)} 
	 	  </#if>
	 	   </td>
		  <td align="center" class="hui">${c.currMoney!"0"}元</td>
        
		 <td align="center" class="hui" style="width:300px;"  >
	       		<div class="btn-group">
      			<#if subject.isPermitted("accountExpandInfo:detail")>   <#--  -->
				  <button type="button" class="btn btn-default"  onclick="accountExpandInfo.toDetail('${c.expandId}')">详情</button>
				 </#if>
				 
      			<#if subject.isPermitted("accountExpandInfo:editAll")>  <#--  -->
				  <button type="button" class="btn btn-default"  onclick="accountExpandInfo.toEdit('${c.expandId}')">修改</button>
				 </#if>
				 
	      		</div>
        </td>
       </tr>
       </#list>
       <tr>
     	 <td colspan="10" valign="middle" class="d">
     	 
      			<#if subject.isPermitted("zpJlInfo:list")>  <#--accountExpandInfo:delete  -->
     	 	 <div class="btn-group" style="display:none;">
			   <button type="button" class="btn btn-default"  onclick="javascipt:void(0);">删除</button>
      	 	 </div>
				</#if>
     	 	
     	 </td>
       </tr>
      </table>
     </div>
     <@pageBar   pager=pager url="/accountExpandInfo/list.action?jsonParam=${jsonParam!''}" join="&"> </@pageBar> 
    
    </div>
   </div>
  <!-- 弹窗 结束 -->
	<#include "../include/deleteConfirmModal.ftl">
    <script src="/js/tgAccountExpandInfo.js"></script>
    <script>
		accountExpandInfo.initPage();
	    common.initLeftMenuSelected("accountExpandInfo_list_all");
	     $("#accountExpandInfo_list").removeClass("MenuLevel5");
	</script>
</html>



