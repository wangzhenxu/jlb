


<#include "../include/bootstrap.ftl"/>
<script type="text/javascript" src="/js/source/jquery.validationEngine.js"></script>
<script type="text/javascript" src="/js/source/jquery.validationEngine.min.js"></script>
<link href="/css/c_validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="/js/ajaxfileupload.js"></script>
<script src="/js/my97/WdatePicker.js" type="text/javascript" > </script>
 <script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>			


<!-- 右侧 开始 -->
<div class="right" style="displa2y:none;">

  <div class="bs-docs-example">
            <div class="tabbable tabs-left">
              <div class="tab-content">
              	  <div class="tab-pane active" id="A">
            
            
               <div class="location">
     <div class="location01">您现在的位置是：匹配职位列表 &gt; <strong class="m_title"> 匹配信息</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01 m_title" >个人信息</div>
	</div>
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
                <div class="tab-pane" id="B">
                 
                 
    <div class="location">
     <div class="location01">您现在的位置是：匹配职位列表 &gt; <strong class="m_title"> 匹配信息</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">已匹配</div>
	</div>
	  <input type="hidden" name="PDesc" id="PDesc">
	  <input type="hidden" name="techPara" id="techPara">
	  <input type="hidden" name="install" id="install">
     <div class="query1" style="width:100%">
       <table width="100%" border="0">
         <tbody>
          <tr >
        <td  height="37"  align="left" valign="middle"><strong>标题</strong></td>
       	<td  height="37"   align="left" valign="middle" ><strong>公司要求</strong></td>
        <td  height="37"    align="left" valign="middle" ><strong>个人信息</strong></td>
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
     </div>
     <div class="basic">
	 <div class="basic01">未匹配</div>
	</div>
     <div class="query1" style="width:100%">
       <table width="100%" border="0">
        
        <tbody>
          <tr >
        <td  height="37"  align="left" valign="middle"><strong>标题</strong></td>
       	<td  height="37"   align="left" valign="middle" ><strong>公司要求</strong></td>
        <td  height="37"    align="left" valign="middle" ><strong>个人信息</strong></td>
       </tr>
       
       <#list matchList as c>
       	  <#if c.status==JobMatchType.UNMATCH.getCode()>
         <tr>
          <td align="left"  class="hui">${c.cloumnName!''}</td>
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
     </div>
    </div>
   
                 
                 
                </div>
                
                <div class="tab-pane" id="C">
                
                
                <div class="location">
     <div class="location01">您现在的位置是：匹配职位列表 &gt; <strong class="m_title"> 匹配信息</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01">评审信息</div>
	</div>
	<form method="post" id="addform" >
	  <input type="hidden" name="companyJobId" id="companyJobId" value="${matchInfo.jobId!''}">
	  <input type="hidden" name="jlId" id="jlId" value="${matchInfo.jlId!''}">
	  <input type="hidden" name="matchId" id="matchId" value="${matchInfo.matchId!''}">
	 
	 
     <div class="query1" style="width:100%">
       <table width="100%" border="0">
         <tbody>
         
         <tr>
           <td colspan="4" class="red">* 号为必填项  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;当前关键字匹配率${matchInfo.keywordPercent!'0'}%（大于等于40%才可评审）</td>
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
              <ul class="nav nav-tabs">
                <li class="active"><a href="#A" data-toggle="tab">个人信息</a></li>
                <li class=""><a href="#B" data-toggle="tab">匹配信息</a></li>
                <li class=""><a href="#C" data-toggle="tab">评审信息</a></li>
              </ul>
            </div> <!-- /tabbable -->
          </div>
 
  
  
    
   </div>
<script src="https://cdn.bootcss.com/jquery-placeholder/2.1.3/jquery.placeholder.js"></script>
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
