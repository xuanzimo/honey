<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>留言成功</title>
    <style>body{text-align:center}</style>
  </head>

  <body style="background: url(images/liuyan1.jpg)">
  <p>您的留言我们已经收到，我们会尽快回复您！</p>
<p>You are receiving this automatic notification because I am out of the office. If I was in, chances are you wouldn't have received anything at all.
  </p>
  </body>
</html>

