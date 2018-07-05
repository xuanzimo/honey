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
    <title>留言板</title>
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
    <script src="dist/summernote.js"></script>
    <script src="dist/lang/summernote-es-EU.js"></script> 
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">
	<link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
    <link href="dist/summernote.css" rel="stylesheet"/>
    

<script>
$(document).ready(function(){
 $('#summernote').summernote({
        height: 200,
        tabsize: 2,
        lang: 'es-EU',
        focus:true,
         onImageUpload: function(files, editor, $editable) {  
        sendFile(files[0],editor,$editable);  
    }  
    });
    function sendFile(file, editor, $editable){  
      
    var filename = false;  
    try{  
    filename = file['name'];  
    } catch(e){  
        filename = false;  
    }  
    if(!filename){  
        $(".note-alarm").remove();  
    }  
      
    //以上防止在图片在编辑器内拖拽引发第二次上传导致的提示错误  
    data = new FormData();  
    data.append("file", file);  
    data.append("key",filename); //唯一性参数  
  
    $.ajax({  
    data: data,  
    type: "POST",  
    url: "",  
    cache: false,  
    contentType: false,  
    processData: false,  
    success: function(url) {  
        if(url=='200'){  
            alert("上传失败！");  
            return;  
        }else{  
            alert("上传成功！");   
        }  
        //alert(url);  
    editor.insertImage($editable, url);  
    //setTimeout(function(){$(".note-alarm").remove();},3000);  
    },  
    error:function(){  
        alert("上传失败！");  
        return;  
        //setTimeout(function(){$(".note-alarm").remove();},3000);  
        }  
  });  
 }  
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
	         <c:out value="${customer.name}"></c:out>,<s:if test="#session.customer.score>10">尊敬的VIP,</s:if> 欢迎您! 您的积分：<s:property value='#session.customer.score'/>
	         &nbsp;&nbsp;<a href="main/main_re">注销</a>
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
          <li><a href="liuyan.jsp" class="" >给我留言</a></li>
          <li><a href="index.jsp" class="" >关于我们</a></li>
        </ul>
      </div>
    </div>
  </div>		    </header>
  
     <main class="container-fluid">
     <h1>如果你有什么意见，请提出</h1>
     <s:form action="board/board_addBoard" method="post">
                     <input type="hidden" name="customer.name" value="<s:property value='#session.customer.name'/>"/>
                       <div class="form-group"> 
			                <h1 class="control-label col-md-3">留言</h1>
			                <div class="col-md-6">
			                 <textarea id="summernote" name="message"  required></textarea> 
			               </div>
			            </div>
			             <div class="col-md-6">
			              联系方式：   <input  name="email"/>
			                  </div>
			                  <div class="col-md-6">
			                  <input type="radio" name="niming" value="1">匿名
			                  <input type="radio" name="niming" value="0">不匿名
			                  </div>
				          <button type="submit" class="btn btn-success pull-right">提  交 </button>
    </s:form>
	</main>
	<!--<script src="<%=basePath%>assets/js/jquery.min.js"></script>
 
   <script src="<%=basePath%>assets/js/bootstrap.min.js"></script>

	<script src="<%=basePath%>assets/js/bootstrap-fileupload.js"></script>-->

  </body>

</html>