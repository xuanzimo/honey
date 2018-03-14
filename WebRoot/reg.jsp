<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <title>注册页面</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">-->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/login.css">
</head>
  
  
  <body style="background: url(images/beijing.jpg)">
  <div class="header">
   <div class="logo">
     <img src="images/logo.jpg" />
     </div>
   <div class="banner">
     <img src="images/140.jpg" />
     <img src="images/141.jpg" />
     <img src="images/142.jpg" />
   </div>
  
</div>
<div style="background-image:url(sre=images/123.jpg)">
<div class="nav_warp">
   <div class="nav">
      <ul>
         <li><a href="index.jsp">商品详情</a></li>
         <li><a href="order_main.jsp">我的订单</a></li>
         <li><a href="gouwuche.jsp">购物车</a></li>
        <li><a href="index.jsp">热卖推荐</a></li>
      </ul>
   </div>
</div>
</div>
   <div style="margin-top:150px;text-align: center;">  
    <s:form action="customer/customer_reg" method="post">
      <s:textfield name="customer.name" label="用户名"></s:textfield><!-- 无法显示label -->
      <s:textfield name="customer.password" label="密码"></s:textfield>
      <s:textfield name="customer.address" label="地址"></s:textfield>
      <s:submit value="提交"></s:submit>
      <s:reset value="重填"></s:reset>
    </s:form>
    <br>
   </div>
  </body>
</html>
