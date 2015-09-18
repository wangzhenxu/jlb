<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站后台管理系统-微服务</title>
    <link href="/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>

        <div class="right">
            <div class="location">
                <div class="location01">您现在的位置是：首页 &gt; 微服务 &gt; <strong>规则设定</strong></div>
            </div>
            <div class="form">
                <table class="table_style02">
                    <tr>
                        <td width="22%" align="right" valign="middle" class="hui1">规则名称：</td>
                        <td width="78%" class="hui">${mpr.name}</td>
                    </tr>
                    <tr>
                        <td width="22%" align="right" valign="middle" class="hui1">公众帐号：</td>
                        <td width="78%" class="hui">${mpr.mpCustomer.name}</td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="hui1">产品名称：</td>
                        <td class="hui">${mpr.product.name}</td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="hui1">关键字：</td>
                        <td valign="middle" class="hui">
                            <table class="table_style02" >
                                <tr>
                                    <th width="47%" align="center" class="black" >发送关键字</th>
                                    <th width="53%" align="center" class="black">匹配方式</th>

                                </tr>
                            <#list kws as kw>
                                <tr>
                                    <td>${kw.keyword}</td>
                                    <#if kw.matchWay==1>
                                        <td><a class="pp matchway" href="javascript:void(0);" >全匹配</a></td>
                                    <#else>
                                        <td><a class="pp ppalready  matchway" href="javascript:void(0);" >已全匹配</a></td>
                                    </#if>

                                </tr>
                            </#list>
                            </table>

                        </td>
                    </tr>
                    <tr>
                        <td rowspan="2" align="right" valign="middle" class="hui1">关联设置：</td>
                        <td valign="top" class="hui">
                            <table id="linkmain" class="table_style02 table02 mar_b0 ">
                                <tr>
                                    <th width="25%"  align="center" class="black">产品名称：</th>
                                    <td>${mpr.product.name}</td>
                                </tr>
                                <tr>
                                    <th width="25%"  align="center" class="black" >关联类型：</th>
                                <#if mpr.type==0>
                                    <td>命令组</td>
                                <#else>
                                    <td>属性组</td>
                                </#if>

                                </tr>
                                <tr>
                                    <th width="25%"  align="center" class="black">回复信息：</th>
                                    <td>${mpr.responseMessage}</td>
                                </tr>
                            </table>
                            </td>
                    </tr>
                    <tr>
                        <td valign="middle" class="hui">
                        <#if mpr.type==0>
                            <table id="cmds" class="table_style02 table01 table04">
                                <#list  pcgs as pcg>
                                    <tr>
                                        <th><input class="cmdcheck"  type="checkbox">
                                        ${pcg.title}
                                        </th>
                                        <td>
                                            <#list pcg.productCommandList as pc>
                                                <input  class="pcgradio" type="radio"  name="${pcg.pcgId}"
                                                    <#if (pcs?seq_index_of(pc.pcId)) gte 0  >
                                                        checked="checked"
                                                    </#if>
                                                        >${pc.title}
                                            </#list>
                                    </tr>
                                </#list>


                            </table>
                        <#else >
                            <table class="table_style02 table01">
                                <tr>
                                    <th width="5%">

                                    </th>
                                    <th>单位名称</th>
                                    <th>属性状态</th>
                                    <th>符号</th>
                                </tr>
                                <#list pals as ps>
                                    <tr>
                                        <td><input class="pacheck" type="checkbox"
                                            <#if (pas?seq_index_of(ps.paId)) gte 0 >
                                                   checked="checked"
                                            </#if>
                                                   disabled="disabled"     ></td>
                                        <td>${ps.title}</td>
                                        <#if ps.isChief gt 0>
                                            <td>主属性</td>
                                        <#else>
                                            <td>非主属性</td>
                                        </#if>

                                        <td>${ps.symbol}</td>
                                    </tr>
                                </#list>

                            </table>
                        </#if>

                        </td>
                    </tr>



                </table>
            </div>
            <div class="anniu">&nbsp;<a href="javascript:history.go(-1);"><img src="/images/gddc_05.jpg" width="101" height="29" /></a></div>
        </div>

        <script type="text/javascript">



            /**
             产品列表删除复选框规则
             */
            function select(cmd){
                switch(cmd){
                    case "all":
                        $(".attrTable input[type=checkbox]").attr("checked","checked")
                        break;
                    case "toggle":
                        var n=0;
                        $.each($(".attrTable input[type=checkbox]"),function(i,v){
                            if(i>0){
                                if(this.checked){
                                    n++;
                                    $(this).attr("checked",false)
                                }else{
                                    $(this).attr("checked","checked")
                                };
                                if(n==5){
                                    $("table input[type=checkbox] :first").attr("checked",false)
                                };
                                if(i==5&&n==0){
                                    $("table input[type=checkbox] :first").attr("checked","checked")
                                }
                            }
                        })
                        break;
                    case "no":
                        $(".attrTable input[type=checkbox]").attr("checked",false)
                        break;
                }
            }


            $(window).load(function(){
                //如果是命令组 规则，则在页面加载完成后
                //判断 命令radio是否选中，若选中则选中对用 命令组check
                if(${mpr.type}==0){
                    $("#cmds tr").each(function(i,v){

                        var cval=  $(v).find("input:radio:checked").val();
                        if(cval!=null)
                        {
                            $(v).find(".cmdcheck").attr("checked",true);

                        }
                        $(v).find("input:radio").attr("disabled","disabled");
                        $(v).find(".cmdcheck").attr("disabled","disabled");

                    });
                }

            });

        </script>
</body>
</html>
