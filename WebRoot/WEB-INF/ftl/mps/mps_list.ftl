<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站后台管理系统-微服务</title>
   <#include "../include/bootstrap.ftl"/>
    <#include "../include/pager.ftl">
    <script src="http://www.loiot.com/c/My97DatePicker/WdatePicker.js" type="text/javascript" > </script>
    <script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine.pack.js"></script>
    <script src="http://www.loiot.com/c/validationEngine/jquery.validationEngine-cn.js"></script>
    <link href="http://www.loiot.com/c/validationEngine/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

    <script src="/js/url.js"></script>
    <link href="/css/css.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        String.prototype.Trim = function()
        {
            return this.replace(/(^\s*)|(\s*$)/g, "");
        }



        String.prototype.LTrim = function()
        {
            return this.replace(/(^\s*)/g, "");
        }



        String.prototype.RTrim = function()
        {
            return this.replace(/(\s*$)/g, "");
        }
    </script>

    <script  language="javascript">

        var cdate;

        /*    判断是否有 授权记录*/
        $(function(){


            $("#updateClazz").validationEngine({validateAttribute: "validate",validationEventTriggers:"keyup blur"});


            $.each($("table .record"),function(i,v){
                if($(this).parent().parent().find(".grantedSum").text()==0){
                    $(this).attr("onClick"," alert('没有用户授权记录！')");
                    // alert("没有用户授权记录！");
                }else{
                    $(this).attr("onClick","");
                    $(this).bind("click",function(){
                        location.href="/mps/grantedLs.action?mcId=" +$(this).parent().find(".mcId").val()  ;
                    });

                }
                pageHide();
            }) ;
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

            //全选
            $("table .allSel").click(function(){
                $.each($("table .check"),function(i,v){
                    $(this).attr("checked",'true');//全选
                });
            });

            //不选
            $("table .noSel").click(function(){
                $.each($("table .check"),function(i,v){
                    $(this).removeAttr("checked");//不选
                });
            });

            //反选
            $("table .invertSel").click(function(){
                $.each($("table .check"),function(i,v){

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

            //删除按钮
            $(".but4").bind("click",function(){
                var str="";
                $.each($("table .check"),function(i,v){
                    if($(this).attr("checked"))
                    {
                        str+= $(this).parent().find(".mcid").val()  +"," ;
                    }
                });
                if(str==null)
                {
                    alert("请选择要删除的公众帐号！");
                }else{

                    var ct=$("#ct").val();
                /*    if(ct=="")
                    {
                        location.href="/mps/del.action?del="+str;
                    } else{
                        location.href="/mps/del.action?ct="+ct+"&del="+str ;
                    }*/

                    <#if ci??>
                        location.href="/mps/del.action?ct="+ct+"&del="+str+"&ci=${ci}" ;
                        <#else>
                          location.href="/mps/del.action?ct="+ct+"&del="+str ;
                    </#if>

                }

            });



        }) ;




        function dateChange()
        {
            cdate= $("#date").val();
        }

        function query()
        {

            cdate= $("#date").val();
            var ci=$("#cr").val();
            location.href="/mps/list.action?ct="+cdate+"&ci="+ci;


        }



        /*公众帐号  启用状态修改*/
        function fnMpDisabled(tr,mcId)
        {
            var  tx=$(tr).text();
            var disabled=0;
            if(tx=="停用"){
                disabled=1 ;
            }
            $.get("/mps/disabled.action",
                    {
                        mcId : mcId,
                        disabled: disabled
                    }  ,
                    function(data,status)
                    {
                        if(data.s)
                        {
                            var tp= (tx.Trim()=="停用"?"启用":"停用");
                            $(tr).text(tp);
                        } else{
                            alert("请重试！") ;
                        }

                    }
            )  ;
        }


        /**
         * 弹出 完善信息弹窗
         */

        function fnFullMp(mcid)
        {
            $("#mcIdH").val(mcid);

            $(".appinfo").modal().css({
                'width':'430px',
                'margin-top': function () {
                    return -($(this).height()/2);
                },
                'margin-left': function () {
                    return -($(this).width()/2);
                }
            });
        }


        /**
         * 完善信息弹窗 提交保存
         */
        function fnFullMpOk()
        {
            $("#ai").blur();
            $("#as").blur();
            if($(".error-field").size()){
                alert("填入信息不能为空！");
            }else{
                var mcid=$("#mcIdH").val();
                var ai=$("#ai").val();
                var as=$("#as").val();

                var ct=$("#ct").val();


                var pi=0;
            <#if pager??>
                pi=${pager.pageIndex!0} ;
            </#if>

                $.get("/mps/updateApp.action",
                        {
                            mi : mcid,
                            ai: ai,
                            as:as
                        }  ,
                        function(data,status)
                        {
                            if(data.s)
                            {
                            <#if ci??>
                                location.href="/mps/list.action?ct="+ct+"&pi="+pi+"&ci=${ci}";
                            <#else>
                                location.href="/mps/list.action?ct="+ct+"&pi="+pi;
                            </#if>

                            } else{
                                alert("请重试！") ;
                            }

                        }
                )  ;
            }

        }

    </script>
</head>
<body>

        <div class="right">
            <div class="location">
                <div class="location01">您现在的位置是：首页 &gt; 微服务 &gt; <strong>公众帐号管理</strong></div>
            </div>
            <div class="sort">
                <div class="sort1">公众帐号管理</div>
                <div class="query">
                    <ul>
                        <li> <span class="classify">客 户 ：</span>

                            <input id="mpcount" type="hidden" value="${crs?size}"/>
                            <input type="hidden" value="">
                        <#if  crs?size gt 0 >
                            <select id="cr">
                                <#list crs as cr>
                                    <option value="${cr.customerId!'0'}">${cr.customerName!""}</option>
                                </#list>
                            </select>
                        <#else>
                            <input name="input" type="text"  class="input">没有相关客户</input>
                        </#if>

                        </li>

                        <li>创建时间：

                            <input name="date" type="text"  class="Wdate" readonly="true" id="date" onchange="dateChange();" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            <input type="hidden" id="ct" value="${ct!''}" />
                        </li>
                      <#if  crs?size gt 0 >
                        <li><a <a href="javascript:void(0);"    onclick="query();"><img src="/images/erji_06.jpg" width="64" height="26" /></a></li>
                      </#if>
                    </ul>
                </div>
            </div>
        <#if mps??>
            <div class="form">
                <div class="form2">
                    <table class="table_style03 mps">
                        <tr>
                            <th width="7%" valign="middle">

                                    <input type="checkbox"  style="vertical-align:middle "  onClick='if(this.checked){$("table input[type=checkbox]").attr("checked","checked")}else{$("table input[type=checkbox]").attr("checked",false)}'/>
                                   </th>

                            <th width="9%">序列号</th>
                            <th width="15%">公众帐号</th>

                            <th width="15%">关注用户数</th>
                            <th width="9%">授权用户数</th>
                            <th width="10%">申请时间</th>
                            <th width="16%">操作</th>
                        </tr>

                        <#list mps as mp>
                            <tr>
                                <td><input type="checkbox" name="checkbox" id="checkbox"  class="check"/>
                                <input type="hidden" value="${mp.mcId}" class="mcid"></td>
                                <td >${mp_index+1}</td>
                                <td>${mp.name}</td>
                                <td>${mp.followSum}</td>
                                <td class="grantedSum">${mp.grantedSum}</td>
                                <td >${mp.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                <td >
                                    <#if (mp.appId??)&&(mp.appSecret??)>
                                        <a class="blue" href="/mps/detail.action?mcId=${mp.mcId}">查看</a> <#--<a class="blue" href="/mps/edit.action?mi=${mp.mcId}">修改</a>-->

                                        <#if subject.isPermitted("mpCustomer:grantedList")>
                                        <a class="blue record" href="javascript:void(0);" onclick="console.log(123)">授权记录</a>
                                        </#if>
                                        <input type="hidden" id="InMcId" class="mcId" value="${mp.mcId}" >

                                        <#if subject.isPermitted("mpCustomer:disabled")>
                                        <a class="blue" href="javascript:void(0);" onclick="fnMpDisabled($(this),${mp.mcId});">
                                            <#if mp.disabled==0>
                                                停用
                                            <#else>
                                                启用
                                            </#if>
                                        </a>
                                        </#if>
                                    <#else>
                                        <a class="blue" href="javascript:void(0);" onclick="fnFullMp(${mp.mcId});">完善信息</a>
                                        <input type="hidden" id="mcIdH">
                                    </#if>

                                </td>
                            </tr>
                        </#list>

                        <tr>
                            <td colspan="8" valign="middle" class="d"><a href="javascript:void(0);" class="but4"><img src="/images/del.jpg" width="74" height="26" /></a></td>
                        </tr>
                    </table>
                </div>
               <#-- 分页栏 -->

                <div class="manu"> <@pageBar pager=pager url="/mps/list.action?ct="+ct+"&ci="+ci  join="&"></@pageBar></div>
                <#--<div class="manu"><span class="disabled"> <  Prev</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">Next  > </a></div>-->
            </div>
        </#if>
        </div>

        <script type="text/javascript">
            var ci= $.getUrlVar('ci');
            var dt= $.getUrlVar('ct');
            if(ci>0)
            {
                $("#cr").val(ci);
            }

            $("#date").val(dt);
        </script>


        <!-- 弹窗 开始 -->
        <div class="modal hide fade appinfo">
            <div class="xin1_1">
                <div class="whitea">完善信息</div>
                <div class="close"><img src="/images/xinjian_03.gif" width="18" height="18" data-dismiss="modal"/></div>
            </div>
            <div class="caidan">
                <div class="caidan1">
                    <div class="cd">请首先完善公众帐号的信息：</div>
                    <div class="cd1">

                        <form id="updateClazz"  action="" method="post">
                            <table width="100%" border="0">
                                <tr>
                                    <td align="right" class="hui1">App  ID：</td>
                                    <td align="left" valign="middle"><input  name="updatename" type="text" validate="validate[required,length[1,20]]" class="input validate[required] text-input" id="ai" />
                                        <input type="hidden" class="input" id="pcid"  name="pcid" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="hui1">App Secret：</td>
                                    <td align="left" valign="middle"><input  name="updatename" type="text"  validate="validate[required,length[1,32]]" class="input validate[required] text-input" id="as" />
                                        <input type="hidden" class="input" id="pcid"  name="pcid" />
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="caidan2"><a href="javascript:void(0);" onclick="fnFullMpOk()"><img src="/images/bjwj03.jpg" width="62" height="23"/></a>&nbsp;
                    <a href="javascript:void(0)" ><img src="/images/bjwj_05.jpg" width="62" height="23" data-dismiss="modal" /></a></div>
            </div>
        </div>
        <!-- 弹窗 结束 -->

        <#--<!-- 弹窗 开始 &ndash;&gt;-->
        <#--<div  class="pop modal hide fade" style="width:390px;">-->
            <#--<div class="title">完善信息<a href="" class="x"></a></div>-->

            <#--<form id="appFull">-->
                <#--<div class="pad20">-->
                    <#--<div class="mar_b20">请首先完善公众帐号的信息：</div>-->
                    <#--<div class="clearfix">-->
                        <#--<label class="left"><span class="em_2">App ID：</span></label>-->
                        <#--<div class="left">-->
                            <#--<input id="ai" type="text" class="input_text w200" validate="validate[required,length[1,20]]"/>-->
                        <#--</div>-->
                    <#--</div>-->
                    <#--<div style="padding-top:20px;" class="clearfix">-->
                        <#--<label class="left">App Secret：</label>-->
                        <#--<div class="left">-->
                            <#--<input id="as" type="text" class="input_text w200" validate="validate[required,length[1,32]]" />-->
                        <#--</div>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</form>-->
            <#--<div class="clearfix">-->
                <#--<ul class="r50">-->
                    <#--<li><a href="javascript:void(0);" class="button mar_r30" data-dismiss="modal" onclick="fnFullMpOk()">确定</a><a href="javascript:void(0);" class="button gray" data-dismiss="modal">取消</a></li>-->
                <#--</ul>-->
            <#--</div>-->
        <#--</div>-->
        <!-- 弹窗 结束 -->
</body>
</html>
