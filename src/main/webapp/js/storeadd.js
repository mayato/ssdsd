$(function(){
	 var _orderType=$("#_orderTypes").val();
	   if(_orderType!=""){
	   $("#Type").val(_orderType);
	   }
	   value();
	   $('#goodsId').bind('input propertychange', function() {
		   value()
	 	}); 
	   $('#warehouseId').bind('input propertychange', function() {
		   value()
	 	});   
});
function value(){
	
	var goodsId=Number($("#goodsId").val());
	   var warehouseId=Number($("#warehouseId").val());
	   var data={'goodsId':goodsId,'warehouseId':warehouseId }; 
	   $.ajax({
		   data:data,
	       type:"post",
	       dataType: 'json', 
	       url:"/ssdsd/admin/addstore",
	       async:false,
	       error:function(data){  
	           alert("请输入数字");  
	       },
	       success:function(data){
	    	   if(data.msg=="1"){
	    		   if(data.goods==null){
	    			   $("#goodsName").val("");
	    		   }
	    		   else
	    			   {
	    			   $("#goodsName").val(data.goods.goodsName);
	    			   }
	    		   if(data.warehouse==null){
	    			   $("#warehouseName").val("");
	    		   }
	    		   else
	    			   {
	    			   $("#warehouseName").val(data.warehouse.warehouseName);
	    			   }
	    		 
	    	   }
	       }
	   });
	
	
}






