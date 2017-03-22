<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html">
  <title>Login Form</title>
  <link rel="stylesheet" href="/ssdsd/css/style1.css">
  <script type="text/javascript" src="/ssdsd/js/jquery-3.1.1.min.js"></script>
   <script type="text/javascript">
   $(document).ready(function () {
	   url = "/ssdsd/login.jsp";
       var i=$("span#dalay").html();
       for(j=0;j<=i;j++){
       	var delay = document.getElementById("dalay").innerHTML;
       	(function(j){
       	setTimeout(function() {       
             delay=i-j;
             document.getElementById("dalay").innerHTML = delay;
             if(delay==0){
               window.top.location.href = url
             }
               console.log(delay);
       },1000*j);
      })(j);
       }
   });
   </script>
</head>
<body>
  <section class="container">
    <div class="login">
      <h1>注册成功</h1>
      <span id="dalay">3</span>秒后开始跳转,如果不跳转，请点击下面按钮
      <p class="submit"><a href="/ssdsd/login.jsp"><input type="button" value="返回"></a></p>
  </section>
<div style="text-align:center;">
六四一竹制品购物网站
</div>
</body>
</html>
