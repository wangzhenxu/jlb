<script>
    topMenuNum=3;
    left_menu_class_num=3;
    leftMenuNum=1;
    /*   left_second_MenuNum=3*/
</script>

<!-- 右侧 开始 -->
<div class="content">
    <div class="w100">
        <!-- __________内容 开始__________ -->
        <div class="title blue_bd">
            <div class="admin3">公众账号管理</div>
        </div>
        <div class="blue_bd">
            <div class="title2">公众账号详情</div>
        </div>
        <div class="blue_bd0 pad20 clearfix">
            <table class="table02">
                <tr>
                    <td width="17%" align="right" valign="middle" class="hui1">公众帐号：</td>
                    <td width="83%" class="hui">${mp.name!""}</td>
                </tr>

                <tr>
                    <td align="right" valign="middle" class="hui1">URL：</td>
                    <td class="hui">${mp.url!""}</td>
                </tr>
                <tr>
                    <td align="right" valign="middle" class="hui1">ToKen：</td>
                    <td class="hui">${mp.token!""}</td>
                </tr>
                <tr>
                    <td align="right" valign="middle" class="hui1">AppId：</td>
                    <td class="hui">${mp.appId!""}</td>
                </tr>
                <tr>
                    <td align="right" valign="middle" class="hui1">AppSecret：</td>
                    <td class="hui">${mp.appSecret!""}</td>
                </tr>
                <tr>
                    <td align="right" valign="middle" class="hui1">关注用户数：</td>
                    <td class="hui">${mp.followSum}</td>
                </tr>
                <tr>
                    <td align="right" valign="middle" class="hui1">授权用户数：</td>
                    <td class="hui">${mp.grantedSum}</td>
                </tr>
                <tr>
                    <td align="right" valign="middle" class="hui1">创建时间：</td>
                    <td class="hui">${mp.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                </tr>
            </table>
            <ul class="r50"><li><a class="but5" href="#" onclick="javascript:history.go(-1);return false;">返回</a></li></ul>
        </div>
        <!-- __________内容 结束__________ -->
    </div>
</div>
<!-- 右侧 结束 -->

