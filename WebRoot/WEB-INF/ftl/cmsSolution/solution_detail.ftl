  	
  
  <form action="/cmsSolution/sub/add.action" method="post" id="addForm">
 <div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">CMS发布管理</a> &gt; 系统发布 &gt;<strong> 增加系统</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">系统发布</div>
	</div>
     <div class="query1">
       <table width="100%" border="0" align="left">
         <tr>
           <td colspan="3" class="red">* 号为必填项</td>
           </tr>
         <tr>
           <td width="168" align="right" class="hui1">系统分类：</td>
           <td width="284" align="left" valign="middle">
              ${po.cscName!''}
          </td>
           <td width="615">&nbsp;</td>
         </tr>
         <tr>
           <td align="right" class="hui1"><span class="red">*</span> 系统名称：</td>
           <td align="left" valign="middle">
           		${po.name!''}
           </td>
           <td>&nbsp;</td>
         </tr>
         <tr>
           <td align="right" class="hui1">模块名称：</td>
           <td align="left" valign="middle" class="hui">系统介绍</td>
           <td class="hui">&nbsp;</td>
           <td width="15">&nbsp;</td>
         </tr>
         
         <tr>
           <td align="right" valign="top" class="hui1"><span class="red">*</span> 模块内容：</td>
           <td align="left" valign="middle" class="hui">
           		<textarea  cols="45" rows="5" class="texta1 ckeditor" name="desc"  id="desc" >${po.desc!''}</textarea>
           </td>
           <td class="hui">&nbsp;</td>
           <td width="15">&nbsp;</td>
         </tr>
         <tr>
           <td align="right" class="hui1">模块名称：</td>
           <td align="left" valign="middle" class="hui">系统架构</td>
           <td class="hui">&nbsp;</td>
           <td>&nbsp;</td>
         </tr>
         
         <tr>
           <td align="right" valign="top" class="hui1"><span class="red">*</span> 模块内容：</td>
           <td align="left" valign="middle" class="hui">
           <textarea name="arch" id="arch" cols="45" rows="5" class="texta1 ckeditor" >${po.arch!''}</textarea>
           </td>
           <td class="hui">&nbsp;</td>
           <td>&nbsp;</td>
         </tr>
         <tr>
           <td align="right" class="hui1">模块名称：</td>
           <td align="left" valign="middle" class="hui">系统功能/特点</td>
           <td class="hui">&nbsp;</td>
           <td>&nbsp;</td>
         </tr>
        
         <tr>
           <td align="right" valign="top" class="hui1"><span class="red">*</span> 模块内容：</td>
           <td align="left" valign="middle" class="hui">
           		<textarea name="func" id="func" cols="45" rows="5" class="texta1 ckeditor" >${po.func!''}</textarea></td>
           <td class="hui">&nbsp;</td>
           <td>&nbsp;</td>
         </tr>
          <tr>
           <td align="right" class="hui1">模块名称：</td>
           <td align="left" valign="middle" class="hui">相关产品列表</td>
           <td class="hui"></td>
           <td>&nbsp;</td>
         </tr>
		        <if  po.relationList??>
			         <tr>
			           <td align="right" valign="top" class="hui1">产品名称：</td>
			           <td colspan="2" valign="top">
			            
				            <div class="chanpin" >
				             	<ul>
				             	         <#list po.relationList as cat>
					         				<li>${cat.paName!''}<img  src="/images/overlay-cancel.jpg" style="vertical-align:middle"/> </li>
					         			 </#list>
				             	     
				             	</ul>
				            </div>
			           </td>
			           <td>&nbsp;</td>
			         </tr>
		         </if>
		         
		         <tr>
			           <td align="right" class="hui1">系统链接：</td>
			           <td align="left" valign="middle" class="hui">
			           		<#if po.accessUrl??>
			           		  	<a href="${po.accessUrl!''}" target="_blank">${po.accessUrl!''}</a>
			           		  	<#else>
			           		  	无
			           		</#if>
			           		
			           </td>
			           <td>&nbsp;</td>
         		</tr>
         
         </table>

     </div>
    </div>
    <div class="anniu">
	   <a href="/cmsSolution/sub/list.action"><img   src="/images/gddc_05.jpg"  /></a>
    </div>
   </div>
   </form>
	<script type="text/javascript" src="http://www.loiot.com/c/ckeditor/ckeditor.js"></script>		   
   <script type="text/javascript">
   	    //相关产品列表隐藏判断
	    var ll = $(".chanpin ul li").length;
		if(ll==0){
			$(".chanpin").hide();
		}
   
   </script>
  <script type="text/javascript">
//ckeditor宽高属性设定
	CKEDITOR.replace('desc', {
		height : 200,
		width : 720,
		readOnly :true
	});
		CKEDITOR.replace('arch', {
		height : 200,
		width : 720,
		readOnly :true
	});
		CKEDITOR.replace('func', {
		height : 200,
		width : 720,
		readOnly :true
	});
</script>  