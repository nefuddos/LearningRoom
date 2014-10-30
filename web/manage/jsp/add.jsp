<%-- 
    Document   : add
    Created on : 2014-9-12, 19:08:29
    Author     : rjg
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>增加学习间</title>
    </head>
     
    <body>
        <h3>增加学习间信息</h3>
        <form action="/LearningRoom/AddRoom1" method="post">
            <center>
                房间编号<input type="text" name="num"/> <br>
                房间大小(m^2)&nbsp;<input type="text" name="size" /> <br>
                房间容纳人数(人)&nbsp; <input type="text" name="people" /> <br>
                房间基本信息描述 <input type="text" name="discri" /> <br>
                管理员联系方式    <input type="text" name="mnum" /> <br>
                <input type="submit" value="提交" />
            </center>
        </form>
  
    </body>
</html>

