<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Signin Template for Bootstrap</title>
    <link href="/ssdsd/css//bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/ssdsd/css/signin.css" rel="stylesheet">
  </head>

  <body>
<c:if test="${error!=null}">
<script>
alert("用户名或密码错误");
</script>
</c:if>

    <div class="container">
      <form class="form-signin" action="/ssdsd/login/admin" method="post">
        <h2 class="form-signin-heading">请登陆</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" id="inputname" name="name" class="form-control" placeholder="用户名" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="密码" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住用户名和密码
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
      </form>

    </div> 


    
    
  </body>
</html>