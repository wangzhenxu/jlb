<form action="/productApp/sub/edit.action" method="post" id="editForm" enctype="multipart/form-data">
<input type="hidden" name="paId" id="paId" value="${po.paId!''}" >
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">产品管理</a> &gt; 产品发布 &gt;<strong> 产品详情</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">产品发布</div>
	</div>
     <div class="query1">
       <table width="100%" border="0">
         <tbody><tr>
           <td class="red" colspan="3">* 号为必填项</td>
           </tr>
         <tr>
           <td width="139" align="right" class="hui1">产品库分类：</td>
           <td width="310" valign="middle" align="left">
         		${po.pacName!''}
           </td>
           <td width="599">&nbsp;</td>
         </tr>
         <tr>
           <td align="right" class="hui1"><span class="red">*</span> 产品名称：</td>
           <td valign="middle" align="left">
           ${po.name!''}
           </td>
           <td>&nbsp;</td>
         </tr>
         
         <tr>
           <td align="right" class="hui1"><span class="red">*</span> 产品价格：</td>
           <td valign="middle" align="left">
           ${po.price!'0'}元
           </td>
           <td>&nbsp;</td>
         </tr>
         
         <tr>
           <td valign="top" align="right" class="hui1"><span class="red">*</span> 产品大图片：</td>
           <td valign="top">
            </div>
           </td>
           <td class="hui" colspan="2"></td>
           </tr>
         <tr>
           <td>&nbsp;</td>
           <td>
             <div class="liulan">
             	<img id="pic_path1" height="200" width="200"  src="${po.bigPic!''}" >
             </div>
             <div class="chicun">200*200</div>
           </td>
           <td>&nbsp;</td>
         </tr>
         <tr>
           <td valign="top" align="right" class="hui1"><span class="red">*</span> 产品小图片：</td>
           <td valign="top">
           </td>
           <td class="hui"></td>
           </tr>
         <tr>
           <td>&nbsp;</td>
           <td>
            <div class="liulan1">
                <img id="pic_path2" height="150" width="150"  src="${po.smallPic!''}" >
            </div>
            <div class="chicun1">150*150</div>
           </td>
           <td>&nbsp;</td>
           </tr>
         <tr>
           <td valign="top" align="right" class="hui1"><span class="red">*</span> 产品资料下载：</td>
           <td valign="top">
           </td>
           <td><span class="hui"></span></td>
         </tr>
         </tbody></table>
     </div>
     <div class="basic">
	 <div class="basic01">栏目添加</div>
	</div>
     <div class="query1">
       <table width="100%" border="0">
         <tbody>
         
         <tr>
           <td width="159" align="right" class="hui1">栏目名称：</td>
           <td width="310" valign="middle" align="left" class="hui">产品介绍</td>
           <td width="599">&nbsp;</td>
         </tr>
         
         <tr>
           <td width="159" valign="top" align="right" class="hui1"><span class="red">*</span> 栏目内容：</td>
           <td valign="top" colspan="2">
           			<textarea  class="input validate[required,length[1000] text-input texta1" rows="10" cols="80" name="recommend" id="recommend">${po.recommend!''}</textarea>
           </td>
         </tr>
         
         <tr>
           <td width="139" align="right" class="hui1">栏目名称：</td>
           <td width="310" valign="middle" align="left" class="hui">产品描述</td>
           <td width="599">&nbsp;</td>
         </tr>
         
         <tr>
           <td valign="top" align="right" class="hui1"><span class="red">*</span> 栏目内容：</td>
           <td valign="top">
           			<textarea  class="input validate[required,length[1000] text-input texta1 ckeditor" rows="5" cols="45" name="PDesc" id="PDesc">${po.PDesc!''}</textarea>
             </td>
           <td></td>
         </tr>
         <tr>
           <td width="139" align="right" class="hui1">栏目名称：</td>
           <td width="310" valign="middle" align="left" class="hui">技术参数</td>
           <td></td>
         </tr>
        
         <tr>
           <td valign="top" align="right" class="hui1"><span class="red">*</span> 栏目内容：</td>
           <td valign="top">
           		<textarea class="input validate[required,length[1000] text-input texta1 ckeditor" rows="5" cols="45" name="techPara" id="techPara">${po.techPara!''}</textarea></td>
           <td></td>
         </tr>
         <tr>
           <td width="139" align="right" class="hui1">栏目名称：</td>
           <td width="310" valign="middle" align="left" class="hui">安装说明</td>
           <td></td>
           </tr>
         
         <tr>
           <td valign="top" align="right" class="hui1"><span class="red">*</span> 栏目内容：</td>
           <td valign="top">
           		<textarea class="input validate[required,length[1000] text-input texta1 ckeditor" rows="5" cols="45" name="install" id="install">${po.install!''}</textarea></td>
           <td></td>
           </tr>
       </tbody></table>
     </div>
    </div>
    <div class="anniu"> <a href="/productApp/sub/list.action"><img  src="/images/gddc_05.jpg"  /></a></div>
   </div>
   </form>
   
 <script type="text/javascript" src="http://www.loiot.com/c/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
//ckeditor宽高属性设定
	CKEDITOR.replace('PDesc', {
		height : 200,
		width : 720,
		readOnly :true
	});
		CKEDITOR.replace('techPara', {
		height : 200,
		width : 720,
		readOnly :true
	});
		CKEDITOR.replace('install', {
		height : 200,
		width : 720,
		readOnly :true
	});
</script>  
