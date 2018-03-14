<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车详情</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!--   <link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">--> 
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
	
  </head>
  
 
<body>
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
<div class="nav_warp">
   <div class="nav">
      <ul>
      <div style="margin-top:35px;text-align: center;">
         <h3> <li><a>我的订单</a></a></li></h3>
      </ul>
   </div>
</div>
    <!-- <header>
       <div class="account">
         <c:choose>
		       <c:when test="${customer.name ==null}">
		         <a href="reg.jsp">注册</a>
		         <a href="login.jsp">登录</a>
		       </c:when>
		       <c:otherwise>
		         <c:out value="${customer.name}"></c:out>, 欢迎您!
		       </c:otherwise>
		    </c:choose>
       </div>
       <div class="logo"></div>
		    -->
		    <!--  <div class="nav_warp">-->
</head>
<body>
    <body style="background: url(images/beijing.jpg)">
    <main>
	    <s:form action="order/order_queryOrders" method="post">
	      
	  <!--     <div>
	         <s:submit value="查 询" cssClass="search-go"></s:submit>
	         <input class="search" type="text" name="honey.honeyname" placeholder="请输入关键词"> -->
	      </div>
	
	        <table>
	        <tr>  
	          <th>序号</th>  
	          <th>订单号</th>
	          <th>蜂蜜</th>
	          <th>单价</th> 
	          <th>份数</th>  
	          <th>总价</th>
	        </tr> 
	        <tr class="success">
    <td>1</td>
    <td>675900</td>
    <td>荆条蜜</td>
    <td>￥68</td>
    <td>1</td>
    <td>￥68</td>
    
  </tr>
	         <s:iterator value="orderList" status="status">
	          <tr>
	            <td><s:property value="#status.index+1"></s:property></td>
	            <td><s:a href="order/order_showDetail?order.orderid=%{orderid}">
	               <s:property value="orderid"></s:property></s:a>
	            </td>
	            <td><s:property value="honey.honeyname"></s:property></td>
	            <td><s:property value="honey.unitprice"></s:property></td>
	            <td><s:property value="honeynum"></s:property></td>
	            <td><s:property value="total"></s:property></td>
	          </tr>
	         </s:iterator>
	      </table>
	    </s:form>
	</main>
  </body>
</html>
