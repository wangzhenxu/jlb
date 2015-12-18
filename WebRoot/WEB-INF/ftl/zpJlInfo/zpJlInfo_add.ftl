
<#include "../include/comm_jlb_macro.ftl"/>

<script>
	 left_menu_class_num=1;
	 leftMenuNum=1;
</script>
<#include "../include/bootstrap.ftl"/>
<script type="text/javascript" src="/js/source/jquery.validationEngine.js"></script>
<script type="text/javascript" src="/js/source/jquery.validationEngine.min.js"></script>
<link href="/css/c_validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<script src="/js/ajaxfileupload.js"></script>
<script src="/js/my97/WdatePicker.js" type="text/javascript" > </script>
<script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>

<link href="/dropzone-4.2.0/dist/basic.css" rel="stylesheet" type="text/css" />
<link href="/dropzone-4.2.0/dist/dropzone.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/dropzone-4.2.0/dist/dropzone.js"></script>

 <div class="wrapper wrapper-content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>文件上传</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_file_upload.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_file_upload.html#">选项1</a>
                                </li>
                                <li><a href="form_file_upload.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="my-awesome-dropzone" class="dropzone dz-clickable" action="form_file_upload.html#">
                            <div class="dropzone-previews"></div>
                            <button type="submit" class="btn btn-primary pull-right">提交</button>
                        <div class="dz-default dz-message"><span>Drop files here to upload</span></div></form>
                        <div>
                            <div class="m"><small>DropzoneJS是一个开源库，提供拖放文件上传与图片预览：<a href="https://github.com/enyo/dropzone" target="_blank">https://github.com/enyo/dropzone</a></small>，百度前端团队提供的<a href="http://fex.baidu.com/webuploader/" target="_blank">Web Uploader</a>也是一个非常不错的选择，值得一试！</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript" src="/js/uploadFile.js"></script>



