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

    
    <title>显示所有honey</title>

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
<script src="<%=basePath%>assets/js/jquery.min.js"></script>

    <script src="<%=basePath%>assets/js/bootstrap.min.js"></script>

	<script src="<%=basePath%>assets/js/bootstrap-fileupload.js"></script>
	<script src="dist/summernote.js"></script>
    <script src="dist/lang/summernote-es-EU.js"></script> 
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">
	<link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
    <link href="dist/summernote.css" rel="stylesheet"/>
	
	
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">
<script>
$(document).ready(function(){
 $('#summernote').summernote({
        height: 200,
        tabsize: 2,
        lang: 'es-EU',
        focus:true,
        
    });
     var markupStr = $('#summernote').summernote('code'); 
});
</script>
<script>
	function html_encode(str) {
    var s = "";
    if (str.length == 0)
        return "";
    s = str.replace(/&/g, "&gt;");
    s = s.replace(/</g, "&lt;");
    s = s.replace(/>/g, "&gt;");
    s = s.replace(/ /g, "&nbsp;");
    s = s.replace(/\'/g, "&#39;");
    s = s.replace(/\"/g, "&quot;");
    s = s.replace(/\n/g, "<br>");
    return s;
}
function html_decode(str) {
    var s = "";
    if (str.length == 0)
        return "";
    s = str.replace(/&gt;/g, "&");
    s = s.replace(/&lt;/g, "<");
    s = s.replace(/&gt;/g, ">");
    s = s.replace(/&nbsp;/g, " ");
    s = s.replace(/&#39;/g, "\'");
    s = s.replace(/&quot;/g, "\"");
    s = s.replace(/<br>/g, "\n");
    return s;
}
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
  </div>		    </header>
  
  
  
     <main class="container-fluid">

	    <div class="row">

		   <div class="col-md-10">

		      <s:form action="honey/honey_editHoney" cssClass="form-horizontal" enctype="multipart/form-data">

		      <s:hidden name="honey.honeyid"/>

		      <div class="panel panel-success">
	
		       <div class="panel-heading">

		               <h4 class="panel-title"> <i class="fa fa-cutlery"></i> 编 辑 蜂 蜜信 息</h4>

		           </div>

		           <div class="panel-body">

				       <div class="form-group">
	
		                <label class="control-label col-md-3">蜂蜜名称</label>

			                <div class="col-md-4">
 
                             <input type="text" name="honey.honeyname" value="<s:property value='honey.honeyname'/>" class="form-control input-sm" required>

                           </div>

			           </div>
  
			           <div class="form-group">

			                <label class="control-label col-md-3">蜂蜜单价</label>

			                <div class="col-md-2">

                              <input type="text" name="honey.unitprice" value="<s:property value='honey.unitprice'/>" class="form-control input-sm" placeholder="&yen;"pattern= " ^(?:[1-9][0-9]*|0)(?:/.[0-9]+)?$ " required>

                            </div>

			           </div>
                            <div class="form-group"> 
			                <label class="control-label col-md-3">蜂蜜简介</label>
			                <div class="m">
			                 <textarea id="summernote" name="honey.introduce" placeholder="&yen;" value="<s:property value='honey.introduce' escape='false'/>"></textarea>
			                  </div>
			                </div>
			                 <div class="form-group">

			                <label class="control-label col-md-3">商品积分</label>

			                <div class="col-md-2">

                              <input type="text" name="honey.score" class="form-control input-sm"  value="<s:property value='honey.score'/>" required>

                            </div>
                            </div>
			           <div class="form-group">

			                <label class="control-label col-md-3">蜂蜜图片</label>

			                <div class="col-md-4">

			                  <div class="fileupload fileupload-new" data-provides="fileupload">

                                  <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
  
                                  <img src="<%=basePath%><s:property value='honey.filepath'/>" alt="" />

                                  </div>
 
                                 <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height:150px; line-height: 20px;">

                                  </div>
 
                                 <div>

                                      <span class="btn btn-file btn-primary">

                                         <span class="fileupload-new">换张图片</span>

                                         <span class="fileupload-exists">换张图片</span>

                                         <input type="file" name="honeyPhoto"/>

                                      </span>

                                      <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">取消</a>

                                  </div>
 
                            </div>
 
                           </div>

			           </div>
    

			           <div class="form-group col-md-3">

				          <button type="submit" class="btn btn-success pull-right">提  交 </button>

				       </div>

				   </div>

				</div>
		    </s:form>

		  </div>
	   </div>
	</main>

  </body>
</html>
