<div >
	<form id="saveSuggestForm"  method="post">
	<input type="hidden" name="sug_content" id="sug_content"  >
	  	<div class="xin1_1" style="width: 100%;">
	   		<div class="whitea">建议与bug</div>
	   		<div class="close"><img data-dismiss="modal" src="/images/xinjian_03.gif" width="18" height="18"/></div>
	  	</div>
	  	<div class="caidan"  style="width: 99.9%;">
	   		<div class="caidan1">
		    	<div class="cd1" style="width: 100%;">
		     		<table width="100%" border="0">
		      			<tr>
					        <td width="25%" align="right" class="hui1">类型：</td>
					        <td width="75%" align="left" valign="middle">
					             <#list SuggestType.values() as c>
             						 <input  class="radio validate[required]"  name="sug_type" id="sug_type"  type="radio" value="${c.code}" > ${c.title}
        						 </#list>
		        			</td>
		      			</tr>
		      			<tr>
					        <td align="right" class="hui1">标题：</td>
					        <td align="left" valign="middle">
					        	<input name="sug_title" id="sug_title" style="width:350px;" type="input" class="input validate[required]"/>
					        </td>
					      </tr>
					     	<tr>
					        <td  class="hui1" align="center" colspan="2" >
					                请输入你的建议与bug
					         </br>
					        <textarea  style="width:300px;height:200px;visibility:hidden;"  name="sug_content_edit" id="sug_content_edit"></textarea>
					        	
					        </td>
					      
					      </tr>
					   
		      		</table>
		    	</div>
	   		</div>
		   <div class="caidan2">
		   		<a href="#" id="addSuggestInfo" ><img src="/images/bjwj03.jpg" width="62" height="23" /></a>&nbsp;
		   		<a href="#" id="cancelAddSuggestInfo" data-dismiss="modal"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a>
		   	</div>
	  	</div>
  	</form>
 </div>
 
<style type="text/css">
 	.close{opacity:1;}
 	.tip{padding-left:10px;color:red;}
 </style>
 