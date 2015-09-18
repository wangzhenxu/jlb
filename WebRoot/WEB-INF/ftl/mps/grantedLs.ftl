<head>
<#include "../include/pager.ftl">
</head>

<script>
    topMenuNum=3;
    left_menu_class_num=3;
    leftMenuNum=4;
    /*   left_second_MenuNum=3*/
</script>

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
             var url="/mp/grantedLs.action?mcId="+mcId+"&ln="+ln;

               self.location.href="/mp/grantedLs.action?mcId="+mcId+"&ln="+ln;
           } else{
               self.location.href="/mp/grantedLs.action?mcId="+mcId+"&ln="+ln+"&gt="+granted;
           }

       });
   });

</script>

<!-- 右侧 开始 -->
<div class="content">
    <div class="w100">
        <!-- __________内容 开始__________ -->
        <div class="title blue_bd">
            <div class="admin3">公众账号管理</div>
        </div>
        <div class="blue_bd">
            <ul class="search clearfix">
                <li style="padding-top:5px;">授权loiot用户：</li>
                <li style="padding:4px 20px 0 3px;">
                    <input type="text" id="ln" class="input_text w200 lu" />
                    <input type="hidden" id="mcId"  value="${mc.mcId}"/>
                </li>
                <li style="padding-top:5px;">授权状态：</li>
                <li style="padding:4px 20px 0 3px;">
                    <select id="grantedSel">
                        <option value="3"  selected="selected">全部</option>
                        <option value="1">已授权</option>
                        <option value="2">取消授权</option>
                    </select>
                </li>
                <li><a href="javascript:void(0);" class="but0"></a></li>
            </ul>
        </div>
        <div class="blue_bd0 clearfix">
            <div class="title2">公众帐号 <b>${mc.name!""}</b>     授权记录列表</div>
        </div>
        <div class="blue_bd0 pad20 clearfix mar_b20">
            <div class="blue_bd">
                <table class="table01">
                    <tbody>
                    <tr>
                        <th>序列号</th>
                        <th>OpenID</th>
                        <th>授权LOIOT用户</th>
                        <th>授权状态</th>
                        <th>操作时间</th>
                    </tr>
                    <#list mos as mo>
                    <tr>
                        <td>${mo.moId}</td>
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


                    </tbody>
                </table>
            </div>
        </div>
        <!-- 翻页 开始 -->
        <div class="manu"> <@pageBar pager=pager url="/mp/grantedLs.action?mcId="+mc.mcId+"&lg="+(lg!"")  join="&"></@pageBar></div>
        <!-- 翻页 结束 -->
        <!-- __________内容 结束__________ -->
    </div>
</div>
<!-- 右侧 结束 -->