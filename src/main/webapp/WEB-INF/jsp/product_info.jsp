<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="/ssdsd/css/main.css" type="text/css" />
  <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
     <script type="text/javascript" src="<%=basePath%>layui/layui.js"></script>
</head>

<body class="main">

	<jsp:include page="head.jsp" />

	<jsp:include page="menu_search.jsp" />


	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="/ssdsd/index">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="/ssdsd/user/showview/product_list">&nbsp;${goods.type}</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${goods.goodsName} 
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="/ssdsd/img/detiallogo.jpg" width="870px" height="84" />

								<table width="100%%" border="0" cellspacing="0">
									<tr>
										<td width="30%">

											<div class="divbookcover">
												<p>
													<img src="/ssdsd/upload/${goods.url}"
														width="213" height="269" border="0" />
												</p>
											</div>

											<div style="text-align:center; margin-top:25px">
												<a href="<%=basePath%>cart/add?goodsId=${goods.goodsId}">
													<img src="/ssdsd/img/addtocar.png"  border="0"style="
                                               width: 200px; "/> 
												</a>
											</div></td>
										<td style="padding:20px 5px 5px 5px"><img
											src="/ssdsd/upload/${goods.url}" width="16" height="13" /><font
											class="bookname">&nbsp;&nbsp;${goods.goodsName}</font>

											<hr />售价：<font color="#FF0000">${goods.price}</font>
											<hr /> 
                                                                                                                                                类别 :${goods.type}
											<hr />
											产地 :${goods.place}
											<hr />
											<p>
												<b>简介:</b>
											</p> ${goods.introduce}</td>
									</tr>
								</table></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>


	<jsp:include page="foot.jsp" />

<script type="text/javascript">
var path = '<%=basePath%>';
layui.use([ 'layer', 'form'], function() {
	var $ = layui.jquery,
		layer = layui.layer, //获取当前窗口的layer对象
		form = layui.form();


});









</script>
</body>
</html>
