

  	<#include "../include/comm_jlb_macro.ftl"/>
<html>
	<head>
	<title>网站后台管理系统-${pageTitle!''}管理</title>
	<@gmc_common_js "select" />
</head>
	<body> 
    
    <div class="right">
            <div class="location">
                <div class="location01">您现在的位置是：首页 &gt; 顾问对接管理 &gt; <strong>顾问对接列表</strong></div>
            </div>
            <div class="sort" style="display:none;">
                <div class="sort1">规则设定</div>
                <div class="query">
                    <ul>
                        <li><span class="classify">公众帐号：</span>
                            <input id="mpcount" type="hidden" value="7">
                                <select id="mp">
                                        
                                </select>

                           </li>


	                    <li><span class="classify">规则名称：</span>
	                        <input name="" type="text" id="rulename" class="input" value="">
	                        
	                    </li>
                        <li><a href="javascript:void(0);" class="but0"><img src="/images/erji_06.jpg" width="64" height="26"></a></li>
                    </ul>
                </div>
            </div>

            <div class="form">
                <div class="form2">
                    <table class="table_style03">
                        <tbody><tr>
                            <th colspan="6"><div class="zidong" style="display:none;">
                                <div class="gzzh">公众帐号：<span id="mpname">zhangsf001</span></div>
                                <div class="huifu"></div>
                            </div></th>
                        </tr>
                    </tbody></table>
                    <div class="sort2">
                        <div id="js1">
                            <div class="bian">
                                <div class="bianb">
                                    <div class="biantop">
                                        <ul>
                                            <li   <#if flowStatus??> <#else> class="list" </#if>  ><a href="/zpRecommendFlowInfo/headhunterInterfaceList.action" class="pdtrule">全部</a></li>
                                            <li   <#if flowStatus?? && flowStatus==RecommendFlowType.COMPANY_INVITATION_INTERVIEW.getCode()> class="list" </#if>   ><a href="/zpRecommendFlowInfo/headhunterInterfaceList.action?flowStatus=${RecommendFlowType.COMPANY_INVITATION_INTERVIEW.getCode()}" class="pdtrule">待通知</a></li>
                                            <li   <#if flowStatus?? && flowStatus==RecommendFlowType.WAIT_JOBHUNTER_GOTO_INTERVIEW.getCode()> class="list" </#if>   ><a href="/zpRecommendFlowInfo/headhunterInterfaceList.action?flowStatus=${RecommendFlowType.WAIT_JOBHUNTER_GOTO_INTERVIEW.getCode()}" class="followrule">同意去面试</a></li>
                                            <li   <#if flowStatus?? && flowStatus==RecommendFlowType.HUNTER_ALREAD_GOTO_INTERVIEW.getCode()> class="list" </#if>   ><a href="/zpRecommendFlowInfo/headhunterInterfaceList.action?flowStatus=${RecommendFlowType.HUNTER_ALREAD_GOTO_INTERVIEW.getCode()}" class="followrule">已面试</a></li>
                                            
                                        </ul>
                                    </div>
                                </div>
                                <div class="biao1">
                                    <div class="form4">
                                    
                                       	<#include "headhunterInterface_tab.ftl"/>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                          
                           <#-- 分页栏 -->
     <@pageBar   pager=pager url="/zpRecommendFlowInfo/headhunterInterfaceList.action?jsonParam=${jsonParam!''}" join="&"> </@pageBar> 
                          

                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
 <!-- 企业反馈-->
<div class="pop_sure modal hide fade" id="auditPersonPop">
	  <div class="content">
	 <div class="quanxian">
	  <div class="quanxian1">
	   <div class="whitea">求职者反馈</div>
	   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
	  </div>
	  <div class="quanxian2">
	   <div class="czrz">
	     <table width="100%" border="0">
        <tr>
	        <td align="left" class="hui1"  >求职者：<span id="audit_name"></span></td>
	        <td></td>
     	 </tr>
       <tr>
       <td align="left" class="hui1">求职者反馈状态</td>
        <td align="left" class="hui1" >
	         <select id="hrNoticeStatus">
      			 <option value="" > 请选择 </option>
      			 <#list DictionaryUtil.getTypes(DictionaryType.HEADHUNTER_REPLY_STATUS.getCode()) as c>
       				 <option value="${c.dictionaryId}"  > ${c.name!''} </option>
     			</#list>
    		 </select>
        </td>
      </tr>
      
      <tr>
       <td align="center" class="hui1" colspan="2">
       		<textarea cols="70" id="hrNoticeFeedbackContent" name="hrNoticeFeedbackContent" rows="12" placeholder="请输入反馈内容" ></textarea>
       </td>
      </tr>
      </table>
	   </div>
	   
	   <div class="anniu">
	   		<div class="btn-group">
				 <button type="button" class="btn btn-default" id="addAuditBtn">确&nbsp;定</button>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  		 <button type="button" class="btn btn-default" data-dismiss="modal">取&nbsp;消</button>
      		</div>
    	</div>
    
	   
	  </div>
	 </div>
	 </div>
</div>


<!-- 求职者是否已去面试-->
<div class="pop_sure modal hide fade" id="isGotoInterviewPop">
	  <div class="content">
	 <div class="quanxian">
	  <div class="quanxian1">
	   <div class="whitea">是否去面试</div>
	   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
	  </div>
	  <div class="quanxian2">
	   <div class="czrz">
	     <table width="100%" border="0">
        <tr>
	        <td align="left" class="hui1"  >求职者：<span id="isGotoInterviewPop_audit_name"></span></td>
	        <td></td>
     	 </tr>
       <tr>
       <td align="left" class="hui1">是否已去面试</td>
        <td align="left" class="hui1" >
           <input type="radio" class="radio"  name="hunterGotoInterviewStatus"  value="${RecommendFlowType.HUNTER_ALREAD_GOTO_INTERVIEW.getCode()}" /> ${RecommendFlowType.HUNTER_ALREAD_GOTO_INTERVIEW.getTitle()} 
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		<input type="radio" class="radio"  name="hunterGotoInterviewStatus" value="${RecommendFlowType.HUNTER_NO_GOTO_INTERVIEW.getCode()}" /> ${RecommendFlowType.HUNTER_NO_GOTO_INTERVIEW.getTitle()} 
        </td>
      </tr>
      
      <tr>
       <td align="center" class="hui1" colspan="2">
       		<textarea cols="70" id="hunterReplayContent" name="hunterReplayContent" rows="12" placeholder="请输入反馈内容" ></textarea>
       </td>
      </tr>
      </table>
	   </div>
	   
	   <div class="anniu">
	   		<div class="btn-group">
				 <button type="button" class="btn btn-default" id="isGotoInterviewAddAuditBtn">确&nbsp;定</button>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  		 <button type="button" class="btn btn-default" data-dismiss="modal">取&nbsp;消</button>
      		</div>
    	</div>
	  </div>
	 </div>
	 </div>
</div>

<!-- 面试反馈-->
<div class="pop_sure modal hide fade" id="interviewerPop">
	  <div class="content">
	 <div class="quanxian">
	  <div class="quanxian1">
	   <div class="whitea">面试反馈</div>
	   <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
	  </div>
	  <div class="quanxian2">
	   <div class="czrz">
	     <table width="100%" border="0">
        <tr>
	        <td align="left" class="hui1"  >求职者：<span id="interviewerpop_audit_name"></span></td>
	        <td></td>
     	 </tr>
       <tr>
       <td align="left" class="hui1">面试反馈状态</td>
        <td align="left" class="hui1" >
	         <input type="radio" class="radio"  name="hunterInterviewStatus"  value="${RecommendFlowType.HUNTER_INTERVIEW_PASS.getCode()}" /> ${RecommendFlowType.HUNTER_INTERVIEW_PASS.getTitle()} 
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		<input type="radio" class="radio"  name="hunterInterviewStatus" value="${RecommendFlowType.HUNTER_INTERVIEW_NO_PASS.getCode()}" /> ${RecommendFlowType.HUNTER_INTERVIEW_NO_PASS.getTitle()}
        </td>
      </tr>
      
      <tr>
       <td align="center" class="hui1" colspan="2">
       		<textarea cols="70" id="hunterInerviewReplayContent" name="hunterInerviewReplayContent" rows="12" placeholder="请输入反馈内容" ></textarea>
       </td>
      </tr>
      </table>
	   </div>
	   
	   <div class="anniu">
	   		<div class="btn-group">
				 <button type="button" class="btn btn-default" id="interviewerAddAuditBtn">确&nbsp;定</button>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  		 <button type="button" class="btn btn-default" data-dismiss="modal">取&nbsp;消</button>
      		</div>
    	</div>
	  </div>
	 </div>
	 </div>
</div>




  <#include "../include/deleteConfirmModal.ftl">

    <script src="/js/headhunterInterface.js"></script>
      <script>
    	common.initLeftMenuSelected("headhunterInterface_list");
    </script>
   </body>
</html>



