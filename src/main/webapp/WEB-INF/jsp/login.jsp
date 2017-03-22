<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html">
  <title>Login Form</title>
  <link rel="stylesheet" href="/ssdsd/css/style1.css">
  <script type="text/javascript" src="/ssdsd/js/jquery-3.1.1.min.js"></script>
  <script src="/ssdsd/js/jquery.cookie.js" type="text/javascript"></script>
  <script type="text/javascript">
   $(document).ready(function () {
	    if ($.cookie("rmbUser") == "true") {
	    $("#ck_rmbUser").attr("checked", true);
	    $("#txt_username").val($.cookie("username"));
	    $("#txt_password").val($.cookie("password"));
	    $('#txt_username').bind('input propertychange', function() {   
	    	 $("#txt_password").val("");
	 	});   
	    }
	  });
   function ajaxTest(){  
       $.ajax({  
       data:$('#user').serialize(),  
       type:"GET",  
       dataType: 'json',  
       url:"/ssdsd/user/loginjson",
       async:false,
       contentType:"application/json",
       /* error:function(data){  
           alert("出错了！！:"+data.msg);           
       },   */
       success:function(data){ 
        if (data.msg=="成功"){
        	alert("成功");
        	 if ($("#ck_rmbUser").prop("checked")) {
        	      var str_username = $("#txt_username").val();
        	      var str_password = $("#txt_password").val();
        	      $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
        	      $.cookie("username", str_username, { expires: 7 });
        	      $.cookie("password", str_password, { expires: 7 });
        	    }
        	    else {
        	      $.cookie("rmbUser", "false", { expire: -1 });
        	      $.cookie("username", "", { expires: -1 });
        	      $.cookie("password", "", { expires: -1 });
        	    }
         window.location.href="/ssdsd/user/showview/validate";  
        }
        else
        {	alert("账号或密码错误"+data.msg);
        $("#txt_username").val("");
	    $("#txt_password").val("");
        	
        }
	}
       
       });
      
   }
   </script>  
</head>
<body>
<c:if test="${resuccess!=null}">
<script>
alert("注册成功");
</script>
</c:if>
  <section class="container">
    <div class="login" >
      <h1>用户登录</h1>
      <form method="post" id="user">
        <p><input id="txt_username" type="text" name="userName"  placeholder="用户名" ></p>
        <p><input id="txt_password"type="password" name="password"  placeholder="密码"></p>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="ck_rmbUser">
                        记住用户名和密码
          </label>
        </p>
        
        <p class="submit"><a href="/ssdsd/user/showview/register"><input type="button" value="注册"><input type="submit" name="commit" value="登录" onclick="ajaxTest();return false;"></a></p>
      </form>
      
    </div>
      
    
  </section>
<div style="text-align:center; ">
六四一竹制品购物网站
</div>
</body>
</html>
