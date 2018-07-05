<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml" >
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <meta http-equiv="Refresh" content="1;url=order/order_showOrder?customer.name=${customer.name}">
<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css"> -->
 <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
     <div class="head">
  <div class="h_top">
    <div class="wrap">
      <div class="ht_left">欢迎进入寻蜜人生！</div>
      <div class="ht_right"> <a href="login.jsp">登录</a>|
        <a href="reg.jsp">注册</a>
        <a href="liuyan.jsp">给我留言</a>
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
          
          <li class="li4"><a href="remai.jsp" class="" >热卖推荐</a></li> 
          <li class="li5"><a href="gerenzhongxin.jsp" class="" >个人中心</a></li>
          <li><a href="liuyan.jsp" class="" >给我留言</a></li>
          <li><a href="index.jsp" class="" >关于我们</a></li>
          <div class="cls"></div>
          <div><span style="float:left;margin-top:200px;padding-left:260px;font-size:40px">评论成功!正在跳转......</span></div>
        </ul>
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>