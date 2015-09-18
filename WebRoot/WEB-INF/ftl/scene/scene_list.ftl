<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>网站后台管理系统-帐号管理-用户管理</title>
	<#include "/include/bootstrap.ftl"/>
	<#include "/include/pager.ftl">
	<script src="/js/account.js"></script>
	<script src="/js/jquery.validationEngine.pack.js"></script>
    <script src="/js/jquery.validationEngine-cn.js"></script>
    <link href="/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<script  language="javascript">	
	$(document).ready(function(){
	   $("#saveAccountForm").validationEngine({ ajaxSubmit: true, validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
	});
	function deleteaccount(accountId) {
	    $(".pop_sure").modal().css({
	                'width':'390px',
                    'margin-top': function () {
        			return -($(this).height()/2);
                    },	                
                    'margin-left': function () {
        			return -($(this).width()/2);
                    }
               });
        $(".pop_sure .mar").click(function() {
					location.href="delete.action?accountId="+accountId;
						});
    }	
	</script>
</head>
<body>

<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; 开发者管理 <strong>&gt; 场景管理</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">场景管理</div>
     <div class="query">
     <form action="list.action" method="post">
      <ul>
       <li><span class="classify">场景ID：</span>
         <input name="sSn" type="text"  class="input" value="${sSn!''}"/>
       </li>
       <li><span class="classify">场景名称：</span>
         <input name="sName" type="text"  class="input" value="${sName!''}"/></li>
       <li><a href="javascript:void(0);" onclick="$(this).parents('form').submit();"><img src="/images/erji_06.jpg" /></a></li>
      </ul>
      </form>
     </div>
    </div>
    <div class="form">
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
        <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序列号</strong></td>
        <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>场景名称</strong></td>
        <td width="10%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>场景ID</strong></td>
        <td width="10%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>场景类型</strong></td>
        <td width="10%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>使用者</strong></td>
        <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>创建时间</strong></td>
        <!--<td width="15%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>下属节点</strong></td>-->
        <td width="17%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作</strong></td>
       </tr>
       <#list pager.data as scene>
	       <tr>
	        <td align="center" class="hui"><p>${scene_index+1}</p></td>
	        <td align="center" class="hui">${scene.title}</td>
	        <td align="center" class="hui">${scene.snValue}</td>
	        <td align="center" class="hui"><#if scene.sceneType==1>硬件开发者场景
	        							    <#elseif scene.sceneType==2>应用产品场景
	        							    </#if>
		    </td>
	        <td align="center" class="hui">${(scene.userLoginName)!''}</td>
	        <td align="center" class="hui">${(scene.createTime)?string("yyyy-MM-dd")}</td>
	        <!--<td align="center" class="hui">&nbsp;</td>-->
	        <td align="center" class="hui"><a href="detail.action?sn=${scene.snValue}">查看</a> &nbsp;</td>
	       </tr>
       </#list>
      </table>
     </div>
	 <!--<div class="manu"><span class="disabled"> <  Prev</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">Next  > </a></div>-->
	 <#-- 分页栏 -->
     <@pageBar pager=pager url="/scene/list.action?sName="+sName join="&"></@pageBar>
    </div>
   </div>
   
</body>
</html>