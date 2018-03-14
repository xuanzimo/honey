<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <title>个人中心</title>
    <meta charset="utf-8">
</head>
  <style>
  
    body {
	font: .8125em/1.5 arial, sans-serif;
	text-align: center;
	background-image: url(images/beijing3.jpg);

    h1 { font-size: 1.5em; font-weight: normal; margin: 1em 0 0; }
  
    ul { margin: 2em; padding: 0; }
    li { display: inline; padding: 0 2em; }
   div { -moz-border-radius: 20px; -webkit-border-radius: 20px; border: 5px solid #A9A9A9; border-radius: 20px; margin: 2em auto 1em; max-width: 650px; min-width: 544px; }
    div p { margin: .5em 0 1.5em; }
    img { border: 0; }
  body,td,th {
	font-size: 0.8125em;}
}
  </style>
  <div>
    <img src="images/touxiang.jpg" width="250" height="250" alt=""/></a>
    <h1><p><a href="login.jsp"><strong id="target">登录</strong></a></p>
    <p><a href="reg.jsp"><strong id="target">注册</strong></a></p>
    </h1>
  </div>
    
</html>
