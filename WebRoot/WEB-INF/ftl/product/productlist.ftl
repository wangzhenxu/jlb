<html>
<head>
<title>产品列表</title>
<#include "../include/bootstrap.ftl"/>
<#include "../include/pager.ftl">
<style type="text/css">
body {
	background-image: url(/images/erji_22.jpg);
	background-repeat: repeat-x;
}
</style>
<script  language="javascript">
function proquery(){	
var pname=$("#pname").attr("value");
location.href="/product/management/list.action?name="+pname;
}

function deleteclass(pcid) {
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
					location.href="/product/management/delete.action?productId="+pcid;
						});
}
</script>
</head>
<body>
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong>产品管理</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">产品管理</div>
     <div class="query">
      <ul>
       <li><span class="classify">产品名称：</span>
         <input name="pname" type="text"  class="input" id="pname"  value="${name}"/></li>
       <li><a href="javascript:void(0)"><img src="/images/erji_06.jpg" width="64" height="26" onclick="proquery();"/></a></li>
      </ul>
     </div>
    </div>
    <div class="form">
	<#if subject.isPermitted("product:add")>
     <div class="form1">
       <a href="/product/management/toAddNKeyPro.action?key=1"><img src="/images/ykey.jpg" border="0" /></a> <a href="/product/management/toAddNKeyPro.action?key=0"><img src="/images/wkey.jpg" border="0" /></a>
     </div>
     </#if>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
        <td width="16%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品ID</strong></td>
        <td width="18%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品名称</strong></td>
        <td width="17%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>提供商</strong></td>
        <td width="15%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品分类</strong></td>
        <td width="15%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>上架时间</strong></td>
        <td width="19%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
      </tr>
      <#list productlist as product>
       <tr>
        <td align="center" class="hui">${product.snPrefix}</td>
        <td align="center" class="hui">${product.name!""}</td>
        <td align="center" class="hui">${product.customerName!""}</td>
        <td align="center" class="hui">${product.productClazz.name!""}</td>
        <td align="center" class="hui">${product.uploadTime?string("yyyy-MM-dd HH:mm:ss")}</td>
        <td align="center" class="hui">
        	<a href="/product/management/check.action?productId=${product.productId}">查看</a> &nbsp;&nbsp;
        	<#if subject.isPermitted("product:edit")>
        		<a href="/product/management/toupdate.action?productId=${product.productId}">修改</a> &nbsp;&nbsp;
        	</#if>
        	<#if subject.isPermitted("product:delete")>
        		<a href="javascript:deleteclass(${product.productId});">删除</a>
        	</#if>
        </td>
       </tr>
       </#list>
      </table>
     </div>
      <#-- 分页栏 -->
	  <@pageBar pager=pager url="/product/management/list.action?name="+name join="&"></@pageBar>
    </div>
   </div>
  <!-- 弹窗 开始 -->
<div class="pop_sure modal hide fade">
  <div class="title0">确认框<a class="x" href="javascript:void(0)"  data-dismiss="modal"></a></div>
  <div class="text0">你确定删除吗？</div>
  <div class="w100">
    <ul class="r50">
      <li><a class="button mar" href="javascript:void(0)" value=false><span>确定</span></a><a class="button" 

href="javascript:void(0)"  data-dismiss="modal"><span>取消</span></a></li>
    </ul>
</div>
<!-- 弹窗 结束 -->


</body>
</html>
