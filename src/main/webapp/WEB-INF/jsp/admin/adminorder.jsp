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
        <script src="/ssdsd/js/adminorder.js"></script>
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
                        <li class="active"><a href="/ssdsd/admin/adminorder">订单管理</a>
                        </li>
                        <li ><a href="/ssdsd/admin/admindelivery">出库单管理</a>
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
                                    <th>订单ID</th>
                                    <th>用户</th>
                                    <th>状态</th>
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
                                    <th>仓库</th>
                                    <th>库存数量</th>
                                </tr>
                            </thead>
                            <tbody id="orderBody">
                           
			               </tbody>
                        </table>
                    </div>
      </div>
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
  <td>	
    <select class="store" name="store">
	</select>
 </td>
 <td class="number1">0</td>
  </tr>
</script>
       <script type="text/javascript">
       var path = '<%=basePath%>';
       layui.use(['layer', 'jquery','form'], function(){
    		var $ = layui.jquery,
    			layer = layui.layer;
      //下拉框绑定事件
       $("#orderBody").on("change",".store",function(){
    	   
    	  var number= $(this).children("option:selected").attr("number");
    	   $(this).parents("tr").find(".number1").text(number);    	   
    	   
       });
       
       });
       //删除
       function  goodsdelete(id){
    	   layer = layui.layer;
    	   layer.confirm('确认删除 ？', {icon: 0, title: '提示'}, function(index){
       	$("#tr"+ id).remove();       	
           var date={'id':id}; 
           	 $.ajax({  
           	       data:date,
           	       type:"post",  
           	       dataType: 'json', 
           	       url:"/ssdsd/order/delete",
           	       error:function(data){  
           	           alert("服务器繁忙");  
           	       },
           	       success:function(data){
           	    	   console.info(data);
           	    	   if(data.code=="1"){	   
           	    		   $("#tr"+ id).remove();
           	    	   }
           	       }
           	 });
           	layer.close(index);
    	   });
           };
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
           	    			$.each(detail.storeList, function(i, store) {
           	    				orderEle.find(".store").append("<option value='"+store.warehouse.warehouseId+"'"
           	    						+"text='"+store.warehouse.warehouseName+"'"
           	    						+"text1='"+store.warehouse.warehousePlace+"'"
           	    						+"number='"+store.number+"'>"+store.warehouse.warehouseName+"</option>");
           	    			});
           	    			$('#orderBody').append(orderEle);
           	    		});
           	    	   }
           	       }
           	 });	  
         	var layerIdx = layer.open({
        		type: 1,
        		title: '订单详情',
        		btn: ['发货', '关闭'],
        		area: ['960px', '500px'],
        		content: $('#detail'),
        		success: function(){
  			   var text=  $(that).parents("tr").find(".state").attr("text");
        		if(text==1){
        			$(".layui-layer-btn0").hide();
        		}	
        		},
        		yes: function() {
        			var data={};
        			var error=0;
        			var list=[];
                     $("#orderBody tr").each(function(i,detail){
                    	 var param={};
                    	 /* param.detailId=$(detail).find(".id").attr("value"); */
                    	 param.goodsUrl=$(detail).find(".goodsUrl").attr("value");
                    	 param.orderId=$(detail).find(".orderId").attr("text");
                    	 param.goodsId=$(detail).find(".goodsId").attr("text");
                    	 param.goodsName=$(detail).find(".goodsName").attr("text");
                    	 param.number=$(detail).find(".number").attr("text");
                    	 param.goodsPrice=$(detail).find(".goodsPrice").attr("text");
                    	 param.totalPrice=$(detail).find(".totalPrice").attr("text");
                    	 param.warehouseId=$(detail).find("select[name=store] option:selected").val();
                    	 param.warehouseName=$(detail).find("select[name=store] option:selected").attr("text");
                    	 param.warehousePlace=$(detail).find("select[name=store] option:selected").attr("text1");
                    	 if($(detail).find("select[name=store] option:selected").val()==null||
                           $(detail).find("select[name=store] option:selected").val()==""){
                    		 error=1;
                    	 }
                    	 list.push(param);
                     })
                     if(error==1){
                    	 layer.msg("仓库不能为空", {icon: 2, time: 2000}); 
                    	 return;
                     }
                     data.id=id;
                     data.list=list;
                     console.info(list);
                     console.info(data);
        			var loading = layer.load(2);
     			$.ajax({
                        type: "POST",
                        contentType: "application/json;charset=utf-8", 
                        url: path + 'delivery/add',
                    	 data: JSON.stringify(data), 
                        success: function (data) {
            				if (data.code == 1) {
            		            layer.close(layerIdx);
            					layer.close(loading);
            					buildTable("",1,15);
            		            layer.msg('发货成功', {icon: 1, time: 1000});
            				} else {
            					layer.close(loading);
            		            layer.msg("失败", {icon: 2, time: 1000});
            				}
                        },
                        error: function (data) {
                        	
                        }
                    }); 
        			return false;
        		}
        	});
           };
       
       </script> 
        
    </body>

</html>