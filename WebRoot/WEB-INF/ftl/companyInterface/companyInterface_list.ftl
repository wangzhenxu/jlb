

  	<#include "../include/comm_jlb_macro.ftl"/>
<html>
	<head>
	<title>网站后台管理系统-${pageTitle!''}管理</title>
	<@gmc_common_js "select" />
</head>
	<body>
    
    <div class="right">
            <div class="location">
                <div class="location01">您现在的位置是：首页 &gt; 企业对接管理 &gt; <strong>企业对接列表</strong></div>
            </div>
            <div class="sort" style="">
                <div class="sort1">企业对接列表</div>
                <div class="query">
                 		<form id="queryForm" >
                
                    <ul>
        	<li style="width:22%">
		       	<span class="classify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;求职者：</span>
		    	<input name="jlName" type="text"   class="input"  id="jlName" value="${jlName!''}"/>
		      </li>
		      <li style="width:22%">
		       	<span class="classify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司名：</span>
		    	<input name="companyName" type="text"   class="input"  id="name" value="${companyName!''}"/>
		      </li>
			        <li style="width:15%">
				       	<span class="classify">职位：</span>
				    	<select id="jobPositionId" name="jobPositionId">
			    		 <option value="" > 请选择 </option>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
			    		 		 <option value="${c.dictionaryId}" <#if  jobPositionId?? && jobPositionId!=''> <#if jobPositionId?number==c.dictionaryId> selected </#if> </#if>  > ${c.showName!''} </option>
			 			 	</#list>
			    		  </select>
				       </li>
				   
				    <li style="width:25%;display:none;" >
				       	<span class="classify">流程状态：</span>
				    	<select id="flowStatus" name="flowStatus">
			    		 <option value="" > 请选择 </option>
			    		    <#list RecommendFlowType.values() as c>
			    		 		 <option value="${c.code}" <#if  flowStatus?? && flowStatus!=''> <#if flowStatus?number==c.code> selected </#if> </#if>  > ${c.title!''} </option>
			 			 	</#list>
			    		  </select>
				   </li> 
				     
			       
				      <li style="width:5%"><a href="javascript:void(0)">
  				 		<button type="button" class="btn btn-default" id="queryBtn">查&nbsp;询</button>
       				</a></li>
      </ul>
      	</form>
                </div>
            </div>

            <div class="form">
                <div class="form2">
                    <table class="table_style03">
                        <tbody><tr>
                        </tr>
                    </tbody></table>
                    <div class="sort2">
                        <div id="js1">
                            <div class="bian">
                                <div class="bianb">
                                    <div class="biantop">
                                        <ul>
                                            <li   <#if flowStatus??> <#else> class="list" </#if>  ><a href="/zpRecommendFlowInfo/companyInterfaceList.action" class="pdtrule">全部</a></li>
                                            <li   <#if flowStatus?? && flowStatus!='' && flowStatus?number==RecommendFlowType.WAIT_RECOMMEND_COMPANY.getCode()> class="list" </#if>   ><a href="/zpRecommendFlowInfo/companyInterfaceList.action?flowStatus=${RecommendFlowType.WAIT_RECOMMEND_COMPANY.getCode()}" class="pdtrule">待推荐</a></li>
                                            <li   <#if flowStatus?? && flowStatus!='' && flowStatus?number==RecommendFlowType.ALREADY_RECOMMEND_COMPANY.getCode()> class="list" </#if>   ><a href="/zpRecommendFlowInfo/companyInterfaceList.action?flowStatus=${RecommendFlowType.ALREADY_RECOMMEND_COMPANY.getCode()}" class="followrule">已推荐待回复</a></li>
                                            <li style="display:none;"><a href="javascript:void(0);"  class="keyrule">关键字规则</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="biao1">
                                    <div class="form4">
                                    
                                       	<#include "companyInterface_tab.ftl"/>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                          
                           <#-- 分页栏 -->
     <@pageBar   pager=pager url="/zpRecommendFlowInfo/companyInterfaceList.action?jsonParam=${jsonParam!''}" join="&"> </@pageBar> 
                          

                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
 <!-- 企业反馈-->
<!-- 选择技术评pop 开始 -->
<div class="pop_sure modal hide fade" id="auditPersonPop">
	  <div class="content">
	 <div class="quanxian">
	  <div class="quanxian1">
	   <div class="whitea">评审列表</div>
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
       <td align="left" class="hui1">企业反馈状态</td>
        <td align="left" class="hui1" >
	         <select id="enterpriseReplyStatus">
      			 <option value="" > 请选择 </option>
      			 <#list DictionaryUtil.getTypes(DictionaryType.ENTERPRISE_REPLY_STATUS.getCode()) as c>
       				 <option value="${c.dictionaryId}"  > ${c.name!''} </option>
     			</#list>
    		 </select>
        </td>
      </tr>
      
      <tr>
       <td align="center" class="hui1" colspan="2">
       		<textarea cols="70" id="enterpriseReplyContent" name="enterpriseReplyContent" rows="12" placeholder="请输入反馈内容" ></textarea>
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




  <#include "../include/deleteConfirmModal.ftl">

    <script src="/js/companyInterface.js"></script>
    <script>
    	common.initLeftMenuSelected("companyInterface_list");
    	companyInterface.initPage();
    </script>
   </body>
</html>



