/*function a(){
	document.cookie.charAt(0);
	for(var i=0; i<10; i++){
		alert(i);
	}
}*/


 $(document).ready(function(){
  /*var text= $('#hide1').text();*/
/*  alert(text);
 * 
*/ var len= $('.hide2').text();
   var text=$('.hide1').text();
    if(text==len){
    	$('.nextpage a').hide();
    	
    }
    if(text=="1"){
    	$('.prePage').hide();
    }
	 $('.pagination ul li').each(function(){
	  var text1=$(this).text();
	/*  if(text1.length>8){
		
		 var arry=text1.split("");
		 text2=arry[0];
            }
	  if(text1.length>3&&text1.length<8){
		  var arry=text1.split(/\D/);
	text2=arry[0];
	  }*/
	  var arry=text1.split(/\D/);
		text2=arry[0];
	 
	   if(text2==text&&text2!="") {   
	  $(this).find("a").attr("class", "currentpage");
	  return false;
	   }
	 /* if(text==len-2&&text1=="下一页"){
		  $(this).attr("class", "disablepage");  
	  }
	  if(text=="1"&&text1=="上一页"){
		  $(this).attr("class", "disablepage");  
	  }*/
	   
  });
 });