<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>bookStore列表</title>
<%--导入css --%>
<link rel="stylesheet" href="/ssdsd/css/main.css" type="text/css" />
<link rel="stylesheet" href="/ssdsd/css/list.css" type="text/css" />
<script type="text/javascript" src="/ssdsd/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/ssdsd/js/list.js"></script>
</head>

<body class="main">

	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent" >
	<div id="main_content">
	<h1>${error}</h1>
	<ul class="pro_list" >
	<c:forEach items="${goods }" var="good"  varStatus="s"> 
	<li class="pro_item">
	<a href="/ssdsd/goodsdetial/${good.goodsId}" class="pro_img fl">
      <img src="/ssdsd/upload/${good.url}" alt="${good.goodsName }" title="${good.goodsName }">
     </a>
     <div class="right fr">
                 <p class="price">
                ${good.price}</p>
                  <p ></p>
                   <a class="go_detail" href="/ssdsd/goodsdetial/${good.goodsId}">查看详情</a>
     </div>  
                   <div class="text">
              <h3><a href="/ssdsd/goodsdetial/${good.goodsId}">${good.goodsName }</a></h3>
                        <ul class="pro_intro">
                           <li><span class="s1">产地：</span> ${good.place }</li>
                           <li><span class="s1">销量：</span>${good.salenum }
                           <li><span class="s1">类型：</span>${good.type }</li>
                        </ul>
                     </div>
	</li>
	</c:forEach>
	</ul> 
	</div>
	<div class="pagination" >
	
	<ul>
	<c:if  test="${page.pages!=0}">
	<c:if  test="${page.pages>5}">
	<c:if  test="${page.pageNum-2>0}" >
	<li class="prePage"><a  href="/ssdsd/findProductBySearch?page=${page.prePage}&name=${name}">上一页</a></li>
	<!-- <li class="disablepage">上一页 &lt;&lt;</li> -->
					<!-- <li class="currentpage">1</li> -->
			<c:if test="${page.pageNum+2>page.pages}">
		<c:forEach begin="${page.pages-4}" end="${page.pages}"  var="s"  step="1">        
					<li><a href="/ssdsd/findProductBySearch?page=${s}&name=${name}">${s}</a>
					</li>
				</c:forEach>	
			</c:if>
			<c:if test="${page.pageNum+2<page.pages+1}">		
	  <c:forEach begin="${page.pageNum-2}" end="${page.pageNum+2}"  var="s"  step="1">        
					<li><a href="/ssdsd/findProductBySearch?page=${s}&name=${name}">${s}</a>
					</li>	
	  </c:forEach>
		</c:if>	
	  </c:if>
	<c:if  test="${page.pageNum-2<1}" >
	 <li class="prePage"><a href="/ssdsd/findProductBySearch?page=${page.prePage}&name=${name}">上一页</a></li>
	<!-- <li class="disablepage">上一页 &lt;&lt;</li> -->
					<!-- <li class="currentpage">1</li> -->
	<c:forEach begin="1" end="5"  var="s"  step="1"> 
					<li><a href="/ssdsd/findProductBySearch?page=${s}&name=${name}">${s}</a>
					
					</li>		
	</c:forEach>
	</c:if>	
	</c:if>
	<c:if  test="${page.pages<6}">
	<li class="prePage"><a  href="/ssdsd/findProductBySearch?page=${page.prePage}&name=${name}">上一页</a></li>
	<c:forEach begin="1" end="${page.pages}"  var="s"  step="1">        
			<li><a href="/ssdsd/findProductBySearch?page=${s}&name=${name}">${s}</a>
			</li>
		</c:forEach>
	</c:if>			
	<li class="nextpage"><a href="/ssdsd/findProductBySearch?page=${page.nextPage}&name=${name}">下一页&gt;&gt;</a>
	</li>	
	</c:if>
	
					</ul>
	</div>	
	</div>
	<jsp:include page="foot.jsp" />

<div class="hide1">${page.pageNum}</div>
<div class="hide2">${page.pages}</div>
</body>
</html>
