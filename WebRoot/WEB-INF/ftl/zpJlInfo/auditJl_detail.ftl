

<script>
	 left_menu_class_num=1;
	 leftMenuNum=1;
</script>
<#include "../include/bootstrap.ftl"/>
<script type="text/javascript" src="/js/source/jquery.validationEngine.js"></script>
<script type="text/javascript" src="/js/source/jquery.validationEngine.min.js"></script>
<link href="/css/c_validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<script src="/js/ajaxfileupload.js"></script>
<script src="/js/my97/WdatePicker.js" type="text/javascript" > </script>
 <script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>			

<form id="addform" name="form"  method="post" enctype="multipart/form-data">
<input type="hidden" name="jlId" id="jlId"  value="${pid!''}"  />
<input type="hidden" name="onlyName" id="onlyName"/>
<input type="hidden" name="phoneT" id="phoneT"/>

<input type="hidden" name="jlFilePath" id="jlFilePath" />
<input type="hidden" name="jlContent" id="jlContent" />
<input type="hidden" name="oldFilePath" id="oldFilePath" />
<input type="hidden" name="jobPositionLevelIds" id="jobPositionLevelIds" />


<!-- 右侧 开始 -->
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong class="m_title"> 个人信息</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01 m_title" >个人信息</div>
	</div>
     <div class="query1">
       <table width="100%" border="0" align="left">
         
          <tr style="" class="">
           <td  align="right" class="hui1">简历内容：</td>
           <td  align="left" valign="middle" colspan="3" >
            <textarea id="jlContent2"  cols="130" style="font-size: 15px;" rows="150" >
            	<#if p??>
            		 ${p.jlContent!''}
            	</#if>
            </textarea>
           </td>
         </tr>     
         </table>

     </div>
    </div>
    <div class="anniu">
    </div>
   </div>
<!-- 右侧 结束 -->
</form>
<script>
</script>
