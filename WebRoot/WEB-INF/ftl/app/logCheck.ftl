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
         <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作者</strong></td>
         <td width="11%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用操作</strong></td>
         <td width="10%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>时间</strong></td>
         <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用状态</strong></td>
         <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>备注</strong></td>
       </tr>
       <#list pager.data as appLog>
       <tr>
       <#if appLog_index%2=0>
         <td align="center" class="hui"><p>${appLog_index+1}</p></td>
         <td align="center" class="hui">${appLog.operator}</td>
         <td align="center" class="hui">${appLog.action?default('空')}</td>
         <td align="center" class="hui">${appLog.operateTime?string("yyyy-MM-dd HH:mm:ss")}</td>
         <td align="center" class="hui">${appLog.status}</td>
         <td align="center" class="hui">${appLog.comments?default('')}</td>
       <#else>
         <td align="center" bgcolor="#f2efef" class="hui"><p>${appLog_index+1}</p></td>
         <td align="center" bgcolor="#f2efef" class="hui">${appLog.operator}</td>
         <td align="center" bgcolor="#f2efef" class="hui">${appLog.action?default('空')}</td>
         <td align="center" bgcolor="#f2efef" class="hui">${appLog.operateTime?string("yyyy-MM-dd HH:mm:ss")}</td>
         <td align="center" bgcolor="#f2efef" class="hui">${appLog.status}</td>
         <td align="center" bgcolor="#f2efef" class="hui">${appLog.comments?default('')}</td>
       </#if>
       </tr>
       </#list>
     </table>
   </div>
     	<#-- 分页栏 -->
	  <@ajaxPageBar pager=pager url="/app/logCheck.action?appId="+appId join="&" elementId="logDiv"></@ajaxPageBar>
  </div>
 </div>
 </div>
