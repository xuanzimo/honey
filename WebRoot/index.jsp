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
     <title>首页</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="assets/js/jquery1.7.2.js"></script>
<script type="text/javascript" src="assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="assets/js/common.js"></script>
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
	         <c:out value="${customer.name}"></c:out>,
	         <s:if test="#session.customer.viplevel>0">
	            尊敬的VIP<s:property value="#session.customer.viplevel"/>,</s:if> 
	            欢迎您! 您的积分：<s:property value='#session.customer.score'/>
	         &nbsp;&nbsp;<a href="main/main_re">注销</a>
	         <a href="commit/commit_showCommit?customer.name=<s:property value='#session.customer.name'/>">我的评论</a>
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
          <li><a href="honey/honey_queryhoneys1" class="">产品展厅</a></li>
          <li class="li4"><a href="remai.jsp" class="" >热卖推荐</a></li> 
          <li class="li5"><a href="gerenzhongxin.jsp" class="" >个人中心</a></li>
          <s:if test="#session.customer.name=='lili'">
          <li><a href="board/board_showBoardd">网站留言记录
          </a></li>
          </s:if>
          <s:else>
          <li><a href="board/board_showaddB?customer.customerid=<s:property value='#session.customer.customerid'/>" class="" >给我留言</a></li>
           <li><a href="board/board_showBoard?customer.name=<s:property value='#session.customer.name'/>">留言记录</a></li>
          </s:else>
          <li><a href="index.jsp" class="" >关于我们</a></li>
        </ul>
      </div>
    </div>
  </div>		    </header>

<!--head end-->
<div class="banner index_banner" id="index_banner">
  <ul>
    <li style="background-image:url(images/beijing0.jpg); background-repeat:no-repeat; cursor:pointer">
      <div class="wrap"> </div>
    </li>
<li style="background-image:url(images/beijing2.jpg); background-repeat:no-repeat; cursor:pointer">
      <div class="wrap"> </div>
    </li>
<li style="background-image:url(images/beijing3.jpg); background-repeat:no-repeat; cursor:pointer">
      <div class="wrap"> </div>
    </li>

  </ul>
  <div class="img_bar" id="img_bar"><a href="javascript:" class="hover"></a><a href="javascript:" ></a><a href="javascript:" ></a></div>
</div>
<div class="n_index_block_1">
  <div class="wrap">
    <div class="ib_title"> 寻蜜人生 </div>
    <div class="ib_text">
      <div class="t1">一个中国农业大学公益销售目。</div>
      <div class="t2">有这么一群人 他们追随四季的花期，他们留心自然的痕迹。 </div>
      <div class="t3"> 这是一个大学生的创业项目。<br />
         “寻蜜人生”项目于2014年建立实践养蜂基地，与2016年成功立项大学生实践项目，依托于中国农大学科特色优势，结合互联网技术，在严格的可溯监管平台下，为消费者提供纯天然蜂产品。  从延安枣花蜜的甜软糯滑到锦州荆条蜜的温和丰润，从诺木洪枸杞蜜的匠心独具到延边椴树蜜的清新淡雅。我们的寻蜜之旅从未停止。
</div>
         
    </div>
  </div>
</div>

<div class="n_index_block_3">
  <div class="wrap">
    <div class="h10" style="height:145px"></div>
    <div class="ib_title"> 热卖推荐 </div>
    <div class="ib_title Arial" > honey & royal jelly </div>
  </div>
</div>
<s:form action="honey/honey_addHoney" method="post">
      <s:textfield name="honey.honeyname" label="名称"></s:textfield>
      <s:textfield name="honey.unitprice" label="价格"></s:textfield>
      <s:submit value="提交"></s:submit>
    </s:form>
    <br>
<div class="n_index_block_4" style="background-color:#eee !important">
  <div class="wrap">
    <div class="ipro_box">
      <div class="ip_b_title" id="ip_b_title"> <a href="javascript:" class="hover">整瓶销售</a> <a href="javascript:">蜂王浆</a> <a href="javascript:" style="border:none">便携产品</a>
        <div class="cls"></div>
      </div>
      <div class="ip_b_con" id="pro_scroll_con">
        <div class="ip_b_con_item scrollCon"> <a href="javascript:" class="btn btn_left"></a>
          <div class=" scrollConwrap">
            <ul>
              <li> <a href="/a/product/cgcp/51.html">
                <div class="img"><span></span>
                  <div class="bg"></div>
                  <img src="images/pic01.jpg" width="350" height="230"/></div>
                <div class="text">枣花蜜</div>
                </a> </li>
<li> <a href="detail.jsp">
                <div class="img"><span></span>
                  <div class="bg"></div>
                  <img src="images/pic02.jpg" width="350" height="230"/></div>
                <div class="text">洋槐蜜</div>
                </a> </li>
<li> <a href="detail.jsp">
                <div class="img"><span></span>
                  <div class="bg"></div>
                  <img src="images/pic04.jpg" width="350" height="230"/></div>
                <div class="text">荆条蜜</div>
                </a> </li>

              <div class="cls"></div>
            </ul>
          </div>
          <a href="javascript:" class="btn btn_right"></a> </div>
        <div class="ip_b_con_item scrollCon" style="display:none"> <a href="javascript:" class="btn btn_left"></a>
          <div class=" scrollConwrap">
            <ul>
              <li> <a href="/a/product/ztyg/40.html">
                <div class="img"><span></span>
                  <div class="bg"></div>
                  <img src="images/125.jpg" width="350" height="230"/></div>
            
                </a> </li>
<li> <a href="detail.jsp">
                <div class="img"><span></span>
                  <div class="bg"></div>
                  <img src="images/pic06.jpg" width="350" height="230"/></div>
                
                </a> </li>
<li> <a href="detail.jsp">
                <div class="img"><span></span>
                  <div class="bg"></div>
                  <img src="images/127.jpg" width="350" height="230"/></div>
               
                </a> </li>
                
                
              <div class="cls"></div>
            </ul>
          </div>
          <a href="javascript:" class="btn btn_right"></a> </div>
        <div class="scrollCon" style="display:none"> <a href="javascript:" class="btn btn_left"></a>
          <div class=" scrollConwrap">
            <ul class="pro_dianqi_list" id="pro_dianqi_list">
            
              <li> <a href="detail.jsp">
                <div class="img"><span></span>
                  <div class="bg"></div>
                  <img src="images/128.jpg" width="350" height="230"/></div>
                <div class="text">枣花蜜</div>
                </a> </li>
<li> <a href="detail.jsp">
                <div class="img"><span></span>
                  <div class="bg"></div>
                  <img src="images/129.jpg" width="350" height="230"/></div>
                <div class="text">洋槐蜜</div>
                </a> </li>
<li> <a href="detail.jsp">
                <div class="img"><span></span>
                  <div class="bg"></div>
                  <img src="images/130.jpg" width="350" height="230"/></div>
                <div class="text">荆条蜜</div>
                </a> </li>
<li> <a href="detail.jsp">
                <div class="img"><span></span>
                  <div class="bg"></div>
                  <img src="images/131.jpg" width="350" height="230"/></div>
                <div class="text">椴树蜜</div>
                </a> </li>
              <div class="cls"></div>
            </ul>
          </div>
          <a href="javascript:" class="btn btn_right"></a> </div>
      </div>
    </div>
  </div>
</div>
<div class="n_index_block_5">
  <div class="wrap"></div>
</div>

</body>
<style>
.pro_dianqi_list li {
	margin-right:2px;
}
</style>
<script type="text/javascript">
	
function bindproscroll(){
	$('#pro_scroll_con').find('.scrollCon').each(function(i){
		if(i==2){
		new setScroll($(this),$(this).children('.btn_left'),$(this).children('.btn_right'),264,4);	
		}else{
		new setScroll($(this),$(this).children('.btn_left'),$(this).children('.btn_right'),352,3);
		}
	});
}

$(document).ready(function(){
	new scrollFnc("#banner2","li","#bannerCur2","a",{auto:true});	
	 bindproscroll();
	 scrollTopBanner("#index_banner ul","#img_bar a",420,"a","hover");
});


</script>
</html>