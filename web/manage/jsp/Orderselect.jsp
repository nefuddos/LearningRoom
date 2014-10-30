<%-- 
    Document   : Orderselect
    Created on : 2014-9-10, 20:28:51
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
     <jsp:useBean id="orderselect" class="newpackage.Test"  scope="page" />
   
         <%
             String number,name;
           request.setCharacterEncoding("UTF-8");
           number=request.getParameter("number");
         //  name=request.getParameter("name");
           int order =Integer.parseInt(request.getParameter("order"));
           
       
             String str="select *from subscrible where number = '"+number+"' and flag = '"+order+"' ";
             ResultSet ret=null;
              String [][]array = new String[10][10];
              int []flag = new int[100];
              int i=0;
             ret=orderselect.exeQ(str);
             
            
             if(ret==null)
                 out.print("没有数据");
             else
             {
                         while(ret.next()==true)
                         {
                             array[i][0]=ret.getString("number");//房间编号
                             array[i][1]=ret.getString("name");//预约者的姓名
                             array[i][2]=ret.getString("date");//预约日期
                             array[i][3]=ret.getString("time");//预约时间
                             array[i][4]=ret.getString("reason");//预约原因
                             flag[i]=ret.getInt("flag"); //预约状态 0表示处于审核状态，1,表示允许，2,表示拒绝
                             i++;
                         }
                         session.setAttribute("Room_table", array);
             
             }
              
             orderselect.closeCL();
             orderselect.closeRs();
             orderselect.closeSM();
         %>
         
    <body>
        <center> 
            <table class="table_ifo" border=2>
                         
                          <tr>
                              <td>房间编号</td><td>预约姓名</td><td>预约日期</td><td>预约时间</td><td>预约原因</td><td>是否允许预约</td>
                          </tr>
                          <% if(i!=0)
                          {
                                for(int j=0;j<i;j++)
                                {
                                if(flag[j]==0)
                                {
                                      %>
                                      <tr>
                                          <td><%=array[j][0]%></td> <td><%=array[j][1]%></td> <td><%=array[j][2]%></td> <td><%=array[j][3]%></td> <td><%=array[j][4]%></td> <td><a href="/LearningRoom/OrderSelect?i=<%=j%>&params=1">允许</a>&nbsp;&nbsp;<a href="/LearningRoom/OrderSelect?i=<%=j%>&params=2">不允许</a></td>
                                      </tr>
                                      <%
                                }
                                else if(flag[j]==1)
                                {
                                  %>
                                    <tr>
                                      <td><%=array[j][0]%></td> <td><%=array[j][1]%></td> <td><%=array[j][2]%></td> <td><%=array[j][3]%></td> <td><%=array[j][4]%></td> <td>已经允许预约</td>
                                    </tr>
                                  <%
                                }else if(flag[j]==2)
                                {
                                %>
                                  <tr>
                                      <td><%=array[j][0]%></td> <td><%=array[j][1]%></td> <td><%=array[j][2]%></td> <td><%=array[j][3]%></td> <td><%=array[j][4]%></td> <td>已经被取消预约</td>
                                    </tr>
                                 <%
                                }
                                }
                          }
                          else
                          {
                              %>
                              没有信息
                              <%
                          }
                          %>
            </table>              
     </center>
    </body>
</html>
