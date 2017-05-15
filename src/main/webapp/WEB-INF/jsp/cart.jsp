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
<title>bookStore列表</title>
<%--导入css --%>
<link rel="stylesheet" href="/ssdsd/css/main.css" type="text/css" />
<link rel="stylesheet" href="/ssdsd/css/list.css" type="text/css" />
  <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<script type="text/javascript" src="/ssdsd/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/ssdsd/js/list.js"></script>
   <script type="text/javascript" src="<%=basePath%>layui/layui.js"></script>
</head>

<body class="main">

	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent" >
	<div id="main_content">
	<h1>${error}</h1>
	<ul class="pro_list" >
	<c:forEach items="${cartDetailList }" var="cart"  varStatus="s">
	<c:if test="${cart.number!=0}">
	<li class="pro_item">
	<input type="hidden" name="id" value="${cart.id}" class="id">
	<a href="/ssdsd/goodsdetial/${cart.goodsId}" class="pro_img fl">
      <img src="/ssdsd/upload/${cart.goodsUrl}" alt="${cart.goodsName }" title="${cart.goodsName }">
     </a>
     <div class="right fr">
                 <p class="price">
                ${good.price}</p>
                  <p ></p>
                   <a class="go_detail" style="background: #ef0000;" onclick="remove(this)">删除</a>
     </div> 
     <div class="text">
              <h3><a href="/ssdsd/goodsdetial/${cart.goodsId}">${cart.goodsName }</a></h3>
      </div>
      <div style="display: inline-block;">
       <label>单价
         <span class="price" style="font-size: 18px;line-height: 30px;color: #fc5656;">${cart.goodsPrice}</span>
         
        </label>
     </div>   
     <div style="margin: auto;height: 100px;width: 200px; display: inline-block;">
      <button class="layui-btn layui-btn-small layui-btn-primary "onclick="reduce(this)">
	   <i class="iconfont">&#xe6ba;</i>
	 <!--   <span>减少</span> -->
	  </button>
         <input type="text" name="num" style=" width: 30px;" value="${cart.number}" class="num">
      <button class="layui-btn layui-btn-small layui-btn-primary "onclick="add(this)">
        <i class="iconfont">&#xe6b9;</i>
        <!-- <span>增加 </span> -->
      </button>
     </div>
    <div style="display: inline-block;">
       <label>总价	
         <span class="total" style="font-size: 18px;line-height: 30px;color: #fc5656;">${cart.totalPrice}</span>
        </label>
     </div>  
	</li>
	</c:if> 
	</c:forEach>
	</ul>
	<div style=" overflow: hidden;">
	<button id="settlement" class="layui-btn layui-btn-normal" style="float: right;">结算</button>
	<span class="totalnum" style="font-size: 18px;line-height: 30px;color: #fc5656; float:right;margin-right: 10px;"></span>
	<span style="font-size: 18px;line-height: 30px;color: #393d49; float:right;" >总价：</span>
	</div> 
	</div>
	<div class="pagination" >
	
	</div>	
	</div>
	<jsp:include page="foot.jsp" />

<script type="text/javascript">
var path = '<%=basePath%>';
layui.use(['tree', 'layer', 'form'], function() {
	var $ = layui.jquery,
		layer = layui.layer, //获取当前窗口的layer对象
		form = layui.form();
	//绑定改变事件
	$('.pro_list').on("change",".num",function(){
		var select=$(this);
		var id=$(this).parents('li').find('.id').val();
	    var num= parseInt($(this).parent().find('.num').val());
/* 	    var price=$(this).parents('li').find('.price'); */
	    var total=num*parseInt($(this).parents('li').find('.price').text());
	    update(id,num,function(){
	    	if(num!=0){
	     	 $(select).parent().find('.num').val(num);
	     	 $(select).parents('li').find('.total').text(total);
	    	}
	    	else{
	   		/* $(select).parents('li').remove(); */
	   		remove(select);
	    	}
	    	total1();
	   	}); 
	})
	$('#settlement').on("click",function(){
		settlement();
		
	})
   total1();
});

//结算
function settlement(){
	var loading=layer.load(2);
	 var price=$(".totalnum").text();
		$.post(path + 'order/add', {
			price:price
			}, function(data) {
				console.info(data);
				layer.close(loading);
				if(data.code==1){
					console.info(data);
			layer.msg('下单成功', {icon: 1, time: 1000},function(){
				 window.location.href="/ssdsd/cart/list"; 	
			});
		    }if(data.code==-1){
				layer.msg('商品价格发生变动,请重新下单', {icon: 1, time: 1000},function(){
					window.location.href="/ssdsd/cart/list"; 	
				});	
		    }if(data.code==0){
				layer.msg('下单失败', {icon: 2, time: 1000},function(){
					 window.location.href="/ssdsd/cart/list"; 	 
				});	
		    }
		});

}
//填充总价

function total1(){
	
	var total=parseFloat(0);
	$(".total").each(function(){
		var num=parseFloat($(this).text());
		console.info(num);
		total+=num;	
	});
	console.info(total);
	$(".totalnum").text(total);
}


//减少
function reduce(that){
	var id=$(that).parents('li').find('.id').val();
   var num= parseInt($(that).parent().find('.num').val())-1;
   var total=num*parseInt($(that).parents('li').find('.price').text());
   update(id,num,function(){
	   
	  if(num!=0){
	  $(that).parents('li').find('.total').text(total);
  	  $(that).parent().find('.num').val(num);
	   }else{
		/* $(that).parents('li').remove(); */
		remove(that);
	   }
	  total1();
	}); 
}
//新增
function add(that){
  var id=$(that).parents('li').find('.id').val();
   var num= parseInt($(that).parent().find('.num').val())+1;
  /*  var price= $(that).parents('li').find('.price').text(); */
   var total=num*parseInt($(that).parents('li').find('.price').text());
   console.info(total);
    update(id,num,function(){
    	if(num!=0){
     $(that).parents('li').find('.total').text(total);
     $(that).parent().find('.num').val(num);
    	}
     else{
    	remove(that);
     }
    	total1();
    }); 
}


//更新数量
function  update(id,number,callback){
	var $ = layui.jquery
	,layer = layui.layer;
	var loading = layer.load(2);
	$.post(path + 'cart/update', {
		number:number,
		id:id
		}, function(data) {
			console.info(data);
			layer.close(loading);
			if(data.code==1){
		if (typeof callback == "function") {
			callback(data);
		}
	}
	});
	
	
}



//删除
function remove(that){
	var $ = layui.jquery
	,layer = layui.layer;

	var column = $(that).parents('li');
	var id = column.find('.id').val();
	layer.confirm('确认删除？', {icon: 0, title: '提示'}, function(index){
	var loading = layer.load(2);
	doRemoveRole([{name: 'id', value: id}], function(data) {
		layer.close(loading);
		if (data.code == 1) {
			layer.msg('删除成功', {icon: 1, time: 1000});
			 $(that).parents('li').remove();
			 total1();
		} else {
			layer.msg(data.msg, {icon: 2, time: 1000});
		}
	});
	layer.close(index);
});
}


function doRemoveRole(id, callback) {
	var $ = layui.jquery;
	$.post(path + 'cart/delete', id, function(data) {
		if (typeof callback == "function") {
			callback(data);
		}
	});
}	



</script>
</body>
</html>
