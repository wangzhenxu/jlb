  <div class="title1">报警设置详情</div>
     <div class="query1">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dddddd" style=" border-collapse:collapse;">
         <tr>
           <td width="16%" align="right" class="hui1">报警条件：</td>
           <td width="84%" align="left" valign="middle" class="hui">
           ${conditionStr!""}
           </td>
         </tr>
         <tr>
           <td align="right" class="hui1">报警方式：</td>
           <td align="left" valign="middle" class="hui">
           <#if (actionAlert.actionType)??><#if actionAlert.actionType==2>邮件通知</#if></#if> 
           <#if (actionAlert.actionType)??><#if actionAlert.actionType==1>手机短信</#if></#if> 
           <#if (actionAlert.actionType)??><#if actionAlert.actionType==3>站内信</#if></#if> 
           </td>
         </tr>
         <tr>
           <td align="right" valign="top" class="hui1">报警内容：</td>
           <td align="left" valign="middle" class="hui">温馨提示：${(actionAlert.content)!""}</td>
         </tr>
         </table>
     </div>