<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>bookStore列表</title>
<%--导入css --%>
 <link href="/ssdsd/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/ssdsd/css/main.css" type="text/css" />
<link rel="stylesheet" href="/ssdsd/css/list.css" type="text/css" />
  <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<script type="text/javascript" src="/ssdsd/js/jquery-3.1.1.min.js"></script>
<script src="/ssdsd/js/bootstrap/bootstrap.min.js"></script>
 <script src="/ssdsd/js/bootstrap/bootstrap-paginator.min.js"></script>
<script type="text/javascript" src="/ssdsd/js/list.js"></script>
   <script type="text/javascript" src="<%=basePath%>layui/layui.js"></script>
  <style type="text/css">
  
/*   .layui-elem-field{margin-top: 1px; } */
      	.layui-inline-short {width: 330px;display: inline-block;}
    	.layui-inline-short-right{    float: right; margin-right: 100px;}
  </style> 
</head>


<body class="main">

	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent" >
	<div id="main_content">
   <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
  <ul class="layui-tab-title">
    <li class="layui-this">用户信息</li>
    <li>订单信息</li>
  </ul>
  <div class="layui-tab-content" style="margin:10px auto;padding:20px;width:960px;border:1px solid #e2e2e2;">
    <div class="layui-tab-item layui-show">
    <form class="layui-form" id="user" action="">
     <div class="layui-form-item">
      <div class="layui-inline-short ">
      <label class="layui-form-label">用户名</label>
      <div class="layui-input-inline">
        <input type="tel" name="userName"value="${user.userName}"  disabled lay-verify="" autocomplete="off" class="layui-input">
      </div>
     </div>
    <div class="layui-inline-short layui-inline-short-right">
      <label class="layui-form-label">修改密码</label>
      <div class="layui-input-inline">
        <input type="text" name="password" lay-verify="" autocomplete="off" class="layui-input" value="${user.password}">
      </div>
     </div>
    </div>
         <div class="layui-form-item">
      <div class="layui-inline-short ">
      <label class="layui-form-label">邮箱</label>
      <div class="layui-input-inline">
        <input type="text" name="email"value="${user.email}"   lay-verify="email" autocomplete="off" class="layui-input">
      </div>
     </div>
    <div class="layui-inline-short layui-inline-short-right">
      <label class="layui-form-label">手机</label>
      <div class="layui-input-inline">
        <input type="tel" name="tel" lay-verify="phone" autocomplete="off" class="layui-input" value="${user.tel}">
      </div>
     </div>
    </div>
         <div class="layui-form-item">
      <div class="layui-inline-short ">
      <label class="layui-form-label">性别</label>
      <div class="layui-input-inline">
        <input type="radio" name="sex" value="男" title="男" <c:if test="${user.sex=='男'}">checked="checked"</c:if>>
        <input type="radio" name="sex" value="女" title="女" <c:if test="${user.sex=='女'}">checked="checked"</c:if>>
      </div>
     </div>
    <div class="layui-inline-short layui-inline-short-right">
      <label class="layui-form-label">会员积分</label>
      <div class="layui-input-inline">
        <input type="text" name="userPoints"  disabled lay-verify="" autocomplete="off" class="layui-input" value="${user.userPoints}">
      </div>
     </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-inline-short ">
      <label class="layui-form-label">收货地址</label>
      <div class="layui-input-inline">
        <input type="text" name="userAddress"value="${user.userAddress}"   lay-verify="" autocomplete="off" class="layui-input">
      </div>
     </div>
     
    <div class="layui-inline-short layui-inline-short-right">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
    </div>
     
    </div>

    </form>
    
    </div>
    <div class="layui-tab-item">

		<table class="layui-table">
		  <thead>
		    <tr>
		      <th>订单号</th>
		      <th>状态</th>
		      <th>订单时间</th>
		      <th>用户名</th>
		      <th>价格</th>
		      <th>配送地址</th>
		      <th>详情</th>
		      
		    </tr> 
		  </thead>
		  <tbody>
		     <c:forEach items="${orderList }" var="order"  varStatus="s">
		       <tr>
		        <td>${order.id}</td>
		        <td>
		        <c:if test="${order.state==0}">未处理</c:if>
		        <c:if test="${order.state==1}">已发货</c:if>
		        <c:if test="${order.state==2}">订单取消</c:if>
		        </td>
		        <td><fmt:formatDate value="${order.orderTime }" pattern="yyyy-MM-dd HH:mm"/></td>
		        <td>${order.userName}</td>
		        <td>${order.price}</td>
		        <td>${order.orderAddress}</td>
		        <td><button   class="layui-btn layui-btn-primary layui-btn-small" onclick="goodsModify(${order.id});return false;">详情</button> </td>
		       </tr>
		       </c:forEach>
		  </tbody>
		</table>

   
    
    
    
    </div>
    <div id="detail" style="display:none;padding:20px 20px 10px 0px;">
                    <div class="table-responsive">
                        <table class="table table-striped ">
                            <thead>
                                <tr>
                                    <th>订单ID</th>
                                    <th>商品</th>
                                    <th>商品名称</th>
                                    <th>商品数量</th>
                                    <th>商品单价</th>
                                    <th>总共价格</th>
                                </tr>
                            </thead>
                            <tbody id="orderBody">
                           
			               </tbody>
                        </table>
                    </div>
      </div>
  </div>
</div> 
   
   
	
	
	</div>
	<div class="pagination" >
	
	</div>	
	</div>
	<jsp:include page="foot.jsp" />
<script id="orderTemplate" type="text/html">
  <tr>
  <td style="display:none;" class="id" value="" name="id"></td>
  <td style="display:none;" class="goodsUrl" value="" name="goodsUrl"></td>
  <td class="orderId" text=""></td>
  <td class="goodsId"></td>
  <td class="goodsName"></td>
  <td class="number"></td>
  <td class="goodsPrice"></td>
  <td class="totalPrice"></td>
  </tr>
</script>

<script type="text/javascript">
var path = '<%=basePath%>';
layui.use(['tree', 'layer', 'form','element'], function() {
	var $ = layui.jquery,
		layer = layui.layer, //获取当前窗口的layer对象
		form = layui.form();
	
	  //监听提交
	  form.on('submit(demo1)', function(data){
			var loading = layer.load(2, {shade: [0.2,'#000']});
			$.post(path + 'user/update', $("#user").serialize(), function(data) {
				 console.info(data); 
				layer.close(loading);
				if (data.code == 1) {
					layer.msg("成功", {icon: 1, time: 1000});
						setTimeout(function () { 
							window.location.href="<%=basePath%>user/detail";
					    }, 1000);		
				} else {
					layer.msg("失败", {icon: 2, time: 1000});
				}
			}); 
	    return false;
	  });
});
//详情
function  goodsModify(id,that){
	var $ = layui.jquery
	,layer = layui.layer
	,form = layui.form();
	var loading = layer.load(2);
var data={'id':id}; 
	 $.ajax({  
	       data:data,
	       type:"post",  
	      dataType: 'json', 
	       url:"/ssdsd/order/detail",
	       error:function(data){ 
	    	layer.close(loading);
	           alert("服务器繁忙");  
	       },
	       success:function(data){
	    	   console.info(data);
	    	layer.close(loading);
	    	   if(data.code=="1"){
	    		   console.info(data);
	    		$('#orderBody').html('');
	    		$.each(data.list, function(i, detail) {
	    			var orderEle = $($("#orderTemplate").get(0).innerHTML);
	    			orderEle.find(".id").attr("value",detail.id);
	    			orderEle.find(".goodsUrl").attr("value",detail.goodsUrl);
	    			
	    			orderEle.find(".orderId").text(detail.orderId);
	    			orderEle.find(".orderId").attr("text",detail.orderId);
	    			
	    			orderEle.find(".goodsId").text(detail.goodsId);
	    			orderEle.find(".goodsId").attr("text",detail.goodsId);
	    			
	    			orderEle.find(".goodsName").text(detail.goodsName);
	    			orderEle.find(".goodsName").attr("text",detail.goodsName);
	    			
	    			orderEle.find(".number").text(detail.number);
	    			orderEle.find(".number").attr("text",detail.number);
	    			
	    			orderEle.find(".goodsPrice").text(detail.goodsPrice);
	    			orderEle.find(".goodsPrice").attr("text",detail.goodsPrice);
	    			
	    			orderEle.find(".totalPrice").text(detail.totalPrice);
	    			orderEle.find(".totalPrice").attr("text",detail.totalPrice);

	    			$('#orderBody').append(orderEle);
	    		});
	    	   }
	       }
	 });	  
	var layerIdx = layer.open({
		type: 1,
		title: '订单详情',
		btn: ['关闭'],
		area: ['960px', '500px'],
		content: $('#detail')
	});
}

</script>
</body>
</html>
