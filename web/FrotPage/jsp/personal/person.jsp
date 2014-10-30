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
        <center>
  <%request.setCharacterEncoding("UTF-8");%>
  

  <%
     String name=(String)session.getAttribute("user");
  //sql语句
  String str="select *from subscrible where name= '"+name+"' ";
 // String yuju2="select number,size,peonum from roomtable,subscrible where('subscrible.date' <> 'date' | 'subscrible.time <> 'time')";
 // String yuju1="select number,size,peonum from roomtable where  number not in (select number from subscrible  where (date = '"+date+"' and time = '"+time+"') )";
  %>
   <jsp:useBean id="Lodedata" class="newpackage.Test"  scope="page" />

  
         <%
             ResultSet ret=null;
             String [][]array = new String[10][10];
             int i=0;
             int []flag = new int[10];
          try{
           
             
             ret=Lodedata.exeQ(str);
             if(ret==null)
                 out.print("查询出错，请稍后查询");
             else
             {
                         while(ret.next()==true)
                         {
                           
                             array[i][0]=ret.getString("number");
                             array[i][1]=ret.getString("date");
                             array[i][2]=ret.getString("time");
                             flag[i]=ret.getInt("flag");
                             /*
                             out.print("<tr>");
                             if(ret.getInt("flag")==1)
                             out.println("<td>"+ret.getArray("number")+"</td><td>"+ret.getArray("date")+"</td><td>"+ret.getArray("time")+"</td><td>预约成功</td>");
                             else if(ret.getInt("flag")==2)
                             out.println("<td>"+ret.getArray("number")+"</td><td>"+ret.getArray("date")+"</td><td>"+ret.getArray("time")+"</td><td>预约已被管理员取消</td>");
                             else
                             out.println("<td>"+ret.getArray("number")+"</td><td>"+ret.getArray("date")+"</td><td>"+ret.getArray("time")+"</td><td>预约待审核</td>");  
                             out.print("</tr>");
                                     */
                        i++;
                         }
             
             }
              
             Lodedata.closeCL();
             Lodedata.closeRs();
             Lodedata.closeSM();  
           
          }catch(Exception e)
            {
                 response.setStatus(400, "数据库异常，稍后再试");
                 e.printStackTrace();
            }
    
         %>
            <form>
           <table class="table_ifo" border="2px">
                          <thead>你好，<%=name%> 你预约的信息如下</thead>
                                                  <tr>
                                                     <td>房间编号</td>
                                                      <td>预约日期</td>
                                                      <td>预约时间</td>
                                                      <td>是否预约成功</td>
                                                  </tr>
                                                      <%
                                                         int j;
                                                         for(j=0;j<i;j++)
                                                         {
                                                             if(flag[j]==0)
                                                             {
                                                               %>
                                                               <tr>
                                                                   <td><%=array[j][0]%></td> <td><%=array[j][1]%></td> <td><%=array[j][2]%></td><td>待审核状态</td>
                                                               </tr>
                                                              <%
                                                              }
                                                             else if(flag[j]==1)
                                                             {
                                                                %>
                                                               <tr>
                                                                   <td><%=array[j][0]%></td> <td><%=array[j][1]%></td> <td><%=array[j][2]%></td><td>审核通过</td>
                                                               </tr>
                                                              <%
                                                             }
                                                             else if(flag[j]==2)
                                                             {
                                                                %>
                                                               <tr>
                                                                   <td><%=array[j][0]%></td> <td><%=array[j][1]%></td> <td><%=array[j][2]%></td><td>审核未通过</td>
                                                               </tr>
                                                              <%
                                                             }
                                                         }
                                                      %>
          </table>

              
  </form>
         <a href="/LearningRoom/FrotPage/index1.jsp">返回</a>
         </center>
    </body>
</html>
