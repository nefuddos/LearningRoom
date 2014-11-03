<%-- 
    Document   : index1
    Created on : 2014-9-18, 16:16:59
    Author     : rjg
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>东北林业大学图书馆学习间预约系统</title>
        <link rel="stylesheet" type="text/css" href="./css/style_1.css" > </link>
        <link rel="stylesheet" type="text/css" href="./css/calcss.css" > </link>
        <link rel="stylesheet" href="http://dreamsky.github.io/main/blog/common/init.css"> </link>
        <!-- jQuery file -->
        <script  type="text/javascript" src="./js/jquery.min.js"></script>
        <script src="./js/CalJquery.js" type="text/javascript"></script>
        <script src="./js/jquery.tabify.js" type="text/javascript" charset="utf-8"></script>
        <script src="./js/RoomIfo.js" type="text/javascript" charset="utf-8"></script>

        <script type="text/javascript">
            var $ = jQuery.noConflict();
            $(function() {
                $('#tabsmenu').tabify();
                $(".toggle_container").hide();
                $(".trigger").click(function() {
                    $(this).toggleClass("active").next().slideToggle("slow");
                    return false;
                });
            });
        </script>
    </head>
    <body>
        <div id="panelwrap">

            <div class="header">

                <!-- 个人用户信息 -->

                <%
                    String name = (String) session.getAttribute("user");
                    if (session.isNew() || name == null) {
                %>
                <div class="usernameid">

                    你好,<a href="./jsp/login1.jsp">请登录</a>

                </div>
                <%
                } else {
                %>

                <p id="big1">
                    姓名：<%=name%> 
                </p>
                <p id="big3">
                    <a href="jsp/personal/person.jsp">个人预约查询</a>
                </p>
                <p  id="big2">
                    <a href="./jsp/logoutjsp.jsp"> &nbsp;退出</a> 
                </p>
                <%
                    }
                %>


            </div>
            <input type="hidden" id="user" value="<%=name%>" />      
            <div class="center_content">  
                <div id="right_wrap">
                    <div id="right_content">             
                        <h2></h2>

                        <!-- result里面的是在jsp页面中返回的情况-->
                        <div id="result1"></div>
                        <div id="result2"></div>
                        <center>
                            <div id="content"></div>
                        </center>

                    </div>
                </div>
                <!-- end of right content-->


                <div class="sidebar" id="sidebar">
                    <h2></h2>
                    <ul>
                        <li><a class="selected" onclick="LearningRoom()">学习间预约</a></li>
                        <li><a class="selected" onclick="LearningRoomIfo()">学习间查看</a></li>
                    </ul>
                    <%

                    %>
                    <!---
                    <h2>书包柜</h2>
                    
                        <ul>
                            <li><a onclick="backpack()">书包柜预约</a></li>
                        </ul> 
                    -->

                    <!-- JiaThis Button BEGIN -->
                    <div id="share">
                        一键分享
                        <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt" target="_blank"><img src="http://v3.jiathis.com/code_mini/images/btn/v1/jiathis1.gif" border="0" /></a>
                        <a class="jiathis_counter_style_margin:3px 0 0 2px"></a>

                        <script type="text/javascript" src="http://v3.jiathis.com/code_mini/jia.js" charset="utf-8"></script>            
                        <!-- JiaThis Button END -->
                    </div>



                </div>             


                <div class="clear"></div>
            </div> 



        </div>


    </body>
</html>