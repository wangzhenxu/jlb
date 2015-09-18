//获取浏览器信息。
var Browser = (function() {
	var engine = "Unknown";
	var name = "Unknown";
	var version = 0;
	var userAgent = navigator.userAgent;
	if (/Trident|MSIE/.test(userAgent))
		engine = "Trident";
	if (/Gecko/.test(userAgent))
		engine = "Gecko";
	if (/WebKit/.test(userAgent))
		engine = "WebKit";
	if (/Opera/.test(userAgent))
		engine = "Presto";
	if (userAgent.match(/(IE|Firefox|Safari|Chrome|Opera)(?: |\/)([0-9]+)/)) {
		name = RegExp.$1;
		version = parseInt(RegExp.$2, 10);
	}
	return {
		engine : engine,
		name : name,
		version : version,
		language : (navigator.language || navigator.userLanguage).toLowerCase(),
		onLine : navigator.onLine,
		cookieEnabled : navigator.cookieEnabled,
		isStandardMode : document.compatMode === "CSS1Compat"
	};
})();

var preivew = function(file, container, chage, fileSize) {
	
	/*if (fileSize != null) {
		var localFileSize = 0;
		if (Browser.name == "Firefox") {
			localFileSize = file.files[0].size;
		} else if (Browser.name == "IE") {
			file.select();
			file.blur();
			var filePath = document.selection.createRange().text;
            var fileSystem = new ActiveXObject("Scripting.FileSystemObject");   
            var fileLocal = fileSystem.GetFile (filePath);
            localFileSize = fileLocal.Size;
		}
		
		if (localFileSize > (fileSize * 1000)) {
			alert("图片太大");
			if (Browser.name == "Firefox") {
				file.value="";
			} else if (Browser.name == "IE") {
				file.outerHTML+='';
				aFile=$(file);
				aFile.replaceWith(aFile.clone());  
			}
			return false;
		}
	}
	if (chage && chage != ""){
	   // if(chage=='img0' || chage=='img1' || chage=='img2' || chage=='img3'){
	       document.getElementById(chage).value = "1";
	  //}
	}
*/
	showPic(file, container);
}

//显示图片到对应位置
var showPic = function(file, container) {
	 var arr = new Array();
	 arr[0] = ".jpg";
	 arr[1] = ".gif";
	 arr[2] = ".png";
	 arr[3] = ".png";
	 arr[4] = ".jpeg";
	var ff=false;
	for(i=0;i<arr.length;i++){
		if(file.value.indexOf(arr[i])!=-1){
			ff=true;
		}
	}
	if(!ff){
		 isSubmit=false;
		 file.outerHTML+=''; 
		alert("非法的图片格式！");
		//alert($(file).val());
		return;
	}else{
		 isSubmit=true;
	}
	/*if (!file.value.slice(-4).match(/.jpg|.gif|.png|.bmp|jpeg/i)) {
		file.value="";
		return alert("非法的图片格式！");
	}
	
	if (Browser.name == "IE") {
		file.select();
		file.blur();
		var url = document.selection.createRange().text;
		
		//用一个同样大小的div包裹img，并隐藏img
		//在这个div上用滤镜实现图片预览，
		var parentNode = container.parentNode;
		var newNode = document.createElement("div");
		newNode.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
		newNode.style.backgroundColor = "#fff";
		newNode.style.width = container.currentStyle.width;
		newNode.style.height = container.currentStyle.height;
		var copy = container.cloneNode();
		newNode.appendChild(copy);
		parentNode.replaceChild(newNode,container);
		copy.style.display = "none";
		document.selection.empty();

		try {
			url = url + "?" + Math.random()*Math.random();
			newNode.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = url;
			
		} catch (e) {
			return alert("加载图片失败:\n" + url);
		}
	} else if (Browser.name == "Firefox") {
		if (file.files) {
			//container.src = file.files.item(0).getAsDataURL()
			container.src = window.URL.createObjectURL(file.files.item(0));
		} else {
			alert("加载图片失败.");
		}
	} else if(Browser.name == "Chrome"){
		var reader = new FileReader(); 
		reader.onload = function(e) {
			container.src  = e.target.result; 
		};
		if(file.files && file.files[0]){
			reader.readAsDataURL(file.files[0]);
		}else {
			container.src = file.value || "No file selected";
		}
	} else {
		alert(Browser.name + "\n您使用的浏览器不支持预览本机图片。");
	}
	*/
}