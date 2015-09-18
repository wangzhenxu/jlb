<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站后台管理系统-微服务</title>
    <link href="/css/css.css" rel="stylesheet" type="text/css" />

     <#include "../include/pager.ftl">
    <script src="/js/url.js"></script>
    <script language="javascript" type="text/javascript">

        $(function(){

            $("#grantedSel").change(function(){
                var p1=$(this).children('option:selected').val();
            });

            $(".but0").click(function(){
                var granted=$("#grantedSel").children('option:selected').val();
                var ln= $("#ln").val();

                var mcId=$("#mcId").val();
                if(granted==3)
                {
                    var url="/mps/grantedLs.action?mcId="+mcId+"&ln="+ln;

                    self.location.href="/mps/grantedLs.action?mcId="+mcId+"&ln="+ln;
                } else{
                    self.location.href="/mps/grantedLs.action?mcId="+mcId+"&ln="+ln+"&gt="+granted;
                }

            });
        });

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
                        <li><span class="classify">授权用户：</span>
                            <input name="" type="text" id="ln" class="input" value="${lg!""}"/>
                            <input type="hidden" id="mcId"  value="${mc.mcId}"/></li>
                        <li><span class="classify">授权状态：</span>

                            <select id="grantedSel" class="input" name="select">
                                <option value="3"  selected="selected">全部</option>
                                <option value="1">已授权</option>
                                <option value="2">取消授权</option>
                            </select>
                        </li>
                        <li><a href="javascript:void(0);" class="but0"> <img src="/images/erji_06.jpg" width="64" height="26" /></a></li>
                    </ul>
                </div>
            </div>
            <div class="form">
                <div class="form2">
                    <table class="table_style03">
                        <tr>
                            <th colspan="5" valign="middle">
                                <div class="zidong">
                                    <div class="gzzh">公众帐号：<b>${mc.name!""}</b></div>
                                </div>
                            </th>
                        </tr>
                        <tr class="f">
                            <td width="13%"><strong>序号</strong></td>
                            <td width="22%"><strong>OpenID</strong></td>
                            <td width="23%"><strong>授权LOIOT用户</strong></td>
                            <td width="21%"><strong>授权状态</strong></td>
                            <td width="21%"><strong>操作时间</strong></td>
                        </tr>
                    <#list mos as mo>
                        <tr>
                            <td>${mo_index+1}</td>
                            <td>${mo.openid}</td>
                            <td>${mo.user.loginName!""}</td>
                            <td>
                                <#if mo.isGranted==1>
                                    已授权
                                <#else>
                                    取消授权
                                </#if>
                            </td>
                            <td>${mo.grantedTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                        </tr>
                    </#list>

                    </table>
                </div>
                <div class="manu"> <@pageBar pager=pager url="/mp/grantedLs.action?mcId="+mc.mcId+"&lg="+(lg!"")  join="&"></@pageBar></div>
            </div>
        </div>

        <script type="text/javascript">
            var gt= $.getUrlVar('gt');

            if(gt>0)
            {
                $("#grantedSel").val(gt);
            }


        </script>




</body>




</html>
