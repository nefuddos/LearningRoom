<%-- 
    Document   : newjsp
    Created on : 2014-9-16, 17:05:13
    Author     : rjg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
                session.removeAttribute("user");
                session.removeAttribute("passw");
                
        %>
        <script>
        location.href = "../index1.jsp";
            </script>>
    </body>
</html>