

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
                                            <li   <#if flowStatus?? && flowStatus==RecommendFlowType.WAIT_RECOMMEND_COMPANY.getCode()> class="list" </#if>   ><a href="/zpRecommendFlowInfo/companyInterfaceList.action" class="pdtrule">待推荐</a></li>
                                            <li   <#if flowStatus?? && flowStatus==RecommendFlowType.ALREADY_RECOMMEND_COMPANY.getCode()> class="list" </#if>   ><a href="/zpRecommendFlowInfo/companyInterfaceList.action?flowStatus=2" class="followrule">已推荐</a></li>
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
    
   </body>
</html>



