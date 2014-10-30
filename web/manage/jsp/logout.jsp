<%-- 
    Document   : logout
    Created on : 2014-9-21, 16:45:21
    Author     : rjg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <center>
        <%
            session.removeAttribute("username");
            session.removeAttribute("password");
            
            
         String manager_name=(String)session.getAttribute("username");
         String manager_password=(String)session.getAttribute("password");
         
         if(manager_name=="" && manager_password=="")
         {
             out.print("成功注销");
         }
        %>
        <a href="login.jsp">成功注销，返回登录界面</a>
        </center>
    </body>
</html>
