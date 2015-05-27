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
          
                                                         int j;
                                                         for(j=0;j<i;j++)
                                                         {
                                                       %>
                                                       <div id="total" style=" margin-left:2px;margin-top: 2px; background-color:  red; height: 120px; width: 210px; float: left;background-image: url(/LearningRoom/FrotPage/bgpicture/<%=array[j][0]%>.png)">
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
                                                    
    </body>
</html>
