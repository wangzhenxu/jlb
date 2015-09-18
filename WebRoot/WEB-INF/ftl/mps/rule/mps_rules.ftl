<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站后台管理系统-微服务</title>
     <#include "../../include/pager.ftl">
    <link href="/css/css.css" rel="stylesheet" type="text/css" />
    <script src="/js/url.js"></script>

    <script LANGUAGE="javascript">


        $(function(){


            $(".but0").click(function(){
                var mpcount=$("#mpcount").val();
//        判断是否含有公众帐号
                if(mpcount<=0)
                {
                    return false;
                }  else{
                    var mcid=$("#mp").val();
                    var  rulename=$("#rulename").val();
                    var pi ;

                <#if pager??>
                    pi=${pager.pageIndex!0} ;
                <#else>
                    pi=0;
                </#if>

                    var cat;
                <#if cat??>
                    cat=${cat!0};
                    location.href="/mps/rules.action?mi="+mcid+"&rn="+rulename+"&cat="+cat;
                <#else >
                    location.href="/mps/rules.action?mi="+mcid+"&rn="+rulename;
                </#if>



                }
            });//query



            $(".pdtrule").click(function(){

               fnTab(0);
            });
            $(".followrule").click(function(){

                fnTab(1);
            });
            $(".keyrule").click(function(){

                fnTab(2);
            });

            function fnTab(vcat)
            {
                var mpcount=$("#mpcount").val();
//        判断是否含有公众帐号
                if(mpcount<=0)
                {
                    return false;
                }  else{
                    var mcid=$("#mp").val();
                    var  rulename=$("#rulename").val();

                    if (typeof(rulename) == "undefined")
                    {
                        rulename="";
                    }
                    var pi ;

                <#if pager??>
                    pi=${pager.pageIndex!0} ;
                <#else>
                    pi=0;
                </#if>

                    if(vcat==0) /* 产品规则*/
                    {
                        location.href="/mps/rules.action?mi="+mcid+"&rn="+rulename+"&cat="+vcat;
                    }else if(vcat==1)   /*回复规则*/
                    {
                        location.href="/mps/rules.action?mi="+mcid+"&cat="+vcat;
                    } else{  /* 关键字规则*/

                        location.href="/mps/rules.action?mi="+mcid+"&rn="+rulename+"&cat="+vcat;
                    }
                }

            }


            //全选
            $("table .allSel").click(function(){
                $.each($("table .checkmpr"),function(i,v){
                    $(this).attr("checked",'true');//全选
                });
            });

            //不选
            $("table .noSel").click(function(){
                $.each($("table .checkmpr"),function(i,v){
                    $(this).removeAttr("checked");//不选
                });
            });

            //反选
            $("table .invertSel").click(function(){
                $.each($("table .checkmpr"),function(i,v){

                    if($(this).attr("checked"))
                    {
                        $(this).removeAttr("checked");
                    }
                    else
                    {
                        $(this).attr("checked",'true');

                    }
                });
            });




            /**
             * 删除 事件
             */
            $(".but4").click(function(){
                var mprs="";
                var types="";

                if( $(".checkmpr:checked").size()==0)
                {
                    alert("请选择要删除的产品规则！");
                } else{

                    $(".checkmpr:checked").each(function(i,v){
                        mprs+=$(v).val()+"," ;
                        types+=$(v).next().val()+",";

                    });
                }

                $.get("/mp/pdtRule/del.action",
                        {
                            mprs:mprs,
                            types:types},

                        function(data,status)
                        {
                            console.log(data);
                            if(data.s==1)
                            {
                                alert("删除成功！");

                                var mcid=$("#mp").val();
                                var  rulename=$("#rulename").val();
                                var pi ;

                            <#if pager??>
                                pi=${pager.pageIndex!0} ;
                            <#else>
                                pi=0;
                            </#if>

                                location.href="/mps/rules.action?mi="+mcid+"&rn="+rulename+"&cat=0&pi="+pi;
                            }else{
                                alert("操作异常，请重试！");
                            }
                        }
                );

            });
        });//$
    </script>
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

                        <#if cat??>

                           <#if cat!=1>
                            <li><span class="classify">规则名称：</span>
                                <input name="" type="text" id="rulename"  class="input"  value="${name!''}" />
                                </select>
                            </li>
                           </#if>
                        <#else >
                        <li><span class="classify">规则名称：</span>
                                <input name="" type="text" id="rulename"  class="input"  value="${name!''}" />
                            </select>
                        </li>
                        </#if>
                     <#if  mps?size gt 0 >
                        <li><a href="javascript:void(0);" class="but0"><img src="/images/erji_06.jpg" width="64" height="26" /></a></li>
                     </#if>
                    </ul>
                </div>
            </div>

        <#if cat??>
            <div class="form">
                <div class="form2">
                    <table class="table_style03">
                        <tr>
                            <th colspan="6"><div class="zidong">
                                <div class="gzzh">公众帐号：<span id="mpname"></span></div>
                                <div class="huifu"><#--<a href="#"><img src="/images/huifu.jpg" /></a>--></div>
                            </div></th>
                        </tr>
                    </table>
                    <div class="sort2">



                       <#if cat==0>
                        <div id="js1" >
                            <div class="bian">
                                <div class="bianb">
                                    <div class="biantop">
                                        <ul>
                                            <li class="list"><a href="javascript:void(0);" class="pdtrule">产品规则</a></li>
                                            <li><a href="javascript:void(0);" class="followrule">关注回复规则</a></li>
                                            <li><a href="javascript:void(0);" class="keyrule">关键字规则</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="biao1">
                                    <div class="form4">
                                        <table class="table_style03">
                                            <tr>
                                                <th width="7%" valign="middle"><input type="checkbox" name="checkbox" id="checkbox" style="vertical-align:middle "   onClick='if(this.checked){$("table input[type=checkbox]").attr("checked","checked")}else{$("table input[type=checkbox]").attr("checked",false)}'/>
                                                    &nbsp;全选</th>

                                                <th width="9%">序号</th>
                                                <th width="11%">规则名称</th>
                                                <th width="15%">关联产品</th>
                                                <th width="15%">产品分类</th>
                                                <th width="16%">规则状态</th>
                                                <th width="12%">创建时间</th>
                                                <th width="16%">操作</th>
                                            </tr>
                                        <#list pdrs as pdr>
                                            <tr>
                                                <td>
                                                    <#if pdr.isOnline!=1>
                                                        <input type="checkbox" class="checkmpr"  value="${pdr.mprId}" name="checkbox3" id="checkbox3"/>
                                                        <input type="hidden" class="mprtype" value="${pdr.type}">
                                                    </#if>


                                                </td>
                                                <td> ${pdr_index+1}<input type="hidden" value="${pdr.mprId}" class="pdrIndex"/></td>
                                                <td class="hui">${pdr.name}</td>
                                                <td class="hui">${pdr.product.name}</td>
                                                <td class="hui">${pdr.product.productClazz.name}</td>
                                                <td>
                                                    <#if pdr.isOnline==1>
                                                        上线
                                                    <#else>
                                                        测试
                                                    </#if>
                                                </td>

                                                <td class="hui">${pdr.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                <td><a class="blue" href="/mp/pdtRule/toOp.action?cat=0&ty=${pdr.type}&mpr=${pdr.mprId}">查看</a>
                                                    <#--<#if pdr.isOnline!=1>-->
                                                        <#--<a class="blue" href="/mp/pdtRule/toOp.action?cat=1&ty=${pdr.type}&mpr=${pdr.mprId}">编辑</a>-->
                                                        <#--<a class="blue online" onclick="fnOnline($(this));" href="javascript:void(0);" value="/mp/pdtRule/toOnline.action?pi=${pager.pageIndex!0}&mpr=${pdr.mprId}&name=${name}&mcid=${mcId}">上线</a>-->
                                                    <#--</#if>-->
                                                </td>
                                            </tr>
                                        </#list>


                                            <tr>
                                                <td colspan="8" valign="middle" class="d"><a href="javascript:void(0);" class="but4"><img src="/images/del.jpg" /></a></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                           <!-- 翻页 开始 -->
                           <div class="manu"> <@pageBar pager=pager url="/mps/rules.action?cat=0&rn="+name+"&mi="+mcId join="&"></@pageBar></div>
                           <!-- 翻页 结束 -->
                       </#if>
                       <#if cat==1>

                        <div id="js2"  >
                            <div class="bian">
                                <div class="bianb">
                                    <div class="biantop">
                                        <ul>
                                            <li><a href="javascript:void(0);" class="pdtrule">产品规则</a></li>
                                            <li class="list"><a href="javascript:void(0);" class="followrule">关注回复规则</a></li>
                                            <li ><a href="javascript:void(0);" class="keyrule">关键字规则</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="biao1">
                                    <div class="sort3">
                                        <textarea name="textarea" id="textarea" cols="45" rows="5" class="textera">
                                            <#if mrf??>
                                               ${mrf.content!""}
                                               <#else>
                                                没有添加关注回复规则！
                                           </#if>
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                       </#if>
                       <#if cat==2>
                           <div id="js3" >
                               <div class="bian">
                                   <div class="bianb">
                                       <div class="biantop">
                                           <ul>
                                               <li><a href="javascript:void(0);" class="pdtrule">产品规则</a></li>
                                               <li><a href="javascript:void(0);" class="followrule">关注回复规则</a></li>
                                               <li class="list"><a href="javascript:void(0);" class="keyrule">关键字规则</a></li>
                                           </ul>
                                       </div>
                                   </div>
                                   <div class="biao1">
                                       <div class="form4">
                                           <table class="table_style03">
                                               <tr>
                                                   <th width="9%">序列号</th>
                                                   <th width="11%">规则名称</th>
                                                   <th width="16%">关键字</th>
                                                   <th width="16%">创建时间</th>
                                                   <th width="16%">操作</th>
                                               </tr>
                      						   <#if  pdrs??>
                      						   <#list pdrs as pdr>
                                               <tr>
                                                   <td class="hui">${pdr.mrId}</td>
                                                   <td class="hui">${pdr.name}</td>
                                                   <td class="hui">
	                                               <#if keyWords??>
							                       <#list keyWords as keyWord>
							                       	<#if keyWord.mrId==pdr.mrId>
							                       		${keyWord.keyword}
							                       	</#if>
							                       </#list>
							                       </#if>
							                       </td>
                                                   <td class="hui">${pdr.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                                   <td><a class="blue" href="/mp/follow/replyruleInfo.action?ruleId=${pdr.mrId}">查看</a></td>
                                               </tr>
                                               </#list>
                                               </#if>     
                                           </table>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <!-- 翻页 开始 -->
                           <div class="manu"> <@pageBar pager=pager url="/mps/rules.action?cat=2&rn="+name+"&mi="+mcId join="&"></@pageBar></div>
                           <!-- 翻页 结束 -->
                       </#if>

                    </div>
                </div>
                <#--<div class="manu"><span class="disabled"> <  Prev</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">Next  > </a></div>-->
            </div>
        </#if>
        </div>
        <script type="text/javascript">
            var mi= $.getUrlVar('mi');

            if(mi>0)
            {
                $("#mp").val(mi);
                $("#mpname").text($("#mp option:selected").text());
                console.log($("#mp option:selected").text());
            }


        </script>

</body>
</html>
