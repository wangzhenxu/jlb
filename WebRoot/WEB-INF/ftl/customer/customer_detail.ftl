<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; 帐号管理 &gt; <strong>客户账号</strong></div>
    </div>
    <div class="form">
       <table class="table_style02">
        <tr>
         <td width="28%" align="right" valign="middle" class="hui1">管理客户登录名称：</td>
         <td width="72%" class="hui">${c.customerName!''}</td>
         </tr>
	    <tr>
         <td align="right" valign="middle" class="hui1">客户名称：</td>
         <td class="hui">${c.caName!''}</td>
         </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">联系人：</td>
	      <td valign="middle" class="hui">${c.contacts!'无'}</td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">电话：</td>
	      <td class="hui"><p>${c.customerTel!'无'}</p></td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">邮箱
	        ：</td>
	      <td valign="middle" class="hui"><p>${c.cusomerEmail!'无'}</p></td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">备注：</td>
	      <td class="hui">${c.remarks!'无'}</td>
	      </tr>
	    <tr>
	      <td align="right" valign="middle" class="hui1">创建时间：</td>
	      <td class="hui"><p>${c.createTime?string("yyyy-MM-dd HH:mm:ss")}</p></td>
	      </tr>
       </table>
    </div>
    <div class="anniu">
     <#if subject.isPermitted("customer:edit")>
    	<a href="toEditCustomer.action?customerId=${c.customerId}" ><img src="/images/bianji1.jpg"  /></a>
    </#if>
    
    &nbsp;<a href="list.action" ><img src="/images/gddc_05.jpg" /></a></div>
   </div>