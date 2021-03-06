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
        <script src="/ssdsd/js/adminstore.js"></script>
    </head>
    <body>
    <c:if test="${success==1}">
<script>
alert("操作成功");
</script>
</c:if>
 <c:if test="${success==0}">
<script>
alert("库存已存在");
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
                      
                        <li><a href="/ssdsd/admin/admingoods">商品查询</a>
                        </li>
                        <li><a href="/ssdsd/admin/adminadd">增修商品</a>
                        </li>
                        <li class="active"><a href="/ssdsd/admin/adminstore">库存管理</a>
                        </li>
                        <li><a href="/ssdsd/admin/adminorder">订单管理</a>
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
                                    <label for="name">名称</label>
                                    <input type="text" class="form-control" id="name" placeholder="请输入名称">
                                    
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
                      <button id=newButton type="button" class="btn btn-default">新增</button>
                        <table class="table table-striped ">
                            <thead>
                                <tr>
                                    <th>库存ID</th>
                                    <th>商品ID</th>
                                    <th>商品名称</th>
                                    <th>库存数量</th>
                                    <th>仓库ID</th>
                                    <th>仓库名称</th>
                                    <th>备注</th>
                                </tr>
                            </thead>
                            <tbody id="tableBody">
			               </tbody>
                            <!-- <tbody>
                                <tr>
                                    <td>15</td>
                                    <td>
                                        <img src="img/test.jpg" class="img-thumbnail" style="height: 30px;" />
                                    </td>
                                    <td>超人气无花果</td>
                                    <td>18.00￥</td>
                                    <td>18.00￥</td>
                                    <td>上架</td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="" class="btn btn-default">修改</a><a href="" class="btn btn-danger">删除</a>
                                        </div>
                                    </td>
                                </tr>
                            </tbody> -->
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
        
        <script type="text/javascript">
        var path = '<%=basePath%>';
        layui.use(['layer', 'jquery'], function(){
     		var $ = layui.jquery,
     			layer = layui.layer;
        
        
        });
        function  goodsdelete(sId){
     	   layer = layui.layer;
    	   layer.confirm('确认删除 ？', {icon: 0, title: '提示'}, function(index){
        	$("#tr"+ sId).remove();       	
            var date={'id':sId}; 
            	 $.ajax({  
            	       data:date,
            	       type:"post",  
            	     dataType: 'json', 
            	       url:"/ssdsd/admin/cancelstore",
            	       async:false,
            	       error:function(data){  
            	           alert("服务器繁忙");  
            	       },
            	       success:function(data){
            	    	   if(data.msg=="1"){	   
            	    		   $("#tr"+ sId).remove();
            	    	   }
            	       }
            	 });
                	layer.close(index);
    	   });
            };
        
        
        
        
        </script>
    </body>

</html>