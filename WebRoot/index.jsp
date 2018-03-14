<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
     <base href="<%=basePath%>">
    
     <title>商品详情</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
   <link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css">
	<link rel="icon" href="<%=basePath%>/favicon.ico"type="images/x-icon">
	<link rel="icon" href="<%=basePath%>/favicon.ico"type="images/x-icon">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
  </head>
  
  <body>
     <main>
     <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>详情页</title>
<link href="css/css.css" type="text/css" rel="stylesheet" />
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
<div style="background-image:url(sre=images/123.jpg)">
<div class="nav_warp">
   <div class="nav">
      <ul>
         <li><a href="main.jsp">首页</a></a></li>
         <li><a href="order_main.jsp">我的订单</a></li>
         <li><a href="gouwuche.jsp">购物车</a></li>
         <li><a>热卖推荐</a></li>
      </ul>
   </div>
</div>
	            <ul>
                  
	                
	               <a href="order/order_addOrder?honey.honeyid=<s:property >
	                  <value='honeyid'/>&customer.name=<s:property value='#session.customer.name'/>" class="add">
	                 <h4> <li>  <a href="detail.jsp"><img src="images/123.jpg"align="bottom"><center>荆条蜜  销售价：￥78</center> </a></li>
                   <li> <a href="detail.jsp"><img src="images/124.jpg"align="bottom"><center>枣花蜜   销售价：￥154</center></a>  </li>
                    <li> <a href="detail.jsp"><img src="images/125.jpg"align="bottom"><center>洋槐蜜  销售价：￥68</center></a>  </li>
                    <li> <a href="detail.jsp"><img src="images/131.jpg"align="bottom"><center>槐花蜜  销售价：￥98</center></a>  </li>
                    <li> <a href="detail.jsp"><img src="images/127.jpg"align="bottom"><center>柠檬蜜  销售价：￥158</center></a>  </li>
                    <li><a href="detail.jsp"> <img src="images/128.jpg"align="bottom"><center>枸杞蜜  销售价：￥98</center></a>  </li>
                    <li> <a href="detail.jsp"><img src="images/129.jpg"align="bottom"><center>蜂黄浆  销售价：￥128</center> </a> </li>
                     <li> <a href="detail.jsp"><img src="images/130.jpg"align="bottom"><center>野山蜂蜜  销售价：￥158</center></a> </li>
                     <li> <a href="detail.jsp"><img src="images/pic05.jpg"align="bottom"><center>金桔蜜  销售价：￥158</center></a> </li></h4>
	                </a>
	             </p>
	          </li>
	      </ul>
	</main>
  </body>
</html>
