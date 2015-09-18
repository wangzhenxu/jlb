<div class="query1" id="query1">
       <!--<table width="100%" border="0">
         <tr>
           <td width="50%" valign="top"><table width="100%" border="1">
             <tr>
               <td width="18%" align="right" class="hui1">产品ID：</td>
               <td width="27%" align="left" valign="middle" class="hui">123456</td>
               <td width="26%" align="right" class="hui1">产品名称：</td>
               <td width="29%" align="left" valign="middle" class="hui">智能控制器</td>
             </tr>
             <tr>
               <td align="right" class="hui1">提供商：</td>
               <td colspan="3" align="left" valign="middle" class="hui">北京时代凌宇科技有限公司</td>
             </tr>
             <tr>
               <td align="right" class="hui1">产品KEY：</td>
               <td align="left" valign="middle"><span class="hui"> 无</span></td>
               <td align="right" class="hui1">产品类型：</td>
               <td align="left" valign="middle" class="hui">智能家居</td>
             </tr>
             <tr>
               <td align="right" valign="top" class="hui1">产品描述：</td>
               <td align="left" valign="top" class="hui">温度 湿度 </td>
               <td align="right" valign="top" class="hui1">标签TAGS：</td>
               <td align="left" valign="top" class="hui">&nbsp;</td>
             </tr>
           </table></td>
           <td width="50%" valign="top"><table width="100%" border="0">
             <tr>
               <td align="right" class="hui1">系统图片：</td>
               <td align="left" valign="middle"><input type="radio" name="radio" id="radio" value="radio"  style=" vertical-align:middle"/>
                 <span class="hui"> 版本1</span></td>
             </tr>
             <tr>
               <td align="right">&nbsp;</td>
               <td align="left" valign="middle"><div class="kuang"></div></td>
             </tr>
             </table></td>
         </tr>
       </table>-->
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dddddd" style=" border-collapse:collapse;">
       <tr>
         <td width="16%" align="right" class="hui1">产品ID：<input name="product.productId" type="hidden"  class="input" value="${productinfo.productId}"/></td>
         <td width="84%" align="left" valign="middle" class="hui">${productinfo.snPrefix!""}</td>
         </tr>
       <tr>
         <td align="right" class="hui1">产品分类：</td>
         <td align="left" valign="middle" class="hui">${productinfo.productClazz.name!""}</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">产品名称：</td>
         <td align="left" valign="middle" class="hui">${productinfo.name!""}</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">产品类型：</td>
         <td align="left" valign="middle" class="hui">${productType.get(productinfo.productType).getTitle()}</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1"> 提供商：</td>
         <td align="left" valign="middle" class="hui"><p>${productinfo.customerName!""}</p></td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">产品描述：</td>
         <td align="left" valign="middle" class="hui">${productinfo.description!""}</td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">标签TAGS：</td>
         <td align="left" valign="middle" class="hui"><#list productinfo.tagList as tag>${tag.tagWord!""}<#if tag_has_next>,</#if></#list></td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">系统图片：</td>
         <td valign="top" class="hui">
           <div class="kuang"><img src="${ApplicationConst.PRODUCT_PIC_URL}${productinfo.picUrl!""}"  width="150px" height="150px"/></div>
         </td>
         </tr>
       <tr>
         <td align="right" valign="top" class="hui1">共享设置：</td>
         <td valign="top" class="hui">不公开</td>
       </tr>
       </table>
     </div>