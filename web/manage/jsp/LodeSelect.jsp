<%-- 
    Document   : Orderselected
    Created on : 2014-10-8, 19:35:53
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
    <center>
        
                                               <!--
                                                 <a> 日期选择：</a>
                                               <input type="text" id="j_Date2" class="input"  onclick="Calender()"/>
                                                <script>   var myDate2 = new Calender({id:'j_Date2',isSelect:!0}); </script>
                                                -->
                                               <a>房间号：</a>
                                                <select id="number">
                                                        <option value="507" onclick="" selected="selected">507</option>
                                                        <option value="513" onclick="">513</option>
                                                        <option value="514" onclick="">514</option>
                                                        <option value="516" onclick="">516</option>
                                                        <option value="517" onclick="">517</option>
                                                      
                                                </select>
                                               <!--
                                               <a>姓名：</a>
                                                <input type="text" id="name" />
                                               --->
                                               
                                                <a>预约选择：</a>
                                                 <select id="order">
                                                        <option value="0" onclick="" selected="selected">未处理预约</option>
                                                        <option value="1" onclick="">已经允许的预约</option>
                                                        <option value="2" onclick="">已经拒绝的预约</option>
                                                      
                                                </select>
                                                
                                               <button id="select" onclick="select()">查询</button>
                                               <br>
                                               <div id="present"></div>
                             <br>
                                            
       
    </center>
    </body>
</html>
