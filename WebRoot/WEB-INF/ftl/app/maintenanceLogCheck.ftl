 <div class="content">
 <#include "../include/ajaxPager.ftl"/>
  <div class="quanxian">
  <div class="quanxian1">
   <div class="whitea">操作日志</div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="quanxian2">
   <div class="czrz">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
       <tr class="lan">
         <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序列号</strong></td>
         <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>维护者</strong></td>
         <td width="11%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>维护通告</strong></td>
         <td width="10%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>维护原因</strong></td>
         <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>提交时间</strong></td>
       </tr>
       <#if pager.data?size<1>
      		<tr>
	      		<td colspan="5" align="center">无</td>
      		</tr>
      	</#if>
       <#list pager.data as appMaintenanceLog>
       <#if appMaintenanceLog_index%2 = 0>
       <tr>
         <td align="center" class="hui"><p>${appMaintenanceLog_index+1}</p></td>
         <td align="center" class="hui">${maintenanceName}</td>
         <td align="center" class="hui">${appMaintenanceLog.maintenanceNotices}</td>
         <td align="center" class="hui">${appMaintenanceLog.maintenanceReason}</td>
         <td align="center" class="hui">${appMaintenanceLog.maintenanceTime?string("yyyy-MM-dd HH:mm:ss")}</td>
       </tr>
       <#else>
       <tr>
         <td align="center" bgcolor="#f2efef" class="hui"><p>${appMaintenanceLog_index+1}</p></td>
         <td align="center" bgcolor="#f2efef" class="hui">${maintenanceName}</td>
         <td align="center" bgcolor="#f2efef" class="hui">${appMaintenanceLog.maintenanceNotices}</td>
         <td align="center" bgcolor="#f2efef" class="hui">${appMaintenanceLog.maintenanceReason}</td>
         <td align="center" bgcolor="#f2efef" class="hui">${appMaintenanceLog.maintenanceTime?string("yyyy-MM-dd HH:mm:ss")}</td>
       </tr>
       </#if>
       </#list>
     </table>
   </div>
     <#-- 分页栏 -->
	  <@ajaxPageBar pager=pager url="/app/maintenanceLogCheck.action?appId="+appId join="&" elementId="maintenanceLogDiv"></@ajaxPageBar>
  </div>
 </div>
 </div>
