       



     var PAGESIZE = 15;
        var options = {  
            currentPage: 1,  //当前页数
            totalPages: 10,  //总页数，这里只是暂时的，后头会根据查出来的条件进行更改
            size:"normal",  
            alignment:"center",  
            itemTexts: function (type, page, current) {  
                switch (type) {  
                    case "first":  
                        return "第一页";  
                    case "prev":  
                        return "前一页";  
                    case "next":  
                        return "后一页";  
                    case "last":  
                        return "最后页";  
                    case "page":  
                        return  page;  
                }                 
            },  
            onPageClicked: function (e, originalEvent, type, page) {  
            	var goodsName = $("#name").val(); //取内容
            	buildTable(goodsName,page,PAGESIZE);//默认每页最多10条
            }  
        }  

        //获取当前项目的路径
        var urlRootContext = (function () {
            var strPath = window.document.location.pathname;
            var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
            return postPath;
        })();
        
       
        //生成表格
        function buildTable(goodsName,pageNumber,pageSize) {
        	 var url =  urlRootContext + "/order/list"; //请求的网址
             var reqParams = {'userName':goodsName, 'pageNumber':pageNumber,'pageSize':pageSize};//请求数据
             $(function () {   
             	  $.ajax({
             	        type:"POST",
             	        url:url,
             	        data:reqParams,
             	        async:false,
             	        dataType:"json",
             	        success: function(data){
             	            if(data.isError == false) {
             	           // options.totalPages = data.pages;
             	        var newoptions = {  
                        currentPage: data.currentPage,  //当前页数
                        totalPages: data.pages==0?1:data.pages,  //总页数
                        size:"normal",  
                        alignment:"center",  
                        itemTexts: function (type, page, current) {  
                        switch (type) {  
                            case "first":  
                            return "第一页";  
                            case "prev":  
                            return "前一页";  
                            case "next":  
                            return "后一页";  
                            case "last":  
                            return "最后页";  
                        case "page":  
                        return  page;  
                }                 
            },  
            onPageClicked: function (e, originalEvent, type, page) {  
            	var goodsName = $("#name").val(); //取内容
            	buildTable(goodsName,page,PAGESIZE);//默认每页最多10条
            }  
         }             	           
         $('#bottomTab').bootstrapPaginator("setOptions",newoptions); //重新设置总页面数目
         var dataList = data.dataList;
         $("#tableBody").empty();//清空表格内容
         if (dataList.length > 0 ) {
             $(dataList).each(function(){//重新生成
             	  /*  $("#tableBody").append('<tr>');
                    $("#tableBody").append('<td>' + this.goodsId + '</td>');
                    $("#tableBody").append('<td>' + this.goodsName + '</td>');
                    $("#tableBody").append('<td>' + this.type + '</td>');
                    $("#tableBody").append('<td>' + this.price + '</td>');
                    $("#tableBody").append('<td>' + this.remark + '</td>');
                    $("#tableBody").append('<td>' + this.salenum + '</td>');
                    $("#tableBody").append('</tr>');  
                  $("#tableBody").append('<td style="width: 150px;"> <div class="btn-group"> <a href="" class="btn btn-default">修改</a><a href="" class="btn btn-danger">删除</a> </div> </td>  ' );*/
            	 $("#tableBody").append('<tr id=tr'+this.id+ '>'
            	+'<td id="goodsid">' + this.id + '</td>'
            	+'<td>' + this.userName + '</td>'
            	+'<td class="state"  text="'+this.state+'">' + toState(this.state) + '</td>'
            	+'<td>' + this.price + '</td>'
            	+'<td>' + toDate(this.orderTime) + '</td>'
            	+'<td>' + this.orderAddress + '</td>'
            	+'<td style="width: 150px;"> <div class="btn-group"> <a href="" class="btn btn-default" id="goodsModify" onclick="goodsModify('+this.id+',this);return false;">详情</a>'
            	+'<a href="" class="btn btn-danger" id="goodsdelete" onclick="goodsdelete('+this.id+');return false;">删除</a> </div> </td>'
            	+'</tr>'
            	 );
            	
            	 
             });  	
             	    } else {             	            	
             	          $("#tableBody").append('<tr><th colspan ="4"><center>查询无数据</center></th></tr>');
             	    }
             	    }else{
             	          alert(data.errorMsg);
             	            }
             	      },
             	        error: function(e){
             	           alert("查询失败:" + e);
             	        }
             	    });
               });
        }  
        //转化时间
        function  toDate(rData){
        	var myDate = new Date(rData);
        	var year = myDate.getFullYear();
        	var month = (myDate.getMonth() + 1).toString();;
        	var day = myDate.getDate().toString();;
        	var hours  = myDate.getHours().toString();
        	var Minutes = myDate. getMinutes().toString();
        	if(day.length==1){
        		day="0"+day;
        	}
        	if(month.length==1){
        		month="0"+month;
        	}
        	if(Minutes.length==1){
        		Minutes="0"+Minutes;
        	}
        	if(hours.length==1){
        		hours="0"+hours;
        	}
        	return year + '-' + month + '-' + day+"  "+hours + ':' + Minutes;
            };
            
           //转化状态
            function  toState(state){
 
            	switch (state) {
				case 0:return "未处理";
				case 1:return "已发货";
				case 2:return "订单取消";
                };
            }
/*        function  goodsdelete(id){
        	$("#tr"+ id).remove();       	
            var date={'id':id}; 
            	 $.ajax({  
            	       data:date,
            	       type:"post",  
            	     dataType: 'json', 
            	       url:"/ssdsd/order/delete",
            	       async:false,
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
            };*/
/*            function  goodsModify(goodsid){  	
                var data={'id':goodsid}; 
                	 $.ajax({  
                	       data:data,
                	       type:"post",  
                	     dataType: 'json', 
                	       url:"/ssdsd/cancel/Modify",
                	       async:false,
                	       error:function(data){  
                	           alert("服务器繁忙");  
                	       },
                	       success:function(data){
                	    	   if(data.msg=="1"){	   
                	    		   alert("1")  
                	    		 location.href ='/ssdsd/admin/adminadd?id='+goodsid;
                	    	   }
                	       }
                	 });
                };*/
        //渲染完就执行
        $(function() {     	
        	//生成底部分页栏
        	 $('#bottomTab').bootstrapPaginator(options);       
        	
        	buildTable("",1,15);//默认空白查全部
       	$('.pagination').css("float","right");
            //创建结算规则
            $("#queryButton").bind("click",function(){
            	var goodsName = $("#name").val();	
            	buildTable(goodsName,1,PAGESIZE);
            });
            
           
            
            
        });
   