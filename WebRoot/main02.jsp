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
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css.css">
	
  </head>
  
  <body>
    <header>
       <div class="account">
         <c:choose>
	       <c:when test="${customer.name ==null}">
	         <a href="reg.jsp">注册</a>
	         <a href="login.jsp">登录</a>
	       </c:when>
	       <c:otherwise>
	         <c:out value="${customer.name}"></c:out>, 欢迎您!
	       </c:otherwise>
	     </c:choose>
		    
       </div>
       
		    
    </header>

     <main>
	    <s:form action="honey/honey_queryhoneys" method="post">
	      <div class="search-box">
	         <s:submit value="查 询" cssClass="search-go"></s:submit>
	         <input class="search" type="text" name="keyWords" placeholder="请输入关键词">
	      </div>
	      <ul>
	        <s:iterator value="honeyList" status="status">
	          <li>
	             <img src="<%=basePath%><s:property value='filepath'/>">
	           <p>
	                <a href="honey/honey_showDetail?honey.honeyid=<s:property value='honeyid'/>">
	                  <s:property value="honeyname"/>
	                </a>
	                <span class="price"> &yen;<s:property value="unitprice"/></span>
	                <a href="order/order_addOrder?honey.honeyid=<s:property 
	                  value='honeyid'/>&customer.name=<s:property value='#session.customer.name'/>" class="add">
	                  <i class="fa fa-cutlery"></i> 来一份
	                </a>
	             </p> 
	          </li>
	        </s:iterator>
	      </ul>
	    </s:form>
	</main>
  </body>
</html>
