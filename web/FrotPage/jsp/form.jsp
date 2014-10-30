<%-- 
    Document   : form
    Created on : 2014-9-20, 13:47:43
    Author     : rjg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人预约信息</title>
        <script>
            function gohome(){
                location.href="/LearningRoom/FrotPage/index1.jsp";
            }
        </script>
    </head>
    <body>
        <%
            int i=Integer.parseInt(request.getParameter("i"));
            String[][]  data  =  (String[][])session.getAttribute("table_number"); 
            String username=(String)session.getAttribute("user");
            String date=(String)session.getAttribute("date");
            String time=(String)session.getAttribute("time");
        %>
        <form action="/LearningRoom/FormIfo?i=<%=i%>" method="post">
        <center>
        <h1>你好，你的预约信息如下</h1>
        <table class="table_ifo">
                                                  <tr>
                                                     <td>房间编号</td>
                                                      <td>房间大小(m^2)</td>
                                                      <td>容纳人数(人)</td>
                                                      <td>预约日期</td>
                                                      <td>预约时间</td>
                                                      <td>预约者</td>
                                                      
                                                  </tr>
                                                  <tr>
                                                      <td><%=data[i][0]%></td>
                                                      <td><%=data[i][1]%></td>
                                                      <td><%=data[i][2]%></td>
                                                      <td><%=date%></td>
                                                      <td><%=time%></td>
                                                      <td><%=username%></td>
                                                  </tr>
                                                   
        </table>
                                                 
                                                  预约原因： <input type="text" name="reason" />
                                                  <input type="reset" value="返回" onclick="gohome()">
                                                  &nbsp;&nbsp;<input type="submit" value="提交" />
        </center>
        </form>
    </body>
</html>
