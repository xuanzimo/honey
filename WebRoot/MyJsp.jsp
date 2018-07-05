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

    
    <title>添加honey详情</title>

    <meta charset="utf-8">

	<meta http-equiv="pragma" content="no-cache">

	<meta http-equiv="cache-control" content="no-cache">

	<meta http-equiv="expires" content="0">
    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

	<meta http-equiv="description" content="This is my page">

	
	<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>assets/css/font-awesome.css">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>assets/css/main.css">

	<link href="assets/css/style.css" rel="stylesheet" type="text/css" />

	
	<script src="assets/js/jquery.min.js"></script>

    <script src="assets/js/bootstrap.min.js"></script>

	<script src="assets/js/bootstrap-fileupload.js"></script>

	
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">

	
  </head>

  
  <body>

   <header>
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
  <!--  <div class="nav" id="nav">
    <div class=""></div>
    <div class="wrap"> <a class="logo" href="/"><img src="images/logo.jpg" width="215" height="50"/></a> 
      
      <!--头部分享-->
     <!-- <div class="hshare"> <a href="#" class="icon_weibo"></a> <a href="#" class="icon_tengxun"></a> <a href="javascript:" class="icon_weixin"><img src="/skin/images/weixin_2.png"  /></a> </div>
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
  </div>    --></header>
    <html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>

<link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
<link href="dist/summernote.css" rel="stylesheet"/>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="dist/summernote.js"></script>
<script src="dist/lang/summernote-zh-CN.js"></script>    <!-- 中文-->

<style>
	.m{ width: 800px; margin-left: auto; margin-right: auto; }
</style>

<script>
$(function(){
 $('.summernote').summernote({
        height: 200,
        tabsize: 2,
        lang: 'zh-CN'
    });
});
</script>

</head>

<body>

	<div class="m">		
		<div class="summernote">summernote 1</div>
		<div class="summernote">summernote 2</div>
	</div>

</body>
</html>
    