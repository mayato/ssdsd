<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	  });  
   $(function(){
		$("#sub").click(function(){
			var pwd = $("input[name='password']").val();
			var cpwd = $("input[name='repassword']").val();
			if(pwd != cpwd){
				alert("两次密码不一致!");
				$("input[name='password']").val("");
				$("input[name='repassword']").val("");
				return false;
			}
			if($("input[name='userName']").val()==""){
				alert("账号不能为空");
				return false;
			}
			if($("input[name='password']").val()==""){
				alert("密码不能为空");
				return false;
			}
			if($("input[name='email']").val()==""){
				alert("邮箱不能为空");
				return false;
			}
			
		});
	});
   </script>  
</head>
<body>
  <section class="container">
    <div class="login" >
      <h1>注册</h1>
      <form action="/ssdsd/user/register" method="post" id="user">
        <p><input id="txt_username" type="text" name="userName"  placeholder="用户名" ><span>*</span>${error}</p>
        <p><input id="txt_password"type="password" name="password" placeholder="密码"><span>*</span></p>
        <p><input id="txt_password"type="password" name="repassword" placeholder="重复密码"><span>*</span></p>
        <p><input id="txt_password"type="email" name="email" placeholder="邮箱" required ><span>*</span></p>
        <p><input id="txt_password"type="text" name="tel" placeholder="手机号"></p>
        <p class="remember_me">
          <label>
            <input type="radio" name="sex" id="ck_rmbUser" value="男" checked="checked">
                                男
          </label>
          <label>
            <input type="radio" name="sex" value="女" id="ck_rmbUser">
                                女
          </label>
        </p>
        <p class="submit"><a href="/ssdsd/user/showview/login"><input type="button" value="返回"><input type="submit" name="commit" value="确认" id="sub"></a></p>
      </form>      
    </div>
    <!-- <div class="login-help">
      <p><a href="index.html">忘记密码?</a>.</p>
    </div> -->
  </section>
<div style="text-align:center; ">
六四一竹制品购物网站
</div>
</body>
</html>
