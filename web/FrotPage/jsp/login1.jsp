<%-- 
    Document   : login
    Created on : 2014-9-7, 20:25:18
    Author     : rjg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>学生预约登录</title>
<link rel="stylesheet" type="text/css" href="../css/style_1.css" > </link>
 <link rel="stylesheet" href="http://dreamsky.github.io/main/blog/common/init.css"> </link>
 <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<!--  <script type="text/javascript" src="../js/login_1.js"></script>
验证用户名和密码-->
<script>
    function verify(){
    var jqueryObj = $("#username");
    var jqueryobj1=$("#password");
    //获得节点的值
    var username = jqueryObj.val();
    var password = jqueryobj1.val();

    var params="name="+username+"&passw="+password;
 $.ajax({
     url: "/LearningRoom/StudentTest",
     async: false,
     data: params,
     type: "POST",
     success: callback,
     error: callback1
 });
}

//回调函数
function callback1(data)
{
            var resultObj = $("#result");
            //动态改变页面中div节点中的内容
            resultObj.html("用户名或密码错误");
            
}


 
function callback(data){
            var resultObj = $("#result");
            //动态改变页面中div节点中的内容
            resultObj.html(data);
             // alert("图书馆欢迎你\n");
           
                location.href = "../index1.jsp";
              
}


</script>

</head>
<body>
<div id="loginpanelwrap">
  	
    <div class="loginheader">
    <div class="logintitle">图书馆学习间预约登录</div>
    </div>

    <form id="form-1">
    <div class="loginform">
        
        <div class="loginform_row">
        <label> 用户名:</label>
        <input type="text" class="loginform_input"  id="username"/>
        </div>
        <div class="loginform_row">
        <label>密码:</label>
        <input type="password" class="loginform_input"  id="password"/>
        <div id="result"></div>
        </div>  
   
        <div class="loginform_row">
          
            <input type="Button" class="loginform_submit" value="登录" onclick="verify()" />
            
        </div> 
        
        <div class="clear"></div>
    </div>
     </form>


</div>

    	
</body>
</html>