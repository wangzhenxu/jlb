
<html>
	<head>
	<title>网站后台管理系统-产品分类</title>
	<#include "../include/bootstrap.ftl"/>
	<#include "../include/pager.ftl">
	<script src="/js/source/jquery.validationEngine.js"></script>
	<script src="/js/source/jquery.validationEngine.min.js"></script>
	<link href="/js/source/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <script src="/js/hiAlert/jquery.alert.js"></script>
    <script type="text/javascript" src="http://www.loiot.com/c/ckeditor/ckeditor.js"></script>			
    <script src="/js/zpJlInfo.js"></script>
	<link href="/css/alert.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		body {
			background-image: url(/images/erji_22.jpg);
			background-repeat: repeat-x;
			}
	</style>
<script  language="javascript">
jQuery(document).ready(function(){
	jQuery("#addform,#updateform,#sendform").validationEngine({scroll:false});
	$('#xin1').on('hidden.bs.modal', function (e) {
		$("#addform").validationEngine("hide");
	});
	$('#xin2').on('hidden.bs.modal', function (e) {
		$("#updateform").validationEngine("hide");
	})
	
	$('#xin4').on('hidden.bs.modal', function (e) {
		$("#sendform").validationEngine("hide");
	})
	
	
});

</script>
</head>
	<body>
	<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong>hrQQ</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">产品分类</div>
     <div class="query">
      <ul>
       <li style="width:20%">
       	<span class="classify">邮箱：</span>
    	<input name="name" type="text"  class="input"  id="name" value="${qqNumber!}"/>
       </li>
       
       <li style="width:20%">
       	<span class="classify">姓名：</span>
    	<input name="q_qqName" type="text"  class="input"  id="q_qqName" value="${qqName!}"/>
       </li>
       
        <li style="width:20%">
       	<span class="classify">发送状态：</span>
    	<select id="sendStatus">
    		<option value="">全部</option>
    		<option value="0" <#if sendStatus??> <#if sendStatus=="0"> selected </#if> </#if> >未发送</option>
    		<option value="1" <#if sendStatus??> <#if sendStatus=="1"> selected </#if> </#if>>已成功发送</option>
    		<option value="2" <#if sendStatus??> <#if sendStatus=="2"> selected </#if> </#if>>发送失败</option>
    	</select>
       </li>
       <li style="width:20%"><a href="javascript:void(0)"><img src="/images/erji_06.jpg" width="64" height="26" onclick="query();"/></a></li>
      </ul>
     </div>
    </div>
    <div class="form">
      <#if subject.isPermitted("productClass:add")>
     	<div class="form1"><a href="javascript:void(0)"><img src="/images/erji_18.jpg" width="83" height="22" border="0"  name="addpro"  onclick="toadd();"/></a></div>
     </#if>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg">
			<input type="checkbox" style="vertical-align:middle " onclick="if(this.checked){$('.check').attr('checked',true)}else $('.check').attr('checked',false)  ">
		</td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>姓名</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>手机</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>邮箱</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>职位</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>级别</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>薪水要求</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>年龄</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>性别</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>最高学历</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>录入时间</strong></td>
        <td  height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
       <#list pager.data as c>
       <tr>
       <td align="center" class="hui"><input type="checkbox" name="checkbox" value="${c.hrId!''}" class="check"></td>
        <td align="center" class="hui">${c.name!''}</td>
        <td align="center" class="hui">${c.phone!''}</td>
        <td align="center" class="hui">
        	 ${emal!''}
        </td>
        <td align="center" class="hui">
        <#if c.jobPositionId??>
        	${DictionaryUtil.getName(c.jobPositionId)}
        </#if>
       </td>
        <td align="center" class="hui">
	    	 <#if c.jobPositionLevelId??>
	    		${DictionaryUtil.getName(c.jobPositionLevelId)}
	    	 </#if>
	    </td>
	    <td align="center" class="hui">
	    	 <#if c.salaryRequireId??>
	    		${DictionaryUtil.getName(c.salaryRequireId)}
	    	 </#if>
	    </td>
	    <td align="center" class="hui">
	    	${c.age!''}
	    </td>
	    <td align="center" class="hui">
	    	 <#if c.sex??>
	    		${DictionaryUtil.getName(c.sex)}
	    	 </#if>
	    </td>
	     <td align="center" class="hui">
	    	 <#if c.educationId??>
	    		${DictionaryUtil.getName(c.educationId)}
	    	 </#if>
	    </td>
	    
	    <td align="center" class="hui">
	    	     <#if c.inTime??>
        			 ${c.inTime?string("yyyy-MM-dd HH:mm:ss")}
 				</#if>
	    </td>
	
	    
       </tr>
       </#list>
       <tr>
     	 <td colspan="7" valign="middle" class="d">
     	 	<a href="javascript:emalModal.openTemplateModal();" class=""><img src="/images/del.jpg" width="74" height="26">
     	 	</a>
     	 </td>
       </tr>
      </table>
     </div>
	 <#-- 分页栏 -->
     <@pageBar pager=pager url="/zpHrInfo/list.action" join="&"></@pageBar>
    </div>
   </div>
  <!-- 弹窗 结束 -->
  <#include "../include/deleteConfirmModal.ftl">


</html>