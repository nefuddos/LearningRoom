<%-- 
    Document   : ModifyRoom
    Created on : 2014-9-22, 14:59:31
    Author     : rjg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改学习间</title>
        
 
    </head>
     <%
           request.setCharacterEncoding("UTF-8");
           int i=Integer.parseInt(request.getParameter("i"));
            String[][]  data  =  (String[][])session.getAttribute("table_number");
            String peopleStr=(String)data[i][2];
            int people= Integer.parseInt(peopleStr);
             String sizeStr=(String)data[i][2];
            int size= Integer.parseInt(sizeStr);
          //  session.removeAttribute("table_number");
     %>
    <body>
        <h3>修改学习间信息</h3>
        <form action="/LearningRoom/ModifyRoom" method="post">
            <center>
                学习间编号<input type="text" name="num" value="<%=data[i][0]%>" /> <br>
                学习间大小<input type="text" name="size"  value="<%=size%>" /> <br>
                学习间容纳人数 <input type="text" name="people"  value="<%=people%>" /> <br>
                学习间描述 <input type="text" name="discri"  value="<%=data[i][3]%>" /> <br>
                管理员联系方式 <input type="text" name="mnum"  value="<%=data[i][4]%>" /> <br>
                <input type="reset" value="重置" /> &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="提交" />
            </center>
        </form>
  
    </body>
</html>

