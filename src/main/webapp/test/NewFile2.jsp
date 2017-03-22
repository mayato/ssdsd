<!doctype html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <title>例子</title>  
    <style type="text/css">  
    html{  
        width: 100%;  
        height: 100%;  
    }  
    *{  
        margin: 0;  
        padding: 0;  
    }  
    body{  
        width: 100%;  
        height: 100%;  
    }  
        .parent{  
            position: relative;  
            top: 20%;  
            height: 300px;  
            width: 300px;  
            margin:0 auto;  
            border: 1px solid #000000;  
  
        }  
        .child{  
            z-index: 99;  
            position: absolute;  
            bottom: 0;  
            width: 100%;  
            height: 80px;  
            background: #000000;  
          
          
        }  
    </style>  
</head>  
<body>  
<div class="parent">  
      
<div class="child"></div>  
</div>  
  
</body>  
</html>  