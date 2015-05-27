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
  String yuju1="select number,size,peonum,discri,mnum from roomtable where  number not in (select number from subscrible  where (date = '"+date+"' and time = '"+time+"') )";
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
                             array[i][3] = (String)ret.getString("discri");
                             array[i][4] = (String)ret.getString("mnum");
                             
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
                                                         int j;
                                                         for(j=0;j<i;j++)
                                                         {
                                                       %>
                                                       <div onclick="buy(<%=j%>)" id="total" style=" margin-left:5px;margin-top: 2px; background-color: red; height: 120px; width: 210px; float: left;background-image: url(/LearningRoom/FrotPage/bgpicture/<%=array[j][0]%>.png)">
                                                           <div id="pictureifo" style="">
                                                          </div>
                                                           <div id="room_iformation" style="margin-top: 62px">
                                                              <ul>
                                                                  <li>大小:&nbsp;<%=array[j][1]%>
                                                                  容纳人数:&nbsp;<%=array[j][2]%></li>
                                                                  <li>描述:&nbsp;<%=array[j][3]%>
                                                                  管理员电话:&nbsp;<%=array[j][4]%></li>
                                                              </ul>
                                                          </div>
                                                      </div>
                                                      <%
                                                         }
                                                      %>

                                                       <script>
                                                          function buy(id)
                                                          {
                                                              var val = "你确定要预约该信息共享空间吗?";
                                                             var sq =  confirm(val);
                                                             if(sq === true)
                                                             {
                                                                 location.href ="jsp/form.jsp?i="+id;
                                                             }
                                                          }
                                                      </script>
             
    </body>
</html>
