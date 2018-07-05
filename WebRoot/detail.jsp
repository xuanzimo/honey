<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
	<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>assets/css/font-awesome.css">
 <link rel="stylesheet" type="text/css" href="<%=basePath%>assets/css/main.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%> assets/css/font-awesome.css">
	<link href="assets/css/a.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="assets/js/a.js"></script>
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
  
  
<body>

<div id="container">
        <div id="list" style="left: -600px;">
            <img src="images/pic01.jpg" alt="1" />
            <img src="images/pic02.jpg" alt="1" />
            <img src="images/pic03.jpg" alt="2" />
            <img src="images/pic04.jpg" alt="3" />
            <img src="images/pic05.jpg" alt="4" />
            <img src="images/pic05.jpg" alt="5" />
            <img src="images/pic01.jpg" alt="5" />
        </div>
        <div id="buttons">
            <span index="1" class="on"></span>
            <span index="2"></span>
            <span index="3"></span>
            <span index="4"></span>
            <span index="5"></span>
        </div>
        <a href="javascript:;" id="prev" class="arrow">&lt;</a>
        <a href="javascript:;" id="next" class="arrow">&gt;</a>
    </div> 
    
    
  <div id="wenzi"> 
  
       <p>食品名称: <s:property value="honey.honeyname"></s:property>></p>
            <p>单价：<s:property value="honey.unitprice"></s:property>></p>
            <p>简介：<s:property value="honey.introduce" escape="false"></s:property></p>
         <s:form action="order/order_addOrder" method="post">  
	            
	           <input id="min" name="" type="button" value="-" />    
			数量:<input id="text_box" name="Number" type="text" value="1" style="width:30px;text-align: center"/>    
				<input id="add" name="" type="button" value="+" />   
	               <input type="hidden" id="id" name=honey.honeyid value="<s:property value='honeyid'/>"class="search-field form-control input-sm"/>
	             <input type="hidden" id="name" name=customer.name value="<s:property value='#session.customer.name'/>"class="search-field form-control input-sm"/>
	            <input type="hidden" value="<s:property value='#session.customer.password'/>" name="customer.password"/>
	            <input type="hidden" value="<s:property value='#session.customer.customerid'/>"name="customer.customerid" />
	            <input type="hidden" value="<s:property value='#session.customer.address'/>" name="customer.address"/>
	            <!--    <a href="order/order_addOrder?honey.honeyid=<s:property
 
	                  value='honeyid'/>&customer.name=<s:property value='#session.customer.name'/>&Number=2" class="add-order"><i class="fa fa-cutlery">购买</i></a>-->
                         <button class="btn btn-info btn-sm" type="submit">购 买</button>
                    </s:form>
                    <div><a href="commit/commit_showCommitt?honey.honeyid=<s:property value='honey.honeyid'/>">查看评论</a></div>
</div>
    
<script>
	 var jianum=document.getElementById("addNum");
	 var jiannum=document.getElementById("deleteNum");
	 var number=document.getElementById("spnum");
	 jianum.onclick=function(){
	   number.value=parseInt(number.value)+1;
	 };
	 jiannum.onclick=function(){
	 if(parseInt(number.value)==1)
	    number.value=1;
	   else
	     number.value=parseInt(number.value)-1;
	 };
	</script>
</body>
</html>