<script src="/js/emalModal.js"></script>
<!--弹框 邮件模版 开始-->

<div class="modal hide fade xin1" id="xin4" style="width:700px;">
  <div class="xin1_1" style="width:700px;">
   <div class="whitea">发送邮件</div>
   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
  </div>
  <div class="caidan" style="width:698px;">
   <div class="caidan1">
    <div class="cd">基本信息</div>
    <div class="cd1" style="width:680px;">
    
    <form id="sendform"  method="post">
    <input type="hidden" id="ids" name="ids">
     <table width="100%" border="0">
     <tr>
        <td align="right" class="hui1">模版：</td>
        <td align="left" valign="middle">
        	<select style="width:400px;" onchange="emalModal.changeTemplateInfo(this);">
        		 <#list templateListPage.data as c>
        			<option value="${c.emailId!''}"  subject="${c.templateSubject!''}" content="${c.templateContent!''}" >${c.templateTitle!''}</option>
        		 </#list>
        	</select>
        </td>
      </tr>
      <tr>
        <td align="right" class="hui1">主题：</td>
        <td align="left" valign="middle"><input style="width:400px;" value="${templateSubject!''}"  name="templateSubject" type="text"  class="input validate[required]"  id="templateSubject"/></td>
      </tr>
       <tr>
        <td align="right" class="hui1">内容：</td>
        <td align="left" valign="middle">
        	<textarea  readonly cols="15" rows="3" class="input validate[required,length[1000] text-input mokuainr ckeditor" name="desc"  id="desc" >${templateContent!''}</textarea>
        </td>
      </tr>
     </table>
    </form>
    </div>
   </div>
   <div class="caidan2"><a href="javascript:emalModal.sendMail();"><img src="/images/bjwj03.jpg" width="62" height="23"/></a>&nbsp;
   <a href="javascript:void(0);" ><img src="/images/bjwj_05.jpg" width="62" height="23" data-dismiss="modal" /></a></div>
  </div>
 </div> 
<!-- 邮件模版 结束 -->