<%-- 
    Document   : Lodedata
    Created on : 2014-9-18, 19:37:02
    Author     : rjg
--%>


<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
  <%request.setCharacterEncoding("UTF-8");%>
  

  <%
  //获取表单提交的信息
 // String number=(String)request.getParameter("room");
  String date=request.getParameter("date");
 // int time=Integer.parseInt(request.getParameter("time"));
  String time=request.getParameter("time");
%>

<%

  //还有就是session里面的信息同时也在这里列出来
  String username=(String)session.getAttribute("user");
  
  session.setAttribute("date", date);
  session.setAttribute("time", time);
  //sql语句
  
 // String yuju2="select number,size,peonum from roomtable,subscrible where('subscrible.date' <> 'date' | 'subscrible.time <> 'time')";
  String yuju1="select number,size,peonum from roomtable where  number not in (select number from subscrible  where (date = '"+date+"' and time = '"+time+"') )";
  %>
   <jsp:useBean id="Lodedata" class="newpackage.Test"  scope="page" />
   
             
         <%
             ResultSet ret=null;
             String [][]array = new String[10][10];
             int i=0;
          try{
             ret=Lodedata.exeQ(yuju1);
             if(ret==null)
                 out.print("没有剩余的学习间可用");
             else
             {
                         while(ret.next()==true)
                         {
                             array[i][0]=(String)ret.getString("number");
                             array[i][1]=(String)ret.getString("size");
                             array[i][2]=(String)ret.getString("peonum");
                      
                             
                         //    out.print("<tr>");
                           //  out.println("<td>"+ret.getArray("number")+"</td><td>"+ret.getArray("size")+"</td><td>"+ret.getArray("peonum")+"</td><td><a href=\"jsp/form.jsp?i="+i+"\">预约</a></td>");
              
              //               out.print("</tr>");
                            i++;
                         }
               
             }
              
             Lodedata.closeCL();
             Lodedata.closeRs();
             Lodedata.closeSM();  
             session.setAttribute("table_number",array);
          }catch(Exception e)
            {
                 response.setStatus(400, "数据库异常，稍后再试");
                 e.printStackTrace();
            }
         
         %>
         
   <form id="form_sub">
      

           <table class="table_ifo">
                                                  <tr>
                                                     <td>房间编号</td>
                                                      <td>房间大小(m^2)</td>
                                                      <td>容纳人数(人)</td>
                                                      <td>是否预约</td>
                                                  </tr>
                                                      <%
                                                         int j;
                                                         for(j=0;j<i;j++)
                                                         {
                                                       %>
                                                       <tr>
                                                           <td><%=array[j][0]%></td> <td><%=array[j][1]%></td> <td><%=array[j][2]%></td><td><a href="jsp/form.jsp?i=<%=j%>">预约</a></td>
                                                       </tr>
                                                      <%
                                                         }
                                                      %>


          </table>
              
  </form>
    </body>
</html>
