<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--  <meta http-equiv="Refresh" content="1;url=order/order_showOrder?customer.name=${customer.name}">-->
<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css"> -->
  </head>
  
  <body>
  <body style="background: url(images/beijing.jpg)">

<div style="margin-top:150px;text-align: center;">
  
 
   <h1>   您已成功下单。</h1>
  </body>
</html>
