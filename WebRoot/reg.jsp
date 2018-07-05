<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
    <style>
        body{
            background: #ebebeb;
            font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif;
            color: #222;
            font-size: 12px;
        }
        *{padding: 0px;margin: 0px;}
        .top_div{
            background: #008ead;
            width: 100%;
            height: 400px;
        }
        .ipt{
            border: 1px solid #d3d3d3;
            padding: 10px 10px;
            width: 290px;
            border-radius: 4px;
            padding-left: 35px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
        }
        .ipt:focus{
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
        }
        .u_logo{
            background: url("images/username.png") no-repeat;
            padding: 10px 10px;
            position: absolute;
            top: 43px;
            left: 40px;

        }
        .p_logo{
            background: url("images/password.png") no-repeat;
            padding: 10px 10px;
            position: absolute;
            top: 12px;
            left: 40px;
        }
        a{
            text-decoration: none;
        }
        .tou{
            background: url("images/tou.png") no-repeat;
            width: 97px;
            height: 92px;
            position: absolute;
            top: -87px;
            left: 140px;
        }
        .left_hand{
            background: url("images/left_hand.png") no-repeat;
            width: 32px;
            height: 37px;
            position: absolute;
            top: -38px;
            left: 150px;
        }
        .right_hand{
            background: url("images/right_hand.png") no-repeat;
            width: 32px;
            height: 37px;
            position: absolute;
            top: -38px;
            right: -64px;
        }
        .initial_left_hand{
            background: url("images/hand.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -12px;
            left: 100px;
        }
        .initial_right_hand{
            background: url("images/hand.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -12px;
            right: -112px;
        }
        .left_handing{
            background: url("images/left-handing.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -24px;
            left: 139px;
        }
        .right_handinging{
            background: url("images/right_handing.png") no-repeat;
            width: 30px;
            height: 20px;
            position: absolute;
            top: -21px;
            left: 210px;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            //得到焦点
            $("#password").focus(function(){
                $("#left_hand").animate({
                    left: "150",
                    top: " -38"
                },{step: function(){
                    if(parseInt($("#left_hand").css("left"))>140){
                        $("#left_hand").attr("class","left_hand");
                    }
                }}, 2000);
                $("#right_hand").animate({
                    right: "-64",
                    top: "-38px"
                },{step: function(){
                    if(parseInt($("#right_hand").css("right"))> -70){
                        $("#right_hand").attr("class","right_hand");
                    }
                }}, 2000);
            });
            //失去焦点
            $("#password").blur(function(){
                $("#left_hand").attr("class","initial_left_hand");
                $("#left_hand").attr("style","left:100px;top:-12px;");
                $("#right_hand").attr("class","initial_right_hand");
                $("#right_hand").attr("style","right:-112px;top:-12px");
            });
        });
    </script>
<script>
    //注册框焦点聚集  
    function register(pwp) {  
        $(pwp).parent().children().eq(0).children('span').css("display","none");  
        /*$('#registerName').css("display","none"); 
        $('#registerPwd').css("display","none"); 
        $('#registerPwd1').css("display","none");   */  
    };  
    //注册验证用户  
    function checkName(){  
        var flg=false;  
        var Name=document.getElementById("Name").value;
        var xhr=new XMLHttpRequest();
        xhr.onreadystatechange = function(){
        //xhr.readyState == 4  是表示后台处理完成了。
        //xhr.status == 200 是表示处理的结果是OK的。
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                    document.getElementById("registerName").innerHTML = xhr.responseText;
                }
            }
        }
         // 3.打开连接
        xhr.open("GET","customer/customer_findByName?name="+Name,true);
        // 4.发送
        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xhr.send("");
        if($('#Name').val()==""){  
            $('#registerName').html("用户名不能为空").css({"display":"inline","color":"red"});  
            flg=false;  
        }else if(!/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/.test($('#Name').val())){  
            $('#registerName').html("字母开头，长度5-16,只含字母，数字，下划线").css({"display":"inline","color":"red"});  
            flg=false;  
        }
        else{
           $('#registerName').html("").css({"display":"inline","color":"red"});
        }
        return flg;  
    }  
    function createXmlHttp(){
           var xmlHttp;
           try{ // Firefox, Opera 8.0+, Safari
                xmlHttp=new XMLHttpRequest();
            }
            catch (e){
               try{// Internet Explorer
                     xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                  }
                catch (e){
                  try{
                     xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                  }
                  catch (e){}
                  }
            }

            return xmlHttp;
         }
    //注册验证密码  
    function checkPwd() {
        if ($('#password').val()=="") {  
            $('#registerPwd').html("密码不能为空").css({"display":"inline","color":"red"});  
            return false;  
        }else if(!/^[a-zA-Z]\w{5,17}$/.test($('#password').val())){  
            $('#registerPwd').html("字母开头，长度6-18,只含字母，数字，下划线").css({"display":"inline","color":"red"});  
            return false;  
        }  
        return true;  
    };  
    //注册验证确认密码  
    function checkrPwd() {  
        if ($('#password').val()=="") {  
            $('#registerPwd').html("密码不能为空").css({"display":"inline","color":"red"});  
            return false;  
        }else if ($('#regPwd1').val()=="") {  
            $('#registerPwd1').html("密码不能为空").css({"display":"inline","color":"red"});  
            return false;  
        }else {  
              
            if ($('#password').val()!=$('#regPwd1').val()) {  
                $('#registerPwd1').html("前后密码不一致").css({"display":"inline","color":"red"});  
                return false;  
            }  
        }     
        return true;  
    };  
      
    //验证码  
  
 /*   //var num = 0;  
    //var img = document.getElementById('createCode').onclick = function(){  
        num++;  
        this.src = 'createCode?num'+num;  
    }  
   /* function checkCode(){  
        var flg=false;  
        if($('#verCode').val()==""){  
            $('#verificationCode').html("验证码不能为空").css({"display":"inline","color":"red"});  
            flg=false;  
        }else{  
            $.ajax({  
                type:"post",  
                url:"CheckCode",  
                async:false,  
                dataType :"json",  
                data :jQuery('#verCode').serialize(),  
                success:function(data){  
                    if(data.state=="Y"){  
                        $('#verificationCode').html("验证码正确").css({"display":"inline","color":"green"});  
                        flg=true;  
                    }else if (data.state=="N") {  
                        $('#verificationCode').html("验证码错误").css({"display":"inline","color":"red"});  
//                      $('#verCode').val("");  
                        flg=false;  
                    }                 
                }  
    })  
        }  
    return flg;  
}*/  </script>

</head>
<body>
<div class="top_div"></div>
<div style="width: 400px;height: 330px;margin: auto auto;background: #ffffff;text-align: center;margin-top: -100px;border: 1px solid #e7e7e7">
    <div style="width: 165px;height: 96px;position: absolute">
        <div class="tou"></div>
        <div id="left_hand" class="initial_left_hand"></div>
        <div id="right_hand" class="initial_right_hand"></div>
    </div>

 <s:form action="customer/customer_reg" method="post" name="basicform" id="basicform" onsubmit="return checkRegisterForm()">
 
    <p style="padding: 30px 0px 10px 0px;position: relative;">
        <input class="ipt" type="text" placeholder="username" onblur="checkName()" name="customer.name" required minlength="3" id="Name" onfocus="register(this)" onblur="checkName()">
         <p><span id="registerName"></span></p>
    </p>
   <p style="padding: 10px 0px 10px 0px;position: relative;">
       <!--   <span class="p_logo"></span>-->
      <input id="password" class="ipt" type="password"  placeholder="Password" name="customer.password" required onblur="checkPwd()"> <p><span id="registerPwd"></span></p>
    </p>
     <p style="padding: 10px 0px 10px 0px;position: relative;">
        <input class="ipt" type="text" placeholder="address" name="customer.address" id="email" onkeyup="checkEmail(this);">
    </p>
<p style="padding: 10px 0px 10px 0px;position: relative;">
      <input id="Confirm password" class="ipt" type="password"  placeholder="Confirm Password" id="regpwd1"onfocus="register(this)" onblur="checkrPwd()">
      <p><span id="registerPwd1"></span><p>
    </p>
  
  <p  style="padding: 10px 0px 10px 0px;position: relative;">
      <input id="score" class="ipt" type="hidden" name="customer.score" value="0">
    </p>
    <p  style="padding: 10px 0px 10px 0px;position: relative;">
      <input id="VIPlevel" class="ipt" type="hidden" name="customer.viplevel" value="0">
    </p>
    <div style="height: 50px;line-height: 50px;margin-top: 10px;border-top: 1px solid #e7e7e7;">
        <p style="margin: 0px 35px 20px 45px;">
           <span style="float: left"><a href="#" style="color:#ccc;">remember the password?</a></span>
           <span style="float: right">
               <a href="login.jsp" style="background: #008ead;padding: 7px 10px;border-radius: 4px;border: 1px solid #1a7598;color: #FFF;font-weight: bold;">Login</a>
               <button class="hi" type="submit" style="background: #008ead;padding: 7px 10px;border-radius: 4px;border: 1px solid #1a7598;color: #FFF;font-weight: bold;">Sign up</button>
           </span>
        </p>
    </div>  
    </s:form>

</div>

<div style="position: fixed;bottom: 0px;text-align: center;width: 100%;">
</div>
</body>
</html>