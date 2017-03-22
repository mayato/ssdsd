<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style> 
#login {
position: absolute;
width:auto;
height:auto;
left:50%;
top:50%; 
margin-left:-150px;
margin-top:-100px;
border:1px solid #00F;
overflow: hidden
} 
</style>    
</head>
<body>
<div id="login" style="text-align:center;">
<h3>welcome to login page</h3>
<form action="/ssdsd/user/login2" method="POST">
<span>用户名：</span><input type="text" name="username"/><br>
<span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type="password" name="pwd" /><br>
<button type="submit">登陆</button>
<a href="/ssdsd/user/register"><button type="button">注册</button></a>
</form>
</div>


</body>
</html>