<div class="form2">
     <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="hui1">
        <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">命令组名称</td>
        <td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">命令属性</td>
        <td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><p>控制命令</p></td>
        <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><p>控制字符串</p></td>
        </tr>
        <#if CommandGroups?exists>
        <#list CommandGroups as Commandgroup>
       <tr class="hui">
         <td align="center" rowspan="${Commandgroup.productCommandList?size+1}">${(Commandgroup.title)!""}(key:${(Commandgroup.cmdKey)!""})</td>
         <td align="center" rowspan="${Commandgroup.productCommandList?size+1}">
         <#if Commandgroup.productAttribute?exists>
         ${(Commandgroup.productAttribute.title)!""} 
         &nbsp;${(Commandgroup.productAttribute.unit)!""}
         <#else>
             未设置关联
         </#if>
         </td>
       </tr>
        <#list Commandgroup.productCommandList as Command>
        <tr class="hui">
         <td align="center">${Command.title!""}</td>
         <td align="center">${Command.cmdStr!""}</td>
        </tr>
         </#list>
        </#list>
        </#if>
       </table>
     </div>