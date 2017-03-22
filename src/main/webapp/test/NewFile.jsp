<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
  /* if(typeof jQuery == 'undefined'){
	    window.alert("没有jquery");
	} */
	  function ajaxTest(){  
        $.ajax({  
        data:"name="+$("#name").val(),  
        type:"GET",  
        dataType: 'json',  
        url:"user/json1",
        contentType:"application/json",
        error:function(data){  
            alert("出错了！！:"+data.msg);           
        },  
        success:function(data){ 
        	alert("注册"+data.msg);
        	$("#chenggong").toggle()
        	url = "http://www.baidu.com";
            $("#result").html(data.msg);
            var i=$("span#time").html();
            for(j=0;j<i;j++){
            	var delay = document.getElementById("time").innerHTML;
            	(function(j){
            	setTimeout(function() {       
                  delay=i-j;
                  document.getElementById("time").innerHTML = delay;
                  if(delay==1){
                    window.top.location.href = url
                  }
                    console.log(delay);
            },1000*j);
           })(j);
            }
        }   
        });
	}
</script>    
</head>
 <body> 
       <input type="text" name="UserName" id="name"/>
       <input type="submit" value="登录" onclick="ajaxTest();"/> 
       <div id=result></div>
       <div id=chenggong style="display:none;">
                       登陆成功
       <span id="time" style="background: red;font-size:18px;">5</span>
                      秒钟之后自动跳转，如果不跳转，请点击下面链接<br>
       <a href="http://www.baidu.com">点击</a>
       </div>
    </body>
</html>
