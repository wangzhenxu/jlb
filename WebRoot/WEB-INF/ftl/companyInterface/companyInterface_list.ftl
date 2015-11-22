

  	<#include "../include/comm_jlb_macro.ftl"/>
<html>
	<head>
	<title>网站后台管理系统-${pageTitle!''}管理</title>
	<@gmc_common_js "select" />
</head>
	<body>
    
    <div class="right">
            <div class="location">
                <div class="location01">您现在的位置是：首页 &gt; 微服务 &gt; <strong>规则设定</strong></div>
            </div>
            <div class="sort">
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
                            <th colspan="6"><div class="zidong">
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
                                            <li class="list"><a href="javascript:void(0);" class="pdtrule">待推荐</a></li>
                                            <li><a href="javascript:void(0);" class="followrule">已推荐</a></li>
                                            <li style="display:none;"><a href="javascript:void(0);"  class="keyrule">关键字规则</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="biao1">
                                    <div class="form4">
                                        <table class="table_style03">
                                            <tbody><tr>
                                                <th width="9%">公司名称</th>
                                                <th width="11%">职位名称</th>
                                                <th width="11%">求职者</th>
                                                <th width="15%">技术审核人</th>
                                                <th width="16%">技术评审时间</th>
                                                <th width="16%">操作</th>
                                            </tr>
                                            
                                              <#list pager.data as c>
											       <tr>
											       
												 	  <td align="center" class="hui">
												 	 	${companyName!''}
												 	   </td>
												 	  <td align="center" class="hui">
												 	  	${companyJobName!''}
												 	   </td>
												 	  <td align="center" class="hui">
												 	 		${jlName!''}
												 	   </td>
													 <td align="center" class="hui">
											    			 <#if c.technicianAuditTime??>
												        	 	 ${c.technicianAuditTime?string("yyyy-MM-dd")}
												 		 	 </#if>
												 	 </td>
													 <td align="center" class="hui" style="width:300px;"  >
												       		<div class="btn-group">
											      			<#if subject.isPermitted("zpJlInfo:list")>   <#--zpRecommendFlowInfo:detail  -->
															  <button type="button" class="btn btn-default"  onclick="recommendflow.toDetail('${c.auditId}')">详情</button>
															 </#if>
															 
											      			<#if subject.isPermitted("zpJlInfo:list")>  <#--zpRecommendFlowInfo:edit  -->
															  <button type="button" class="btn btn-default"  onclick="recommendflow.toEdit('${c.auditId}')">修改</button>
															 </#if>
															 
											      			<#if subject.isPermitted("zpJlInfo:list")>  <#--zpRecommendFlowInfo:disableAndEnabled  -->
															  <#if c.isDelete??>
															  	<button type="button" class="btn btn-default"  onclick=recommendflow.modifyDeleteStatus('${c.auditId}', '${c.isDelete!""}' );>
															  	 	<#if c.isDelete==PauseStartType.START.getCode()> 暂停 </#if>
															  	 	<#if c.isDelete==PauseStartType.PAUSE.getCode()> 启用 </#if>
															  </button>	
															  </#if>
															 	</#if>
															  <button type="button" class="btn btn-default"  onclick="recommendflow.toAddJob('${c.auditId}')">发布职位</button>
												      		</div>
											        </td>
											       </tr>
											       </#list>
                                        </tbody></table>
                                    </div>
                                </div>
                            </div>
                        </div>
                           <!-- 翻页 开始 -->
                           <div class="manu">     
	<div class="manu">
	共为您找到相关结果0个
		 	<span class="disabled"> 上一页 </span>
		 	<span class="current">1</span>
		 	<span class="disabled"> 下一页 </span>
	 </div>
</div>
                           <!-- 翻页 结束 -->

                    </div>
                </div>
            </div>
        </div>
    
   </body>
</html>



