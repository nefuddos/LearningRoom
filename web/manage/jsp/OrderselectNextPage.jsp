<%-- 
    Document   : OrderselectNextPage
    Created on : 2015-2-24, 18:32:11
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
       <%
           String [][]array = new String[50000][10];
           int []flag = new int[50000];
           int id  = Integer.parseInt(request.getParameter("id"));
           int sum  = Integer.parseInt(request.getParameter("sum"));
           int begin = id*10,end = (id+1)*10 <sum?((id+1)*10):sum;
           array = (String [][])session.getAttribute("Room_table");
           flag = (int [])session.getAttribute("flag");
           %>
           <center> 
            <table class="table_ifo" border=2>
                         
                          <tr>
                              <td>房间编号</td><td>预约姓名</td><td>预约日期</td><td>预约时间</td><td>预约原因</td><td>是否允许预约</td>
                          </tr>
                          <%
                          
                              int page_num =sum/10;
                            //  int begin = 0,end = page_num <1?sum:10;
                              int j;
                                for(j=begin;j<end;j++)
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
                               
                                int tag=0;
                                for(int k=0;k<=page_num;k++)
                                {
                       
                                    if(k<id+3 || k>=page_num-3)
                                    {
                                         out.write("<a onclick = show("+k+","+sum+")>["+(k+1)+"]</a>&nbsp");
                                    }
                                    else{
                                        if(tag == 0)
                                        out.print("...");
                                        tag = 1;
                                    }
                                }
                          
                          %>
            </table>              
     </center>
           
      
    </body>
</html>
