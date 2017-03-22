<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/my.js">
	
</script>
<script type="text/javascript">
<!--
	function fillNameValue(subDiv) {
		document.getElementById("name").value = subDiv.innerHTML;
		
		document.getElementById("content").style.display="none";
	}

	function searchName() {
		var nameElement = document.getElementById("name");
		//获取输入的信息
		var nameValue = nameElement.value;

		var div = document.getElementById("content");
		div.innerHTML = "";
		//1.获取XMLHttpRequest对象
		var xmlhttp = getXMLHttpRequest();

		//2.绑定回调函数
		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var jsonObj = eval("(" + xmlhttp.responseText + ")");
				
				if(jsonObj.length>0){
					document.getElementById("content").style.display="block";
					for ( var i = 0; i < jsonObj.length; i++) {
						div.innerHTML += "<div onclick='fillNameValue(this)' onmouseover='changeBackground_over(this)' onmouseout='changeBackground_out(this)'>"
								+ jsonObj[i] + "</div>"
					}
				}

			}
		};
		//3.open
		xmlhttp.open("GET",
				"${pageContext.request.contextPath}/findProductName?name="
						+ window.encodeURIComponent(nameValue, "utf-8")
						+ "&time=" + new Date().getTime());
		//4.send
		xmlhttp.send(null);
	};
	
	function changeBackground_over(div){
		div.style.background="gray";
	}
	
	function changeBackground_out(div){
		div.style.background="white";
	}
//-->
</script>

<div id="divmenu">
	<a
		href="${pageContext.request.contextPath}/goodstype/竹篮">竹篮</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹席">竹席</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹筷">竹筷</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹椅">竹椅</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹扫帚">竹扫帚</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹笠">竹笠</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹筛">竹筛</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹扁担">竹扁担</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹蒸笼">竹蒸笼</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹耙">竹耙</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹家具">竹家具</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹地板">竹地板</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹背篓">竹背篓</a>
	<a
		href="${pageContext.request.contextPath}/goodstype/竹雕">竹雕</a>
	<a href="${pageContext.request.contextPath}/goodslist"
		style="color:#FFFF00">全部商品目录</a>
</div>
<div id="divsearch" style="
    height: 20px;">	

	<form action="${pageContext.request.contextPath}/findProductBySearch"
		method="post">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td style="text-align:right; padding-right:220px">
			     查询商品 <input
					type="text" name="name" class="inputtable" placeholder="商品名" onkeyup="searchName();"
					id="name" /> 
					<input type="image" src="/ssdsd/img/buttonsearch.png"
					border="0" style="margin-bottom:-5px;height:20px;">
				</td>
			</tr>
		</table>

	</form>
</div>
<div id="content"
	style="background-color:white;width:128px; text-align:left;margin-left:945px;color:black;float:left;margin-top: -20px;display: none">
</div>	