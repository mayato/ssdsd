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
     
       
    </head>
    <body>
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
                        <li class="active"><a href="/ssdsd/admin/adminadd">增加商品</a>
                        </li>
                        <li><a href="#">库存管理</a>
                        </li>
                        <li><a href="#">订单管理</a>
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
                                                                    添加商品
                        </div>
                        <div class="panel-body">
                            <form action="/ssdsd/add/admin" role="form" class="form-inline" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="name">名称*</label>
                                    <input type="text" class="form-control" id="name" name="goodsName" placeholder="请输入名称">
                                    <label for="Type">种类*</label>
                                    <!-- <input type="text" class="form-control" id="Type" name="type" placeholder="请输入名称"><br> -->
                                    <select class="form-control" id="Type" name="Type" >
                                     <option value="竹篮">竹篮</option>
                                     <option value="竹席">竹席</option>
                                     <option value="竹筷">竹筷</option>
                                     <option value="竹椅">竹椅</option>
                                     <option value="竹笠">竹笠</option>
                                     <option value="竹筛">竹筛</option>
                                     <option value="竹扁担">竹扁担</option>
                                     <option value="竹蒸笼">竹蒸笼</option>
                                     <option value="竹耙">竹耙</option>
                                     <option value="竹家具">竹家具</option>
                                     <option value="竹地板">竹地板</option>
                                     <option value="竹背篓">竹背篓</option>
                                     <option value="竹雕">竹雕</option>
                                      </select><br>
                                    <label for="price">价格*</label>
                                    <input type="text" class="form-control" id="price" name="price" placeholder="请输入名称">
                                    <label for="remark">备注&nbsp;</label>
                                    <input type="text" class="form-control" id="remark" name="remark" placeholder="请输入名称"><br>
                                    <label for="introduce">简介&nbsp;</label>
                                    <input type="text" class="form-control" id="introduce" name="introduce" placeholder="请输入名称">
                                    <label for="place">产地&nbsp;</label>
                                    <input type="text" class="form-control" id="place" name="place" placeholder="请输入名称"><br>
                                    <label  for="inputfile">商品图片</label>
                                    <input type="file" id="inputfile" name="file" >
                                </div>
                                <div class="form-group" style ="vertical-align: bottom;">
                                    <button id=queryButton type="submit" class="btn btn-default">开始搜索</button>
                                    
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