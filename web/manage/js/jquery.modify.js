/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function callback1(data,status){
     if(status==="success")
     {
     // var resultObj = $("#result");
    //动态改变页面中div节点中的内容
      //    resultObj.html(data);
      }
      else
      {
          alert("查询出错");
      }
}
function OrderSelect(){
    //检查管理员是否登录
    var user=$('#username').val();
    if(user==="null")
    {
        alert("你还没有登录，不能访问此界面！请按确定按钮登录");
        location.href="jsp/login.jsp";
    }
    else
    {
    //查询学习间预约的情况
     try{
     // $.get("./jsp/OrderSelect.jsp",null,callback1);
     $("#result").load("./jsp/LodeSelect.jsp?",null,callback1);
     }
  catch(e)
  {
   alert(e);
  }
    }
}

function select()
{
     // var date=$("#j_Date2").val();//获取是哪一天
      var number=$("#number").val();//获取学号
      var name = $("#name").val();//获取姓名
      var order = $("#order").val();//预约情况
      //alert(date+" "+number+" "+name);
      if(number==="" || name==="" || order ==="")
      {
        $("#result_down").html("请补齐条件");
      }
      else
      {
         var params="number="+number+"&name="+name+"&order="+order; 
         //alert(params);
         $("#result_down").load("./jsp/Orderselect.jsp?",params,callback1);
      }
}
function modify(){
      var user=$('#username').val();
    if(user==="null")
    {
        alert("你还没有登录，不能访问此界面！请按确定按钮登录");
        location.href="jsp/login.jsp";
    }
    else
    {
    $("#result").load("./jsp/modify.jsp",null,callback1);
    }
}

function look(){
      var user=$('#username').val();
    if(user==="null")
    {
        alert("你还没有登录，不能访问此界面！请按确定按钮登录");
        location.href="jsp/login.jsp";
    }
    else
    {
    $("#result_down").html("");
    $("#result").load("./jsp/look.jsp",null,callback1);
    }
}

function add(){
      var user=$('#username').val();
    if(user==="null")
    {
        alert("你还没有登录，不能访问此界面！请按确定按钮登录");
        location.href="jsp/login.jsp";
    }
    else
    {
        $("#result_down").html("");
    $("#result").load("./jsp/add.jsp",null,callback1);
    }
}

function del(){
      var user=$('#username').val();
    if(user==="null")
    {
        alert("你还没有登录，不能访问此界面！请按确定按钮登录");
        location.href="jsp/login.jsp";
    }
    else
    {
        $("#result_down").html("");
    $("#result").load("./jsp/del.jsp",null,callback1);
    }
}

function notify(){
    var user=$("#username").val();
    if(user==="null")
    {
       alert("你还没有登录，不能访问此界面！请按确定按钮登录");
        location.href="jsp/login.jsp";
    }
    else
    {
    $("#result_down").html("");
    $("#result").load("./jsp/notify.jsp",null,callback1);
    }
}
function notify_submit(){
}
function show(id,i){
        //alert(id + " " +i);
         var params="id="+id+"&sum="+i; 
         //alert(params);
         $("#result_down").load("./jsp/OrderselectNextPage.jsp?",params,callback1);
}

function deal(id,status)
{
    if(status === 1)
    {
       //$(document).ready(function(){
            //$(".parent .hide").click(function(){
           // $(this).parents(".ex").hide("slow");
           // });
              //$(this).parent(".pa").children(".child2").hide("slow");
             // $(this).parent(".pa").load("/LearningRoom/OrderSelect?i=id&params=1",callback1);
              //alert(status);
              $(this).hide(slow);
       //  });
    }
    
    else if(status === 2)
    {
        //$(this).parents(".child2").hide("slow");
        //  $(this).parent(".pa").load("/LearningRoom/OrderSelect?i=id&params=2",callback1);
          $(this).hide(slow);
         //alert(status);
    }
}






