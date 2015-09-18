<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站后台管理系统-微服务</title>
<#include "../include/pager.ftl">
    <link href="/css/css.css" rel="stylesheet" type="text/css" />
    <script src="/js/url.js"></script>
    <script language="javascript" type="text/javascript">

        $(function(){

            $(".but0").click(function(){
                var mpcount=$("#mpcount").val();
                /* 判断是否含有公众帐号*/
                if(mpcount<=0)
                {
                    return false;
                }  else{
                    var mi=$("#mp").val();
                    var ty=$("#ty").val();
                    var  kw=$("#kw").val();
                    var pi ;

                <#if pager??>
                    pi=${pager.pageIndex!0} ;
                <#else>
                    pi=0;
                </#if>

                    location.href="/mps/opls.action?mi="+mi+"&kw="+kw+"&ty="+ty+"&cat=1";
                }
            });
            pageHide();
        });
			function pageHide(){
				$(".manu a").hide();
				var total=$(".manu li").size();
				var now=$(".manu .current").index();
				$(".manu a").slice(0,2).show();
				$(".manu a").slice(total-1,total).show();
				if(now>3){
					$(".manu a").slice(now-3,now+3).show();
				}else{
					$(".manu a").slice(0,7).show();
				}
			}	
    </script>
</head>

<body>

        <div class="right">
            <div class="location">
                <div class="location01">您现在的位置是：首页 &gt; 微服务 &gt; <strong>操作记录</strong></div>
            </div>
            <div class="sort">
                <div class="sort1">操作记录</div>
                <div class="query">
                    <ul>
                        <li style="padding-top:5px;width: 24%" ><span class="classify">公众帐号：</span>
                            <input id="mpcount" type="hidden" value="${mps?size}"/>
                        <#if  mps?size gt 0 >
                            <#if mcgs??>
                                <select id="mp">
                                    <#list mcgs as mcg>
                                        <optgroup label="<#if mcg.customerName??>${mcg.customerName}<#else>没有用户关联</#if>" >
                                            <#if mcg.mpCustomerList??>
                                                <#list  mcg.mpCustomerList as mc>
                                                    <option value="${mc.mcId}">${mc.name}</option>
                                                </#list>
                                            </#if>

                                        </optgroup>
                                    </#list>
                                </select>

                            <#else>
                                <input name="input" type="text"  class="input">没有相关微信公众平台帐号</input>
                            </#if>
                        </#if>
                        <#--<#if  mps?size gt 0 >-->
                            <#--<select id="mp">-->
                                <#--<#list mps as mp>-->
                                    <#--<option value="${mp.mcId}">${mp.name}</option>-->
                                <#--</#list>-->
                            <#--</select>-->
                        <#--<#else>-->
                            <#--<input name="input" type="text"  class="input">没有相关微信公众平台帐号</input>-->
                        <#--</#if>-->
                        </li>
                        <li style="padding-top:5px;width: 24%">消息类型：

                            <select id="ty">
                                <option value="100">全部消息</option>
                                <option value="0">常规消息</option>
                                <option value="1">订阅消息</option>
                                <option value="2">取消订阅消息</option>
                                <option value="3">自定义菜单消息</option>
                                <option value="4">公众帐号关键字消息</option>
                            </select>
                        </li>
                        <li style="padding-top:5px;width: 24%"><span class="classify">发送关键字：</span>
                            <input type="text" id="kw" class="input_text w200" value="${kw!''}" >
                        </li>
                      <#if  mps?size gt 0 >
                        <li style="padding-top:5px;width: 24%"><a href="javascript:void(0);" class="but0"><img src="/images/erji_06.jpg" width="64" height="26" /></a></li>
                      </#if>
                    </ul>
                </div>
            </div>

          <#if  pager??>
            <div class="form">
                <div class="form2">
                    <table class="table_style03">
                        <tr>
                            <th colspan="5"> <div class="zidong">
                                <div class="gzzh">公众帐号：   ${mp.name!""}</div>
                            </div>
                            </th>
                        </tr>
                        <tr class="f">
                            <td width="5%"><strong>序号 </strong></td>
                            <td width="20%"><strong>OpenID</strong></td>
                            <td width="15%"><strong>授权loiot用户</strong></td>
                            <td width="10%">消息类型</td>
                            <td width="17%"><strong>发送关键字</strong></td>
                            <td width="17%">触发规则</td>
                            <td width="20%"><strong>操作时间</strong></td>
                        </tr>
                    <#list pager.data as op>
                        <tr>
                            <td class="hui">${op_index+1} </td>
                            <td class="hui">${op.openid!""}</td>
                            <td class="hui">${op.loginName!""}</td>
                            <td class="hui">${op.type!""}</td>
                            <td class="hui">${op.keyword!""}</td>
                            <td class="hui">${op.rule!""}</td>
                            <td class="hui"><#if op.createtime??> ${op.createtime?string("yyyy-MM-dd HH:mm:ss")}</#if></td>

                        </tr>
                    </#list>
                    </table>
                </div>
                <!-- 翻页 开始 -->

                <div class="manu"> <@pageBar pager=pager url="/mps/opls.action?kw="+kw+"&mi="+mi+"&ty="+ty+"&cat=1" join="&"></@pageBar></div>
                <!-- 翻页 结束 -->
            </div>
          </#if>
        </div>

        <script type="text/javascript">

            var mi= $.getUrlVar('mi')  ;
            var ty= $.getUrlVar('ty')  ;
            if(mi>0)
            {
                $("#mp").val(mi);
            }

            if(ty>0)
            {
                $("#ty").val(ty);
            }

        </script>


</body>
</html>
