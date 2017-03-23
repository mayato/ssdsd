<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>bookStore首页</title>
<%--导入css --%>
<link rel="stylesheet" href="/ssdsd/css/main.css" type="text/css" />
</head>

<body class="main">


	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
	<div id="divad">
		<img src="/ssdsd/img/welcome1.png"
	style="	width: 900px;height: 450px;
    "/>
	</div>

	<div id="divcontent">
		<table width="900px" border="0" cellspacing="0">
			<tr>
				<td width="497"><img src="/ssdsd/img/welcome.png" width="410";
					height="86" />
					<table cellspacing="0" class="ctl">
						<tr>
							<td>&middot;<a href="http://www.bamboo18.com/news/detail-20160603-12449.html" style="color:#000000">“互联网+”促成竹家具大订单</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="http://www.bamboo18.com/news/detail-20170314-12646.html" style="color:#000000">
									奉新弋阳发展“互联网 竹产业</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="http://www.800bamboo.com/personal/news_detail.shtml;jsessionid=3F1E92A3C559CF1BE57D34EBEA1F90CF?id=5995" style="color:#000000">
									中国竹制品，一个飞速发展的新产业</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="http://www.wood168.net/woodnews/47216.html" style="color:#000000">
									互联网+丨木竹联盟与TD联盟跨界合作</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="http://baike.baidu.com/link?url=UnhP8dtTydjzVheJTniJIFqY0x6UubC5jkqmg2sO97NDi6G1LedJEnv12SQ097sPFP71MDIZxP8wGiqzRFtlvXJROZQS9YiOMKO_1FvLaEx3nYcK8rgtt25L0bFldFQ3" style="color:#000000">
									竹制品有哪些？</a></td>
						</tr>
					</table></td>
				<td style="padding:5px 15px 10px 40px"><table width="100%"
						border="0" cellspacing="0">
						<tr>
							<td><img src="/ssdsd/img/top.jpg" width="300" height="50" style="padding-left:32px" />
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0">
						<tr>
							<td style="width:50; text-align:center"><a href="/ssdsd/goodsdetial/${goods[0].goodsId}"><img
									src="/ssdsd/upload/${goods[0].url}" width="102" height="130"
									border="0" /> </a><br /> <a href="/ssdsd/goodsdetial/${goods[0].goodsId}">${goods[0].goodsName}<br />
									已销售: ${goods[0].salenum}件</a></td>
							<td style="width:50; text-align:center"><a href="/ssdsd/goodsdetial/${goods[1].goodsId}"><img
									src="/ssdsd/upload/${goods[1].url}" width="102" height="130" border="0" />
							</a><br /> <a href="/ssdsd/goodsdetial/${goods[0].goodsId}">${goods[1].goodsName} <br /> 已销售:${goods[1].salenum}件</a>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	 <jsp:include page="foot.jsp"/> 


</body>
</html>
