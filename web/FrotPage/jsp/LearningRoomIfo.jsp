<%-- 
    Document   : LearningRoomIfo
    Created on : 2014-10-1, 19:05:02
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
  String yuju1="select number,size,peonum,discri, mnum from roomtable where  number not in (select number from subscrible  where (date = '"+date+"' and time = '"+time+"') )";
  %>
   <jsp:useBean id="Lodedata_1" class="newpackage.Test"  scope="page" />
                                  
         <%
          int i=0;
          ResultSet ret=null;
          String [][]array = new String[10][10];
           
          try{
           
             ret=Lodedata_1.exeQ(yuju1);
             if(ret==null)
                 out.print("没有剩余的学习间可用");
             else
             {
                         while(ret.next()==true)
                         {
                             array[i][0]=(String)ret.getString("number");  //房间编号
                             array[i][1]=(String)ret.getString("size"); //房间大小
                             array[i][2]=(String)ret.getString("peonum");  //容纳人数
                             array[i][3]=(String)ret.getString("discri");   //学习间描述
                             array[i][4]=(String)ret.getString("mnum");  //房间管理员电话号码  
                            i++;
                         }
            
             
             }
              
             Lodedata_1.closeCL();
             Lodedata_1.closeRs();
             Lodedata_1.closeSM();  
           
          }catch(Exception e)
            {
                 response.setStatus(400, "数据库异常，稍后再试");
                 e.printStackTrace();
            }
          
         %>
         
        <!-- 信息显示  -->
        <center>
           <form id="form_sub">
               <table class="table_ifo">
                                                  <tr>
                                                     <td>房间编号</td>
                                                      <td>房间大小(m^2)</td>
                                                      <td>容纳人数(人)</td>
                                                      <td>房间描述</td>
                                                      <td>管理员电话</td>
                                                  </tr>
                                                  <%
                                                         int j;
                                                         for(j=0;j<i;j++)
                                                         {
                                                       %>
                                                       <tr>
                                                           <td><input  type="button" value="<%=array[j][0]%>" /></td> 
                                                           <td><input type="button" value="<%=array[j][1]%>" /></td> 
                                                           <td><input type="button" value="<%=array[j][2]%>" /></td>
                                                           <td><input  type="button" value="<%=array[j][3]%>" /></td> 
                                                           <td><input  type="button" value="<%=array[j][4]%>" /></td> 
                                                       </tr>
                                                      <%
                                                         }
                                                      %>
               </table>
 
  </form>
               </center>
    </body>
</html>
