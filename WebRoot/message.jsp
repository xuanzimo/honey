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
    
    <title>添加页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Refresh" content="2;url=honey/honey_showHoney">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css"> -->
  </head>
  
  <body>
成功添加了一种蜂蜜。
  </body>
</html>
