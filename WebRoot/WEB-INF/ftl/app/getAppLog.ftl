 <div class="czrz">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
       <tr class="lan">
         <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序列号</strong></td>
         <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作者</strong></td>
         <td width="11%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用操作</strong></td>
         <td width="20%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操作时间</strong></td>
         <td width="20%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用状态</strong></td>
          <td width="24%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>备注</strong></td>
       </tr>
       <#list appLogs as appLog>
       <tr>
         <td align="center" class="hui"><p>${appLog.alId}</p></td>
         <td align="center" class="hui">${appLog.operator}</td>
         <td align="center" class="hui">${appLog.action}</td>
         <td align="center" class="hui">${appLog.operateTime?string("yyyy-MM-dd HH:mm:ss")}</td>
         <td align="center" class="hui">${appLog.status}</td>
          <td align="center" class="hui">${appLog.comments!""}</td>
       </tr>
       </#list>
     </table>
   </div>