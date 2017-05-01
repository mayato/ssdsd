<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 页面</title>
    <style type="text/css">
    *{margin:0;padding:0;}
    html{height: 100%}
    body {
    font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;font-size: 13px;color: #676a6c;overflow-x: hidden;height: 100%;background: #eee;}
    .page-404{max-width: 400px;z-index: 100;margin: 0 auto;padding-top: 40px;text-align: center;}
    .page-404 h1{font-size: 170px;margin:0; font-weight: 100;}
    .page-404 h3{font-size: 16px;margin-top: 5px;margin-bottom: 10px;font-weight: 600;}
    .page-404 .error-desc{color: #676a6c;line-height: 32px;font-size: 0;}
    .page-404 .error-desc span{font-size: 13px;}
    .page-404 .error-desc .form-control{height: 38px;line-height: 38px;padding-left: 10px;border: 1px solid #e6e6e6;border-radius: 2px;margin-right: 5px;width: 200px;outline: none;}
    .page-404 .error-desc .btn-primary{height: 38px;line-height: 38px;padding: 0 18px;background-color: #009688;color: #fff;white-space: nowrap;text-align: center;
    border: none;border-radius: 2px;cursor: pointer;opacity: .9;}
    </style>
</head>
<body class="gray-bg">
    <div class="page-404">
        <h1></h1>
        <h3 class="font-bold"></h3>
        <div class="error-desc">
            <span>641有事离开了下</span>
            <form action="/search.html">
                
            
            </form>
        </div>
    </div>
</body>
</html>
