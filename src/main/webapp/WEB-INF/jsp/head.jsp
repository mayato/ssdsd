<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="divhead">
	<table cellspacing="0" class="headtable">
		<tr>
			<td><a href="/ssdsd/index"><img src="/ssdsd/img/logo.png"
					width="200" height="30" border="0" /> </a></td>
					
				<c:if test="${sessionScope.uname!=null}">
			<td id="nouser" style="text-align:right;color:red"><img src="/ssdsd/img/cart.png"
				width="26" height="23" style="margin-bottom:-4px" />&nbsp;
				<a href="cart.jsp">购物车</a>||欢迎用户:${sessionScope.uname}|<a href="/ssdsd/user/cancel">退出登陆</a></td>
				  </c:if>
				  <c:if test="${sessionScope.uname==null}">
			<td id="haveuser" style="text-align:right"><img src="/ssdsd/img/tologin.png"
				width="26" height="23" style="margin-bottom:-4px" />&nbsp;
				 <a href="/ssdsd/user/showview/login">用户登陆</a>|<a href="/ssdsd/user/showview/register">新用户注册</a>
				 </td>
				 </c:if>
				
		</tr>
	</table>
	
</div>