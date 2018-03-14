<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>留言页面</title>
	<!-- <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Refresh" content="2;url=honey/honey_showHoney">-->
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css"> -->
  </head>
  
  <body>
  <body style="background: url(images/liuyan1.jpg)">
<section>
<section style="margin-top:120px;text-align: center;">
     <h1>给我留言</h1>
      <form>
         <!--<span style="text-align: center">-->
         <label>标题:</label>
         <br>
         <input type="text" class="text-input"><br>
         <label>内容:</label>
         <br>
         <textarea></textarea>
         <br>
         <label>是否匿名:</label>
           <label>
             <input type="radio" name="RadioGroup1" value="是" checked>
             是</label>
           <label>
             <input type="radio" name="RadioGroup1" value="否">
             否</label>
         <br>
          <button type="submit" class="btn"><a href="success.jsp">提交</a></button>
         </span>
     </form>
  </section>

  </body>
</html>

