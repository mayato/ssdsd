$(function() {  	
    if ($.cookie("adminUser") == "true") {  
    $("#ck_rmbUser").attr("checked", true);  
    $("#inputname").val($.cookie("ausername"));  
    $("#inputPassword").val($.cookie("apassword"));
    $('#inputname').bind('input propertychange', function() {   
   	 $("#inputPassword").val("");
	});   
    }  
 });
function Save() {  
    if ($("#ck_rmbUser").prop("checked")) {  
      var str_username = $("#inputname").val();  
      var str_password = $("#inputPassword").val();  
      $.cookie("adminUser", "true", { expires: 7 }); //存储一个带7天期限的cookie  
      $.cookie("ausername", str_username, { expires: 7 });  
      $.cookie("apassword", str_password, { expires: 7 });  
    }  
    else {  
      $.cookie("adminUser", "false", { expire: -1 });  
      $.cookie("ausername", "", { expires: -1 });  
      $.cookie("apassword", "", { expires: -1 });  
    }  
  };  