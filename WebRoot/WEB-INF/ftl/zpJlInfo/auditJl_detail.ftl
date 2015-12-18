


<#include "../include/bootstrap.ftl"/>
<script type="text/javascript" src="/js/source/jquery.validationEngine.js"></script>
<script type="text/javascript" src="/js/source/jquery.validationEngine.min.js"></script>
<link href="/css/c_validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<script src="/js/ajaxfileupload.js"></script>
<script src="/js/my97/WdatePicker.js" type="text/javascript" > </script>
 <script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>			
<style type="text/css">
.pipei{ }
.pipei td{text-align:center;color:#000000}
.pipei .TL{width:14px;height:34px; background:url(../images/pipei_bg_TL.png) no-repeat LEFT top;}
.pipei .TC{height:30px; background:url(../images/pipei_bg_TC.jpg) repeat-x top;}
.pipei .TR{width:14px;height:34px; background:url(../images/pipei_bg_TR.png) no-repeat RIGHT top;}
.pipei .P_title{text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);letter-spacing: 3px;font-weight:bold;text-align:left;color:#000000}
.pipei .P_title2{background:url(../images/p_title2.jpg) repeat-x;letter-spacing: 3px;text-shadow: 0 1px 0 rgba(255, 255, 255, 0.8);}
</style>

<!-- 右侧 开始 -->
<div class="right" style="displa2y:none;">
  <ul class="nav nav-tabs" style="padding:20px 0 0 10px" >
                <li class="active"><a href="#B" data-toggle="tab">匹配信息</a></li>
                <li class=""><a href="#A" data-toggle="tab">个人信息</a></li>
                <li class=""><a href="#C" data-toggle="tab">评审信息</a></li>
              </ul>
  <div class="bs-docs-example" >
            <div class="tabbable tabs-left">
              <div class="tab-content">
              	  <div class="tab-pane" id="A">
            
            
             
    <div class="nav" >
     <div class="query1">
       <table width="100%" border="0" align="left">
          <tr style="" class="">
           <td  align="left" valign="middle">
            <pre id="jlContent2" style="font-size: 15px;white-space: pre-wrap;word-wrap: break-word;" >
            	<#if p??>
            		 ${p.jlContent!''}
            	</#if>
            </pre>
           </td>
         </tr>     
         </table>

     </div>
    </div>
    <div class="anniu">
    </div>
              
              
                </div>
      <div class="tab-pane active" id="B">
                 
                 
    
    <div class="nav" >
     
     
     
     <div class="query1" style="width:96%;">
       <table width="100%" class="pipei" border="0" >
        <tr >
        <td class="TL"> &nbsp;</td>
        <td class="P_title TC">公司职位信息</td>
        <td class="TR"> &nbsp;</td>
        </tr>
        </table>
         <table width="100%" class="pipei" id="table3"  border="0" style="background:#e5e9ec; border:1px solid #bfc7ca;border-top:none;">
       <tr >
       
        <td align="center" class="P_title2" height="34" style="width:150px"  > <strong>公司：</strong></td>
        <td align="center" class="P_title2" height="34" style="text-align:left">
            	<strong><#if jobInfo??>
            		 <a href="/zpCompanyInfo/toView.action?id=${jobInfo.companyId}" target="_blank">${jobInfo.companyName!''}</a>
            	</#if></strong>
        </td>
        </tr>
        
        <tr >
        <td align="left" class="hui1" style="border-bottom:1px solid #bfc7ca;letter-spacing: 3px;text-shadow: 0 1px 0 rgba(255, 255, 255, 0.8);"> <strong>职位：</strong></td>
        <td align="left" valign="middle"    class="P_title2" style="text-align:left; background:none; border-bottom:1px solid #bfc7ca">
            	 <strong><#if jobInfo??>
            	    <a href="/zpCompanyJobInfo/toView.action?id=${jobInfo.jobId}" target="_blank"> ${jobInfo.name!''}</a>
            	</#if></strong>
        </td>
        </tr>
        
       
        <tr >
        <td align="left" class="hui1" style="letter-spacing: 3px;text-shadow: 0 1px 0 rgba(255, 255, 255, 0.8);"> <strong>职位描述：</strong></td>
        <td align="left" valign="middle" style="text-align:left; padding:10px 10px 0 0">
         	<pre style="font-size: 15px;white-space: pre-wrap;word-wrap: break-word;" >
            	<#if jobInfo??>
            		 ${jobInfo.desc!''}
            	</#if>
            </pre>
        </td>
        </tr>
        
        <#if jobInfo?? && jobInfo.moreDesc!=''>
        <tr>
        <td align="left" class="hui1">更多描述：</td>
        <td align="left" valign="middle" >
         	<pre  style="font-size: 15px;white-space: pre-wrap;word-wrap: break-word;" >
            		 ${jobInfo.moreDesc!''}
            </pre>
        </td>
        </tr>
        </#if>
         </tbody>
         </table>
         </td>
         </tr>
         </table>
     </div>
	  
	  
     <div class="query1" style="width:96%;">
       <table class="pipei" width="100%" border="0">
        <tr >
        <td class="TL"> &nbsp;</td>
        <td class="P_title TC">已匹配</td>
        <td class="TR"> &nbsp;</td>
        </tr>
        <tr>
        <td colspan="3" style="padding:0;" cellspacing="0" cellpadding="0">
        <table id="table1" style="background:#e5e9ec; border:1px solid #bfc7ca;border-top:none;"  width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr >
        <td width="25%" height="34"  class="P_title2"  align="left" valign="middle"><strong>标题</strong></td>
       	<td  height="34"  class="P_title2"  align="left" valign="middle" ><strong>公司要求</strong></td>
        <td width="25%" height="34" class="P_title2"    align="left" valign="middle" ><strong>个人信息</strong></td>
       </tr>
       
       <#list matchList as c>
       	  <#if c.status==JobMatchType.ALREADY_MATCH.getCode()>
         <tr>
          <td align="left"  class="hui">${c.cloumnName!''}</td>
          <td align="left"  class="hui">${c.companyRequireName!''}</td>
          <td align="left"  class="hui">${c.jobSeekerInfo!''}</td>
         </tr>
         </#if>
          </#list>
          
         <tr>
          <td align="left" class="hui">关键字</td>
          <td align="left"  class="hui">
          	 <#list matchInfo.keys as c>
          	 	 <#if c.isMatch==MatchKeywordType.ALREADY_MATCH.getCode()>
				 	${c.keyword!''} 
				 </#if>	
          	 </#list>
          </td>
          <td align="left"  class="hui">${matchInfo.keywordPercent!'0'}%</td>
          
         </tr>
         </tbody>
         </table>
         </td>
         </tr>
         </table>
     </div>
     
     <div class="query1" style="width:96%;">
   
       <table class="pipei" width="100%" border="0"cellspacing="0" cellpadding="0">
        <tr>
        <td class="TL"> &nbsp;</td>
        <td class="P_title TC">未匹配</td>
        <td class="TR"> &nbsp;</td>
        </tr>
        <tr>
        <td colspan="3" style="padding:0;">
        <table id="table2" style="background:#e5e9ec; border:1px solid #bfc7ca;border-top:none;"  width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
          <tr >
        <td width="25%" class="P_title2"  height="34"  align="left" valign="middle"><strong>标题</strong></td>
       	<td  height="34" class="P_title2"   align="left" valign="middle" ><strong>公司要求</strong></td>
        <td width="25%" class="P_title2"  height="34"    align="left" valign="middle" ><strong>个人信息</strong></td>
       </tr>
       
       <#list matchList as c>
       	  <#if c.status==JobMatchType.UNMATCH.getCode()>
         <tr>
          <td align="left"  class="hui" >${c.cloumnName!''}</td>
          <td align="left" class="hui">${c.companyRequireName!''}</td>
          <td align="left"  class="hui">
           	<#if c.jobSeekerInfo?? && c.jobSeekerInfo?length gt 0>
          		${c.jobSeekerInfo!''}
          		<#else>
          		未知
          	</#if>	
          </td>
         </tr>
         </#if>
        </#list>
        
        
        <tr>
          <td align="left"  class="hui">关键字</td>
          <td align="left" class="hui" >
          	 <#list matchInfo.keys as c>
          	 	 <#if c.isMatch==MatchKeywordType.UNMATCH.getCode()>
				 	${c.keyword!''}
				 </#if>	
          	 </#list>
          </td>
           <td align="left"  class="hui"></td>
         </tr>
        
         </tbody>
        
        </table>
        </td>
        </tr>
        </table>
         
     </div>
    </div>
   
                 
                 
                </div>
                
                <div class="tab-pane" id="C">
                
                
             
    <div class="nav">
    
	<form method="post" id="addform" >
	  <input type="hidden" name="companyJobId" id="companyJobId" value="${matchInfo.jobId!''}">
	  <input type="hidden" name="jlId" id="jlId" value="${matchInfo.jlId!''}">
	  <input type="hidden" name="matchId" id="matchId" value="${matchInfo.matchId!''}">
	 
	 
     <div class="query1" style="width:95%">
       <table width="100%" border="0">
         <tbody>
         
         <tr>
           <td colspan="4" class="red">* 号为必填项  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;当前关键字匹配率${matchInfo.keywordPercent!'0'}%（大于等于${ApplicationConst.ALLOW_KEYWORDPERCENT}才可评审）</td>
         </tr>
         
         <tr style="display:none;">
           <td align="right" class="hui1" style="width:100px"><span class="red">*</span>评审类型：</td>
           	<td align="left" valign="middle" style="padding-left: 30px;">
           	  <input  type="radio" class="radio" <#if auditInfo??> <#if auditInfo.technicianAuditStatus==JlAuditType.AUDIT_OK.getCode()> checked </#if> </#if> name="technicianAuditStatus" id="technicianAuditStatus"  value="${JlAuditType.AUDIT_OK.getCode()}" /> ${JlAuditType.AUDIT_OK.getTitle()} 
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<input type="radio" class="radio" <#if auditInfo??> <#if auditInfo.technicianAuditStatus==JlAuditType.AUDIT_NO_PASS.getCode()> checked </#if> </#if>  name="technicianAuditStatus" id="technicianAuditStatus" value="${JlAuditType.AUDIT_NO_PASS.getCode()}" /> ${JlAuditType.AUDIT_NO_PASS.getTitle()} 
           </td>
         </tr>
         
          <tr>
           <td align="right" class="hui1" style="width:100px"><span class="red">*</span>评审内容：</td>
           	<td align="left" valign="middle" style="padding-left: 30px;">
           	  <textarea  rows="12" style="width: 900px;" id="technicianAuditContent" name="technicianAuditContent" cols="110" class="validate[required,minSize[10]]" placeholder="请输入你对求职者的评价" ><#if auditInfo??>${auditInfo.technicianAuditContent!''}</#if></textarea> 
           </td>
         </tr>
       
         </tbody>
         </table>
     </div>
   </form>
    </div>
    
     <div class="anniu">
         <#if (Session[Const.SESSION_USER_KEY].type==AccountType.ADMIN.getCode() || Session[Const.SESSION_USER_KEY].type==AccountType.TECHICAL_AUDIT.getCode()  )>
            <#if auditInfo??  >
            	<#elseif matchParentFlag==1>
            	<button type="button" class="btn btn-default" id="addBtn">保 &nbsp;存</button>
            </#if>
		 </#if>		  
    </div>
                
                  
                </div>
                
                
              </div>
              
            </div> <!-- /tabbable -->
          </div>
 
  
  
    
   </div>
<script src="/js/recommendflow.js"></script>

<script>
 $('input, textarea').placeholder();
 recommendflow.initAddAudit();
  <#if (Session[Const.SESSION_USER_KEY].type==AccountType.ADMIN.getCode() || Session[Const.SESSION_USER_KEY].type==AccountType.TECHICAL_AUDIT.getCode() )>
    <#if auditInfo??>
            recommendflow.disableTechnicianAuditInput();
   	</#if>
  </#if>		
</script>
<script Language="Javascript">
for (j=1;j<4 ;j++) {
	var cobj=document.getElementById("table"+j).rows;
	for (i=0;i< cobj.length ;i++) {
	(i%2==0)?(cobj[i].style.background = "#f6f4f4"):(cobj[i].style.background = "#fcfbfb");
	}
}
</script>
