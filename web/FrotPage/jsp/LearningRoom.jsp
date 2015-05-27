<%-- 
    Document   : LearningRoom
    Created on : 2014-9-18, 16:37:40
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
                                                 <a> 日期选择：</a>
                                               <input type="text" id="j_Date2" class="input"  onclick="Calender()"/>
                                                <script>   var myDate2 = new Calender({id:'j_Date2',isSelect:!0});
                                                </script>
                                                
                                               <a>时间选择：</a>
                                                <select id="time">
                                                        <option value="1-2" onclick="" selected="selected">1~2节课</option>
                                                        <option value="3-4" onclick="">3~4节课</option>
                                                        <option value="5-6" onclick="">5~6节课</option>
                                                        <option value="7-8" onclick="">7~8节课</option>
                                                        <option value="9-10" onclick="">9~10节课</option>
                                                </select>
                                               <button id="select" onclick="selected()">查询</button>
                                               <br>
                                               <div id="present"></div>
                                           
                                       
                                               
                                               <br>
                                            
       
    </center>
    </body>
</html>
