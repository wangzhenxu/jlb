(function($) {  
    $.fn.extend({  
        fileTypeJudge : function(str) {  
            return this.each(function() {  
                var rightFileType;  
                var fileType;  
                var pojo;  
                if (str == "photo") {  
                    rightFileType = new Array("jpg", "bmp", "gif", "png","jpeg");  
                    pojo = "图像";  
                } else if (str == "txt") {  
                    rightFileType = new Array("txt");  
                    pojo = "文本";  
                } else {  
                    return;  
                }  
                var fileType = $(this).val().substring($(this).val().lastIndexOf(".") + 1);  
                if (!in_array(fileType,rightFileType)) {  
                    this.outerHTML += '';     
                    this.value ="";   
                    hiOverAlert("只支持" + pojo + "文件上传",1000); 
                    $(":file").replaceWith('<input name="file" type="file" class="input" id="textfield2"/>'); 
                }
            })  
        }  
    })  
})(jQuery)  
  
function in_array(needle, haystack) {  
    // 得到needle的类型 
    var type = typeof needle;  
    if(type == 'string' || type =='number') {  
        for(var i in haystack) {  
            if(haystack[i] == needle) {  
                return true;  
            }  
        }  
    }  
    return false;  
}  
