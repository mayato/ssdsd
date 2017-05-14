<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>

        <link href="/ssdsd/css/bootstrap/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
        <script src="/ssdsd/js/jquery-3.1.1.min.js"></script>
        <script src="/ssdsd/js/bootstrap/bootstrap.min.js"></script>
        <script src="/ssdsd/js/bootstrap/bootstrap-paginator.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>layui/layui.js"></script>
        <script src="/ssdsd/js/admindelivery.js"></script>
    </head>
    <body>
    <c:if test="${success!=null}">
<script>
alert("操作成功");
</script>
</c:if>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
                        <span class="sr-only">切换导航</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/ssdsd/admin">
                        <img src="/ssdsd/img/logoadmin.png" height="100%" />
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="example-navbar-collapse">
                    <ul class="nav navbar-nav"> 
                        <li ><a href="/ssdsd/admin/admingoods">商品查询</a>
                        </li>
                        <li><a href="/ssdsd/admin/adminadd">增修商品</a>
                        </li>
                        <li><a href="/ssdsd/admin/adminstore">库存管理</a>
                        </li>
                        <li ><a href="/ssdsd/admin/adminorder">订单管理</a>
                        </li>
                        <li class="active"><a href="/ssdsd/admin/admindelivery">出库单管理</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                    <c:if test="${sessionScope.aname!=null}">
                        <li><a>欢迎您,${sessionScope.aname}</a>
                        </li>
                        <li><a href="/ssdsd/cancel/admin">安全退出</a>
                        </li>
                      </c:if>
                       <c:if test="${sessionScope.aname==null}">
                       <li><a href="/ssdsd/admin/login">登陆</a>
                        </li>
                       </c:if>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            搜索
                        </div>
                        <div class="panel-body">
                            <form role="form" class="form-inline">
                                <div class="form-group">
                                    <label for="name">用户名</label>
                                    <input type="text" class="form-control" id="name" placeholder="请输入用户名">
                                </div>
                                <div class="form-group">
                                    <button id=queryButton type="button" class="btn btn-default">开始搜索</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--
                        列表展示
                    -->
                    <div class="table-responsive">
                        <table class="table table-striped ">
                            <thead>
                                <tr>
                                    <th>出库单id</th>
                                    <th>用户</th>
                                    <th>订单号</th>
                                    <th>价格</th>
                                    <th>时间</th>
                                    <th>地址</th>
                                </tr>
                            </thead>
                            <tbody id="tableBody">
			               </tbody>
                        </table>
                    </div>
                    <div id="bottomTab"></div>
                    <!-- <ul class="pagination" id="bottomTab1" style="float: right;">
                         <li><a href="#">&laquo;</a>
                        </li>
                        <li class="active"><a href="#">1</a>
                        </li>
                        <li class="disabled"><a href="#">2</a>
                        </li>
                        <li><a href="#">3</a>
                        </li>
                        <li><a href="#">4</a>
                        </li>
                        <li><a href="#">5</a>
                        </li>
                        <li><a href="#">&raquo;</a>
                        </li> 
                    </ul> -->
                    </div>
                </div>
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
                                    <th>仓库id</th>
                                    <th>仓库名称</th>
                                    <th>仓库地点</th>
                                </tr>
                            </thead>
                            <tbody id="deliveryBody">
			               </tbody>
                        </table>
                    </div>
      </div>
      <script id="deliveryTemplate" type="text/html">
  <tr>
  <td style="display:none;" class="id" value="" name="id"></td>
  <td class="deliveryId"></td>
  <td class="goodsId"></td>
  <td class="goodsName"></td>
  <td class="number"></td>
  <td class="goodsPrice"></td>
  <td class="totalPrice"></td>
  <td class="warehouseId"></td>
  <td class="warehouseName"></td>
  <td class="warehousePlace"></td>
  </tr>
</script>
       <script type="text/javascript">
       var path = '<%=basePath%>';
       layui.use(['layer', 'jquery','form'], function(){
    		var $ = layui.jquery,
    			layer = layui.layer;
       
       
       });
           //详情
           function  Modify(id){
        	var $ = layui.jquery
        	,layer = layui.layer
        	,form = layui.form();
        	var loading = layer.load(2);
           var data={'id':id}; 
           	 $.ajax({  
           	       data:data,
           	       type:"post",  
           	      dataType: 'json', 
           	       url:"/ssdsd/delivery/detail",
           	       error:function(data){ 
           	    	layer.close(loading);
           	           alert("服务器繁忙");  
           	       },
           	       success:function(data){
           	    	layer.close(loading);
           	    	   if(data.code=="1"){
           	    		   console.info(data);
           	    		$('#deliveryBody').html('');
           	    		$.each(data.list, function(i, detail) {
           	    			var deliveryEle = $($("#deliveryTemplate").get(0).innerHTML);
           	    			deliveryEle.find(".id").text(detail.id);
           	    			deliveryEle.find(".deliveryId").text(detail.deliveryId);
           	    			deliveryEle.find(".goodsId").text(detail.goodsId);
           	    			deliveryEle.find(".goodsName").text(detail.goodsName);
           	    			deliveryEle.find(".number").text(detail.number);
           	    			deliveryEle.find(".goodsPrice").text(detail.goodsPrice);
           	    			deliveryEle.find(".totalPrice").text(detail.totalPrice);
           	    			deliveryEle.find(".warehouseId").text(detail.warehouseId);
           	    			deliveryEle.find(".warehouseName").text(detail.warehouseName);
           	    			deliveryEle.find(".warehousePlace").text(detail.warehousePlace);
           	    			$('#deliveryBody').append(deliveryEle);
           	    		});
           	    	   }
           	       }
           	 });	  
         	var layerIdx = layer.open({
        		type: 1,
        		title: '出库单详情',
        		btn: ['关闭'],
        		area: ['960px', '500px'],
        		content: $('#detail'),
        		yes: function() {
        		            layer.close(layerIdx);
	        			}
        	});
         	
         	
           };
       
       </script> 
        
    </body>

</html>