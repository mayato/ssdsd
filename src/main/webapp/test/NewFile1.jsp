<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $('#addressSearch').bind('input propertychange', function() {   
	   alert("1");
	});
});
 </script>  
</head>
<body>
<input class="cot_input" id="addressSearch"  type="text" placeholder="搜索姓名" value="" style="border: 1px solid #f4f0f0;" />  


</body>
</html>