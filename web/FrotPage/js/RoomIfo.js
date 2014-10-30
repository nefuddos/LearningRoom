/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function callback(data){
            var resultObj = $("#tip_1"); 
            //动态改变页面中div节点中的内容
            resultObj.html(data);
}
function ifo_1(){
           var params="RoomNum=501";
           $.get("/LearningRoom/Roonifo",params,callback);
           
}

function ifo_2(){
       var params="RoomNum=502";
           $.get("/LearningRoom/Roonifo",params,callback);
           //var resultObj = $("#tip_1");
            //动态改变页面中div节点中的内容
          //  resultObj.html("房间基本情况：this is ifo_2");
}

function ifo_3(){
       var params="RoomNum=503";
           $.get("/LearningRoom/Roonifo",params,callback);
   //  var resultObj = $("#tip_1");
            //动态改变页面中div节点中的内容
       //     resultObj.html("房间基本情况： this is ifo_1");
}

function ifo_4(){
       var params="RoomNum=504";
           $.get("/LearningRoom/Roonifo",params,callback);
    // var resultObj = $("#tip_1");
            //动态改变页面中div节点中的内容
        //    resultObj.html("房间基本情况： this is ifo_4");
}


//一下是新的页面跳转的设计


function LearningRoom(){
    var user = $('#user').val();
    if(user==="null")
    {
        alert("你还没有登录，请登录");
        location.href="jsp/login1.jsp";
    }
    else
    {
    $("#result1").load("./jsp/LearningRoom.jsp");
    $("#result2").html("");
    }
}


function LearningRoomIfo(){
    var user = $('#user').val();
    if(user==="null")
    {
        alert("你还没有登录，请登录");
        location.href="jsp/login1.jsp";
    }
    else
    {
    $("#result1").html("");
    $("#content").html("");
    $("#result2").load("./jsp/LearningRoomIfo.jsp");
    }
}


function selected(){
   // var room=$("#room").val();
    var date=$("#j_Date2").val();
    var time=$("#time").val();
    var obj =$("#present");
      //var params="room="+room+" "+"date="+date+" "+"time="+time+" "+"user="+user;
      if(date==="")
      {
         // alert(" 请选择日期");
        // location.href="/LearningRoom/FrotPage/index1.jsp";
         // $("#result").load("./jsp/LearningRoom.jsp");
         // location.href="jsp/LearningRoom.jsp";
         obj.html("请选择日期");
      }
      else
      {
           obj.html("");
        var params="date="+date+"&time="+time;
     //   var params="numb="++"&dater="+date+"&timer="+time+"&user="+username;
               
        $.post("jsp/Lodedata.jsp",params,callback1);
     }
}

function callback1(data)
{
         // $("#content").load("jsp/Lodedata.jsp?date=\"2012-1-1\""); 
            //动态改变页面中div节点中的内容
            
               var resultObj = $("#content");
            //动态改变页面中div节点中的内容
             resultObj.html(data);
     
}


function backpack()
        {
                var user = $('#user').val();
                if(user==="null")
                {
                    alert("你还没有登录，请登录");
                    location.href="jsp/login1.jsp";
                }
                else
                {
                    alert("加载界面");
                }
            
        }
        
        
        

