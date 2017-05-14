<%@ page language="java" contentType="text/html; charset=utf-8"

    pageEncoding="utf-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <link href="/ssdsd/css/bootstrap/bootstrap.min.css" rel="stylesheet">
        <script src="/ssdsd/js/jquery-3.1.1.min.js"></script>
        <script src="/ssdsd/js/bootstrap/bootstrap.min.js"></script>
        <script src="/ssdsd/js/storeadd.js"></script>
    </head>
    <body>
   <c:if test="${success!=null}">
<script>
alert("操作成功");
</script>
</c:if>
       <!-- 储存 -->
     <input type="hidden" id="_orderTypes"  value="${goods.type}"/>
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
                        <li ><a href="/ssdsd/admin/adminadd">增修商品</a>
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
                        商品信息管理
                        </div>
                        <div class="panel-body">
                            <form action="/ssdsd/admin/updatestore" role="form" class="form-inline" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                 <input type="hidden" id="sId" name="sId" value="${store.sId}"/>
                                    <label for="name">商品ID*&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <input type="text" class="form-control" id="goodsId" name="goodsId" placeholder="请输入商品ID"  value="${store.goodsId}" required>
                                    <label for="Type">商品名称</label>
                                    <input type="text" class="form-control" id="goodsName" name="goodsName" readonly="readonly" ><br>    
                                    <label for="remark">仓库ID*&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <input type="text" class="form-control" id=warehouseId name="warehouseId" placeholder="请输入仓库ID" value="${store.warehouseId}"required>
                                    <label for="introduce">仓库名称</label>
                                    <input type="text" class="form-control" id="warehouseName" name="warehouseName" readonly="readonly">   <br>       
                                    <label for="price">库存数量*</label>
                                    <input type="text" class="form-control" id="number" name="number" placeholder="请输入数量" value="${store.number}"required>
                                    <label for="place">备注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <input type="text" class="form-control" id="remark" name="remark" placeholder="请输入备注" value="${store.remark}"><br>
                                </div>
                                <div class="form-group" style ="vertical-align: bottom;">
                                    <button id=queryButton type="submit" class="btn btn-default">确认提交</button>
                                    
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--
                        列表展示
                    -->
                    
                    
                </div>
            </div>
        </div>
    </body>

</html>