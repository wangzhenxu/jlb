<div >
	<form id="saveAccountForm" action="/account/add.action" method="post">
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
					        	<input type="radio" /> 建议 
					        	<input type="radio" /> bug 
		        			</td>
		      			</tr>
		      			<tr>
					        <td align="right" class="hui1">标题：</td>
					        <td align="left" valign="middle">
					        	<input name="password" style="width:350px;" type="password" class="input" id="textfield2" validate="validate[required,length[4,20]]"/>
					        	<span class='tip'></span>
					        </td>
					      </tr>
					     	<tr>
					        <td  class="hui1" align="center" colspan="2" >
					        
					        <textarea rows="13" cols="80"></textarea>
					        
					        </td>
					      
					      </tr>
					   
		      		</table>
		    	</div>
	   		</div>
		   <div class="caidan2">
		   		<a href="javascript:addAccount();" ><img src="/images/bjwj03.jpg" width="62" height="23" /></a>&nbsp;
		   		<a href="#" data-dismiss="modal"><img src="/images/bjwj_05.jpg" width="62" height="23" /></a>
		   	</div>
	  	</div>
  	</form>
 </div>
<style type="text/css">
 	.close{opacity:1;}
 	.tip{padding-left:10px;color:red;}
 </style>