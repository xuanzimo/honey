<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
     <base href="<%=basePath%>">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
     <title>商品详情</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%> assets/css/font-awesome.css">
	
	<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="assets/js/jquery1.7.2.js"></script>
<script type="text/javascript" src="assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="assets/js/common.js"></script>
  </head>
  
  <body>
    <div class="wrap">
       <div class="ht_left">欢迎进入寻蜜人生！</div>
      <div class="ht_right">  
      <c:choose>
	       <c:when test="${customer.name ==null}">
	         <a href="reg.jsp">注册</a>
	         <a href="login.jsp">登录</a>
	       </c:when>
	       <c:otherwise>
	         <c:out value="${customer.name}"></c:out>, 欢迎您!
	       </c:otherwise>
	     </c:choose>
	     
      <!--  <a href="login.jsp">登录</a>|
        <a href="reg.jsp">注册</a>
        <a href="liuyan.jsp">给我留言</a>-->
        
    </div>
  </div>
  <div class="nav" id="nav">
    <div class=""></div>
    <div class="wrap"> <a class="logo" href="/"><img src="images/logo.jpg" width="215" height="50"/></a> 
      
      <!--头部分享-->
      <div class="hshare"> <a href="#" class="icon_weibo"></a> <a href="#" class="icon_tengxun"></a> <a href="javascript:" class="icon_weixin"><img src="/skin/images/weixin_2.png"  /></a> </div>
      <a href="/" class="nav_home"><span></span></a>
      <div class="nav_con">
        <ul class="nav_list">
          <li><a href="index.jsp" class=""> 首页</a></li>
          <li><a href="main.jsp" class="">产品展厅</a></li>
          <li class="li4"><a href="main.jsp" class="" >热卖推荐</a></li> 
          <li class="li5"><a href="gerenzhongxin.jsp" class="" >个人中心</a></li>
          <li><a href="liuyan.jsp" class="" >给我留言</a></li>
          <li><a href="index.jsp" class="" >关于我们</a></li>
        </ul>
      </div>
    </div>
  </div>


<img class="double-border"
    src="images/pic02.jpg" 
    alt=""/>
  
<div class="wenzi"> 
      食品名称: <c:out value="${honey.honeyname}"></c:out><br>
    单价：<c:out value="${honey.unitprice}"></c:out>
      
       <p>功效：护脾养胃、清热解毒、排毒清脂 
        洋槐蜜呈水白色，透明状，色泽清亮，口感清甜，<br>淡黄色，有槐花特有的清香味，具有槐花微香味，不易结晶，果糖比率高，<br>果糖极易被人体吸收利用，适合所有人群，
        为上等蜂蜜。<br>具有护脾养胃、清热解毒、排毒清脂、祛皱消斑、养颜正气、能保持毛细血管正常的抵抗能力、<br>舒张血管、降低血压、改善血液循环、防止血管硬化，较适用于心血管病人的保健食用，并用于预防中风
   </p>
	             <s:else>
        <s:iterator value="honeyList" status="status">
	          <li>
	                <span class="price"> &yen;<s:property value="unitprice"/></span>
	                <a href="order/order_addOrder?honey.honeyid=<s:property
	                  value='honeyid'/>&customer.name=<s:property value='#session.customer.name'/>" class="add-order"> 
	                 
	                  <img src="images/gouwuche.jpg" />
	                 <font color="#996666" >加入购物车</font>
	                
	                </a>
	             
       </li>
       </s:iterator>
       </s:else>
</div>
  </body>
</html>
