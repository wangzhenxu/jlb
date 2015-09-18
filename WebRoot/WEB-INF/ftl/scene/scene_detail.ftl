<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">开发者管理</a> &gt; <strong>场景管理 </strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">基本信息</div>
	</div>
     <div class="ckxt">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#e8e8e8" style=" border-collapse:collapse;">
         <tr>
           <td width="10%" align="right" class="hui1">场景ID：</td>
           <td width="90%" class="hui">${scene.snValue}</td>
         </tr>
         <tr>
           <td align="right" class="hui1">场景名称：</td>
           <td class="hui">${scene.title}</td>
         </tr>
         <tr>
           <td align="right" class="hui1">场景类型：</td>
           <td class="hui"><#switch scene.sceneType>
		           				<#case "1">硬件开发者场景<#break>
		           				<#case "2">应用产品场景<#break>
		           		   </#switch></td>
         </tr>
         <tr>
           <td align="right" class="hui1">使用者：</td>
           <td class="hui">${scene.userLoginName}</td>
         </tr>
         <tr>
           <td align="right" class="hui1">创建时间：</td>
           <td class="hui">${(scene.createTime)?string("yyyy-MM-dd")}</td>
         </tr>
         <tr>
           <td align="right" class="hui1">下属节点：</td>
           <td class="hui">${(scene.nodes)?size}个</td>
         </tr>
         <tr>
           <td align="right" class="hui1">场景描述：</td>
           <td class="hui">${(scene.description)!""}</td>
         </tr>
         <tr>
           <td align="right" class="hui1">标签TAGS：</td>
           <td class="hui"><#list scene.tags as tag>${(tag.tagWord)!""}<#if tag_has_next>,</#if></#list></td>
         </tr>
       </table>
     </div>
     <div class="basic">
	 <div class="basic01">产品详情</div>
	</div>
	 <div class="xuxian">
	   <div class="nature">
	     <div class="form2">
	       <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
	         <tr class="lan">
	           <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品分类</strong></td>
	           <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>产品名称</strong></td>
	           <td width="10%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>实际名称</strong></td>
	           <td width="10%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>主属性</strong></td>
	           <td width="10%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>当前值</strong></td>
	           <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>单位</strong></td>
	           <td width="15%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>当前状态</strong></td>
	           <td width="17%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>其他属性</strong></td>
	           </tr>
	         <#list spdList as spdObj>
		         <tr>
		           <td align="center" class="hui"><p><#switch spdObj.ptype>
		           										<#case "0">用户组装<#break>
		           										<#case "1">网关<#break>
		           										<#case "2">中间件<#break>
		           										<#case "3">节点<#break>
		           									 </#switch></p></td>
		           <td align="center" class="hui">${spdObj.pname}</td>
		           <td align="center" class="hui">${spdObj.stitle}</td>
		           <td align="center" class="hui">${spdObj.chiefAttr}</td>
		           <td align="center" class="hui">${spdObj.currentVal}</td>
		           <td align="center" class="hui">${spdObj.unit}</td>
		           <td align="center" class="hui">${spdObj.currentState}</td>
		           <td align="center" class="hui"><a href="javascript:void(0);" otherAttr="${spdObj.otherAttr}">查看</a> &nbsp;</td>
		          </tr>
	          </#list>
	         </table>
	     </div>
      </div>
	 </div>
    </div>
   </div>
   
   <!--其他属性展示  begin-->
   <div class="quanxian modal hide fade" style="display:none">
  <div class="quanxian1">
   <div class="whitea">其他属性</div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18"/ data-dismiss="modal"></div>
  </div>
  <div class="quanxian2">
   <div class="czrz">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
       <tr class="lan">
         <td width="12%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>序列号</strong></td>
         <td width="13%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>创建者</strong></td>
         <td width="11%" height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用操作</strong></td>
         <td width="10%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>时间</strong></td>
         <td width="13%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>应用状态</strong></td>
         <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>审核者</strong></td>
         <td width="12%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>审核动作</strong></td>
         <td width="17%" align="center" valign="middle" background="/images/erji_22.jpg"><strong>审核时间</strong></td>
       </tr>
       <tr>
         <td align="center" class="hui"><p>1</p></td>
         <td align="center" class="hui">&nbsp;</td>
         <td align="center" class="hui">&nbsp;</td>
         <td align="center" class="hui">&nbsp;</td>
         <td align="center" class="hui">&nbsp;</td>
         <td align="center" class="hui">&nbsp;</td>
         <td align="center" class="hui">&nbsp;</td>
         <td align="center" class="hui">&nbsp;</td>
       </tr>
     </table>
   </div>
  </div>
 </div>
 <!--其他属性展示  end-->
 	<script src="http://www.loiot.com/c/bootstrap/bootstrap.min.js"></script>
 	<link href="http://www.loiot.com/c/bootstrap/bootstrap_modal.css" rel="stylesheet" type="text/css"/>
 	<script src="http://www.loiot.com/c/alert/jquery.alert.js"></script>
 	<link href="http://www.loiot.com/c/alert/alert.css" rel="stylesheet" type="text/css"/>
   <script  language="javascript">
   	$("td.hui a").click(function(){
   		var content=$(this).attr("otherAttr");
   		if(content.length==0){
   			hiOverAlert("没有其他属性",2000);
   			return;
   		}
   		$("div.quanxian").modal("hide");
   		var attrArr=content.split(";");
   		var th=$("<tr/>").addClass("lan");
   		var tcontent=$("<tr/>");
   		for(i=0;i<attrArr.length;i++){
   			var thTd=$("<td height='37' align='center' valign='middle' background='/images/erji_22.jpg'/>").append($("<strong/>").text(attrArr[i].split(",")[0]));
   			th.append(thTd);
   			
   			var str=attrArr[i].split(",")[1];
   			if(str==''){
   				str="无";
   			}
   			var tcontentTd=$("<td align='center' class='hui'/>").text(str);
   			tcontent.append(tcontentTd);
   		}
		
		$("div.czrz table").empty();
		$("div.czrz table").append(th).append(tcontent);   		
   		
   			
   		$("div.quanxian").modal().css({
	                'width':'800px',
	                'margin-top': function () {
        			return -($(this).height()/2);
                    },
                    'margin-left': function () {
        			return -($(this).width()/2);
                    }
               });
   	});
   </script>