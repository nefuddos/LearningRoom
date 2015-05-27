<%-- 
    Document   : index
    Created on : 2014-9-10, 19:12:15
    Author     : rjg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>东北林业大学学习间管理</title>
<link rel="stylesheet" type="text/css" href="style.css" > </link>
 <link rel="stylesheet" href="http://dreamsky.github.io/main/blog/common/init.css"> </link>
 <link rel="stylesheet" type="text/css" href="/LearningRoom/FrotPage/css/calcss.css" > </link>
<!-- jQuery file -->
<script  type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/jquery.tabify.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.modify.js" type="text/javascript" charset="utf-8"></script>
  <script src="/LearningRoom/FrotPage/js/CalJquery.js" type="text/javascript"></script>

<script type="text/javascript">
var $ = jQuery.noConflict();
$(function() {
$('#tabsmenu').tabify();
$(".toggle_container").hide(); 
$(".trigger").click(function(){
	$(this).toggleClass("active").next().slideToggle("slow");
	return false;
});
});
</script>
</head>
<body>
<div id="panelwrap">
  	
	<div class="header">
    <center>
    <h2>东北林业大学学习间使用管理</h2>
    </center>
   
     <%
         String manager_name=(String)session.getAttribute("username");
       //  String manager_password=(String)session.getAttribute("password");
     %>
     <input id="username" type="hidden" value="<%=manager_name%>"/>
    
    <div class="header_right">欢迎,<%=manager_name%>,<a href="jsp/PersonIfo/PersonIfo.jsp" class="settings">设置</a> <a href="jsp/logout.jsp" class="logout">退出</a> </div>
 
    <div class="center_content">  
 
    <div id="right_wrap">
                <div id="right_content">             
                        <h2>信息展示</h2>
                        <!-- result里面的是在jsp页面中返回的情况-->
                        <div id="result"></div>
                        <div id="result_down"></div>
                 </div>
     </div>
        <!-- end of right content-->
                     
                    
    <div class="sidebar" id="sidebar">
    <h2>学生预约情况</h2>
        <ul>
            <li><a class="selected" onclick="OrderSelect()">预约情况查询</a></li>
        </ul>
    <h2>学习间管理</h2>
    
        <ul>
            <li><a onclick="look()">查看</a></li>
            <li><a onclick="modify()" >修改</a></li>
            <li><a onclick="add()">增加</a></li>
            <li><a onclick="del()" >删除</a></li>
        </ul> 
     <!---
    <h2>通知通告</h2>
    
        <ul>
            <li><a onclick="notify()">通知管理</a></li>
        </ul>
     -->
    </div>             
    
    
    <div class="clear"></div>
    </div> 
    


</div>

    	
</body>
</html>