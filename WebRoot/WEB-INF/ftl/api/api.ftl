
  <script type="text/javascript" src="http://www.loiot.com/js/jquery.js"></script>

<link href="http://www.loiot.com/css/login.css" rel="stylesheet" type="text/css" />



<div class="w_960 rel">
 
  <!-- 左侧 开始 -->
  <div class="api_left" id="api_left">
           ${menuJsonStr} 
  </div>
  
 
  <!-- 左侧 结束 -->
  <script>
  function	openMenu(obj){
    var a =  $("#"+obj).parent().next().is("div");
    if(a) {
    			var iObj =  $("#"+obj).parent().find("i").get(0);
    			var className = iObj.className;
    			//alert(className);
    			if(className=="jian"){
    				  $("#"+obj).parent().find("i").removeClass('jian');
    				 $("#"+obj).parent().next().hide();
    			} else {
    				   $("#"+obj).parent().find("i").addClass('jian');
    				  $("#"+obj).parent().next().show();
    			}
    }
  }
  
  </script>
</div>
  

  