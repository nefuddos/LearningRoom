<%-- 
    Document   : login
    Created on : 2014-9-7, 20:25:18
    Author     : rjg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>图书馆学习间后台登录</title>
<link rel="stylesheet" type="text/css" href="../style.css" > </link>
 <link rel="stylesheet" href="http://dreamsky.github.io/main/blog/common/init.css"> </link>
 <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<!--  <script type="text/javascript" src="../js/login_1.js"></script>
验证用户名和密码-->
<script>
    function nefu(){
    //首先测试一下页面的按钮按下，可以调用这个方法
    //使用js的alert方法，显示一个弹出提示
    //alert("按钮被点击了！！！");

    //1.获取文本框中的内容
    //document.getElementByIdx_x("userName"); dom的方式获得id
    //jquery的方式获得页面节点，参数中#加上id属性值可以找到一个节点
    //jquery的方法返回的都是jquery的对象，可以继续在上面只写其他的jquery对象
    
    var jqueryObj = $("#username");
    var jqueryobj1=$("#password");
    //获得节点的值
    var username = jqueryObj.val();
    var password = jqueryobj1.val();
    //验证userName是否取到了
 //   alert(username+"\n"+password);
    //2.将文本框中的数据发送给服务器端的servlet
    //使用jquery的XMLHTTPrequest对象请求的封装
     var params="name="+username+"&passw="+password;
   
     $.ajax({
     url: "/LearningRoom/login",
     async: false,
     data: params,
     type: "POST",
     success: callback,
     error: callback1
     });
            
  
}

//回调函数
function callback1(){
          var resultObj = $("#result");
            //动态改变页面中div节点中的内容
            resultObj.html("用户名或密码错误");
         
          //  window.location.reload();
}
function callback(data,textStatus){
     location.href = "/LearningRoom/manage/index.jsp";
     
  //  if(textStatus==="success")
  //  {
  //       location.href = "../index.jsp";
  //  }
//    else
 //   {
   //     alert("登录失败！\n"+data);
  //  }
   
     //3.接收服务器端返回的数据
    
  //  window.parent.login.alert(data);
    //4.将服务器返回的数据动态显示到页面上
    //找到保存结果信息的节点
           // var resultObj = $("#result");
            //动态改变页面中div节点中的内容
            //resultObj.html(data);
             // alert("图书馆欢迎你\n");
              
}


</script>

</head>
<body>
<div id="loginpanelwrap">
  	
    <div class="loginheader">
    <div class="logintitle">图书馆学习间管理员登录</div>
    </div>

    <form id="form-1">
    <div class="loginform">
        
        <div class="loginform_row">
        <label>用户名:</label>
        <input type="text" class="loginform_input"  id="username"/>
        </div>
        <div class="loginform_row">
        <label>密码:</label>
        <input type="password" class="loginform_input"  id="password"/>
        <div id="result"></div>
        </div>  
       
        <div class="loginform_row">
          
            <input type="button" class="loginform_submit" onclick="nefu()"  value="登录"/>
      
            
        </div> 
        <div class="clear"></div>
    </div>
     </form>

 

</div>

    	
</body>
</html>