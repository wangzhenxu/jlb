  <div class="form2">
     <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="hui1">
        <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">属性KEY</td>
        <td width="15%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">显示名称</td>
        <td width="14%" height="37" align="center" valign="middle" background="/images/erji_22.jpg">单位</td>
        <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg">符号</td>
        <td width="11%" align="center" valign="middle" background="/images/erji_22.jpg">选择展示</td>
        <td width="16%" align="center" valign="middle" background="/images/erji_22.jpg">展示主属性</td>
        </tr>
       <#if attributes?exists>
       <#list attributes as attribute>
       <tr class="hui">
         <td align="center">${attribute.attrKey!""}</td>
         <td align="center">${attribute.title!""}</td>
         <td align="center">${attribute.unit!""}</td>
         <td align="center">${attribute.symbol!""}</td>
         <td align="center">
        <input type="checkbox" name="checkbox" id="checkbox"  <#if attribute.isShow==1>checked="true"</#if>/>
		</td>
         <td align="center">
         <input type="radio" name="radio5" id="radio5" value="radio5" <#if attribute.isChief=1>checked="true"</#if> />
        </td>
       </tr>
       </#list>
       </#if>
       </table>
     </div>