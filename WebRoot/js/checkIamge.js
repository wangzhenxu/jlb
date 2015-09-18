function onUploadImgChange(sender){ 
 	var objPreview = document.getElementById( 'preview' );   
	var objPreviewFake = document.getElementById( 'preview_fake' );   
	var objPreviewSizeFake = document.getElementById( 'preview_size_fake' );  
	var browserVersion= window.navigator.userAgent.toUpperCase();//浏览器版本信息   
    if( !sender.value.match( /.jpg|.gif|.png|.bmp/i ) ){   
        alert('图片格式无效！');   
        return false;   
    }   
       
    if(browserVersion.indexOf("FIREFOX")>-1){//火狐   
        objPreview.style.display = 'block';   
        objPreview.style.width = '150px';   
        objPreview.style.height = '150px';   
           
        // Firefox 因安全性问题已无法直接通过 input[file].value 获取完整的文件路径   
        objPreview.src = window.URL.createObjectURL( sender.files[0]);       
    }else if(sender.files){// chrome
    	//兼容chrome等，也可以兼容火狐，通过HTML5来获取路径                   
        if(typeof FileReader !== "undefined"){
            var reader = new FileReader(); 
            reader.onload = function(e){$(objPreview).attr("src",e.target.result);}  
            reader.readAsDataURL(sender.files[0]);
        }else if($.browser.safari){
            alert("暂时不支持Safari浏览器!");
        }
    	    
    }else if( objPreviewFake.filters ){  
        // IE7,IE8 在设置本地图片地址为 img.src 时出现莫名其妙的后果   
        //（相同环境有时能显示，有时不显示），因此只能用滤镜来解决   
           
        // IE7, IE8因安全性问题已无法直接通过 input[file].value 获取完整的文件路径   
        sender.select();   
        sender.blur(); 
        var imgSrc = document.selection.createRange().text;   
        objPreviewFake.filters.item(   
            'DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;   
        objPreviewSizeFake.filters.item(   
            'DXImageTransform.Microsoft.AlphaImageLoader').src = imgSrc;   
        autoSizePreview( objPreviewFake, 150, 150 );  
        objPreview.style.display = 'none'; 
    }   
       var oldForm=$(sender).closest("form");
	   $.ajaxFileUpload({
		url:'/product/management/checkImage.action', //需要链接到服务器地址
		type:"POST",
		async:false,
		secureuri:false,
	 	fileElementId:'ui-upload-input', //文件选择框的id属性
		oldForm:oldForm,// 原formID
	 	dataType:'text', //服务器返回的格式，可以是json
		success:function(data,status){ //相当于java中try语句块的用法 data是从服务器返回来的值 
		var data=T.json.parse(data);
		var st=data.s;
		var sd=data.d;
			if(st==1){
				samllPicbool=true;
				$.validationEngine.closePrompt('.ui-upload-holderformError',true);
			}
			else{
				samllPicbool=false;
				$.validationEngine.buildPrompt('#ui-upload-holder','请上传大小在1M以内的图片','error');
			}
	 	},
		error:function(data,status){ //相当于java中catch语句块的用法
				samllPicbool=false;
				$.validationEngine.buildPrompt('#ui-upload-holder','请上传大小在1M以内的图片','error');
			
		}
	 });
    
}   

function onPreviewLoad(sender){ 
    autoSizePreview( sender, sender.offsetWidth, sender.offsetHeight );   
}   

function autoSizePreview( objPre, originalWidth, originalHeight ){   
    var zoomParam = clacImgZoomParam( 300, 300, originalWidth, originalHeight );   
    objPre.style.width = zoomParam.width + 'px';   
    objPre.style.height = zoomParam.height + 'px';
}   

function clacImgZoomParam( maxWidth, maxHeight, width, height ){   
    var param = { width:width, height:height, top:0, left:0 };   
       
    if( width>maxWidth || height>maxHeight ){   
        rateWidth = width / maxWidth;   
        rateHeight = height / maxHeight;   
           
        if( rateWidth > rateHeight ){   
            param.width = maxWidth;   
            param.height = height / rateWidth;   
        }else{   
            param.width = width / rateHeight;   
            param.height = maxHeight;   
        }   
    }   
       
    param.left = (maxWidth - param.width) / 2;   
    param.top = (maxHeight - param.height) / 2;   
       
    return param;   
}   