<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" >
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
		<title>主页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="assets/js/jquery1.7.2.js"></script>
<script type="text/javascript" src="assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="assets/js/common.js"></script>
		
	</head>
	<body class="homepage">
	<div class="head">
  <div class="h_top">
    <div class="wrap">
    <c:choose>
	       <c:when test="${customer.name ==null}">
      <div class="ht_left">欢迎进入寻蜜人生！</div>
        </c:when>
         <c:otherwise>
      <div class="ht_right"> <a href="login.jsp">登录</a>|
        <a href="reg.jsp">注册</a>
          </c:otherwise>
	     </c:choose>
    </div>
    <main>
	    <s:form action="honey/honey_queryHoneys" method="post">
	      
	    <!--  <div>
	         <s:submit value="查 询" cssClass="search-go"></s:submit>
	         <input class="search" type="text" name="keyWords" placeholder="请输入关键词">
	      </div>
	-->
	<s:if test="#session.customer.name=='admit'">
	<li>
	  <div class="add"><a href="edit.jsp"><i class="fa fa-plus"></i>添加美食</a></div>
	  <p>点击上面的连接可以添加一种美食</p>
	</li>
	<s:iterator value="honeyList" status="status">
	  <li>
	    <img src="<%=basePath%><s:property value='filepath'/>">;
	    <p>
	     <a href="honey/honey_showDetail?honey.honeyid=<s:property value='honeyid'/>">
	        <s:property value="honeyname"/>
	     </a>
	     <span class="price"> &yen;<s:property value="unitprice"/></span>
	     <a href="honey/honey_showEdit?honey.honeyid=<s:property value='honeyid'/>">
	        <i class="fa fa-pencil"></i>
	     </a>
	     &nbsp;&nbsp;<a href="honey/honey_deleteHoney?honey.honeyid=<s:property value='honeyid'/>">
	     <i class="fa fa-trash"></i>
	      </a>
	     </p>
	     </li>
	     </s:iterator>
	     </s:if>
	     <s:else>
	       <s:iterator value="honeyList" status="status">
	       <li>
	         <img src="<%=basePath%><s:property value='filepath'/>">
	         <p>
	           <a href="honey/honey_showDetail?honey.honeyid=<s:property value='honeyid'/>">
	              <s:property value="honeyname"/>
	              </a>
	               <span class="price"> &yen;<s:property value="unitprice"/></span>
	               <a href="order/order_addOrder?honey.honeyid=<s:property value='honeyid'/>&customer.name=<s:property value='#session.customer.name'/>" class="add-order">
	                  <i class="fa fa-cutlery"></i>来一份
	                  </a>
	                  </p>
	                  </li>
	       </s:iterator>
	     </s:else>
	    </s:form>
	</main>
  </body>
</html>
  </div>
  <div class="nav" id="nav">
    <div class=""></div>
    <div class="wrap"> <a class="logo" href="/"><img src="images/logo.jpg" width="215" height="50"/></a> 
      
      <!--头部分享-->
      <div class="hshare"> <a href="#" class="icon_weibo"></a> <a href="#" class="icon_tengxun"></a> <a href="javascript:" class="icon_weixin"><img src="/skin/images/weixin_2.png"  /></a> </div>
      <a href="/" class="nav_home"><span></span></a>
      <div class="nav_con">
        <ul class="nav_list">
 
          <li><a href="index.jsp"> 首页</a></li>
          
          <li><a href="main.jsp">产品展厅</a></li>
          
          <li class="li4"><a href="index.jsp">热卖推荐</a></li> 
          <li class="li5"><a href="login.jsp" >个人中心</a></li>
          <li><a href="liuyan.jsp" >给我留言</a></li>
          <li><a href="index.jsp" >关于我们</a></li>
          <div class="cls"></div>
        </ul>
      </div>
    </div>
  </div>
</div>

<!--head end-->
<div class="banner m_banner">
  <ul>
    <li style='background-image:url(images/header.jpg); background-position:center 0'></li>
  </ul>
  <div class="mbannerTitle">
    <h1>产品展厅</h1>
    
  </div>
</div>
<div class="main">
  <div class="about_nav">
  </div>
  <div class="wrap">
    <ul class="pro_index_list m_pro_index_list" id="m_pro_index_list">
      <li class="li1"> <a href="/a/product/cgcp/51.html" >
        <div class="img"><span></span>
          <div class="bg"></div>
          <img src="images/pic01.jpg" /></div>
        <div class="text">枣花蜜</div>
        
        </a> </li><li class="li1"> <a href="/a/product/cfdq/41.html" >
        <div class="img"><span></span>
          <div class="bg"></div>
          <img src="images/pic02.jpg" /></div>
        <div class="text">洋槐蜜</div>
        
        </a> </li><li class="li1"> <a href="/a/product/cfdq/46.html" >
        <div class="img"><span></span>
          <div class="bg"></div>
          <img src="images/pic03.jpg" /></div>
        <div class="text">荆条蜜</div>
        
        </a> </li><li class="li1"> <a href="/a/product/cfdq/45.html" >
        <div class="img"><span></span>
          <div class="bg"></div>
          <img src="images/pic03.jpg" /></div>
        <div class="text">枸杞蜜</div>
        
        </a> </li><li class="li1"> <a href="/a/product/cgcp/33.html" >
        <div class="img"><span></span>
          <div class="bg"></div>
          <img src="images//pic05.jpg" /></div>
        <div class="text">槐花蜜</div>
        
        </a> </li><li class="li1"> <a href="/a/product/cfdq/44.html" >
        <div class="img"><span></span>
          <div class="bg"></div>
          <img src="images/pic06.jpg" /></div>
        <div class="text">桂花蜜</div>
        </a> </li>
      <div class="cls"></div>
    </ul>
    <div class="h20"></div>
    </div>
    </div>
 
  <div class="page">首
1
<a href=''>下页</a>
<a href=''>末</a>
<span class="pageinfo">共 <strong>1</strong>页<strong>6</strong>条</span>
</div>
  </div>
</div>
<script type="text/javascript">
$("#m_pro_index_list li").each(function(i){
	if((i+1)%3==0&&i>0){
	$(this).css("margin-right",0)	
	}			 

});
</script>
</body>
	
		</html>