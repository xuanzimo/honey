<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int i=1;
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示所有商品</title>
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
<script type="text/javascript" src="assets/js/jquery1.7.2.js"></script>
<script type="text/javascript" src="assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="assets/js/common.js"></script>
	
	
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">
	  <script>  
$(document).ready(function(){  
//获得文本框对象  
var t = $("#text_box");  
//初始化数量为1,并失效减  
$('#min').attr('disabled',true);  
    //数量增加操作  
    $("#add").click(function(){      
        // 给获取的val加上绝对值，避免出现负数  
        t.val(parseInt(t.val())+1);  
        if (parseInt(t.val())!=1){  
        $('#min').attr('disabled',false);  
        };  
    })   
    //数量减少操作  
    $("#min").click(function(){  
    t.val(parseInt(t.val())-1);  
    if (parseInt(t.val())==1){  
    $('#min').attr('disabled',true);  
    };  
    })  
  
});  
</script>  
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
  

   <main>
 <s:form action="honey/honey_queryhoneys" method="post">
   <div class="form-inline search-box">

              <div class="form-group pull-right mr200">
      <input class="search-field form-control input-sm" title="关键词" name="keyWords" placeholder="输入关键词..."value="0">
                <button class="btn btn-info btn-sm" type="submit">搜  索</button>

    
      </div>
      </div>
      </s:form>
      <ul>
<s:if test="#session.customer.name=='lili'">
         <li>
         <div><a href="add.jsp"><i></i>添加蜂蜜</a><i class="fa fa-plus"></i></div>
         <p>点击上面的区域添加一种蜂蜜</p>
         </li>
         <s:iterator value="honeyList" status="status">
          <li>
          <a href="honey/honey_showDetail?honey.honeyid=<s:property value='honeyid'/>"><img src="<%=basePath %><s:property value='filepath'/>"></a> 
           <p> 
             <s:property value="honeyname"/>
            <span class="price">&yen;<s:property value="unitprice"/></span>
                   积分：<s:property value="score"/>
            <a href="honey/honey_showEdit?honey.honeyid=<s:property value='honeyid'/>">
            <i class="fa fa-pencil">修改</i>
             </a>
            &nbsp;&nbsp;<a href="honey/honey_deleteHoney?honey.honeyid=<s:property value='honeyid'/>">
            <i class="fa fa-trash">删除</i></a>
            </p>
          </li>
          </s:iterator>
       </s:if>
       <s:else>
       <s:iterator value="honeyList" status="status">
	          <li>
	          	
	            <a href="honey/honey_showDetail?honey.honeyid=<s:property value='honeyid'/>"><img src="<%=basePath %><s:property value='filepath'/>"></a>

	             <p>
                  <s:property value="honeyname"/>
	                </a>
                     <span class="price"> &yen;<s:property value="unitprice"/></span>
	              &nbsp;&nbsp;  
	                积分：<s:property value="score"/>&nbsp;&nbsp;
	              <s:form action="order/order_addOrder" method="post">  
	            
	           <input id="min" name="" type="button" value="-" />    
				<input id="text_box" name="Number" type="text" value="1" style="width:30px;text-align: center"/>    
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
	             </p>
       
       </li>
       </s:iterator>
       
       </s:else>
       </ul>
    
	</main>
  </body>
</html>