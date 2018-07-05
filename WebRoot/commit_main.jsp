<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="/struts-tags" prefix="s"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();

String basePath = request.getScheme()+"://"
+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>

<html>

  <head>

    <base href="<%=basePath%>">

    
    <title>评论</title>

	<meta http-equiv="pragma" content="no-cache">

	<meta http-equiv="cache-control" content="no-cache">

	<meta http-equiv="expires" content="0">
    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

	<meta http-equiv="description" content="This is my page">

	
	<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>assets/css/font-awesome.css">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>assets/css/main.css">

	<link href="assets/css/style.css" rel="stylesheet" type="text/css" />

	
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
    
    <main class="container-fluid">

      <div class="row">

         <div class="col-md-12">

		    <s:form action="commit/commit_queryCommits" method="post">
		    </s:form>

		      <div class="panel panel-info">

	                 <div class="panel-heading">

	                    <h3 class="panel-title">我的订单</h3> 

	                 </div>
	               
                 <div class="panel-body panel-body-table">
                         
	                   <div class="table-responsive" style="overflow-x:hidden">

	                      <table class="table table-striped table-bordered table-hover" id="dataTables-example">

	                         <thead>

	                           <tr>
							          <th>用户</th>
							          <th>内容</th>
	
                              </tr>
	                          </thead>

	                          <tbody>

	                              <s:iterator value="commitlist" status="status">


	                                  <tr>
	                                      <td class="center"><s:property value="customer.name"></s:property></td>
	                                      <td class="center"><s:property value="commit" escape="false"></s:property></td>
	                                  </tr>

	                              </s:iterator>

	                          </tbody>

	                        </table>

	                      </div>

	                    </div>

	                </div>
     

	       </div>

	   </div>
 
	</main>
	

	<script src="<%=basePath%>assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>assets/js/bootstrap.min.js"></script>

    <script src="<%=basePath%>assets/js/jquery.dataTables.js"></script>

    <script src="<%=basePath%>assets/js/dataTables.bootstrap.js"></script>
   <script>
    $(document).ready(function(){  
//获得文本框对象  
var t = $("#text_box");  
//初始化数量为1,并失效减  
$('#min').attr('disabled',true);  
    //数量增加操作  
    $("#add").click(function(){      
        // 给获取的val加上绝对值，避免出现负数  
        t.val(t.val()+1);  
        if (parseInt(t.val())!=1){  
        $('#min').attr('disabled',false);  
        };  
    })   
    //数量减少操作  
    $("#min").click(function(){  
    t.val(Math.abs(parseInt(t.val()))-1);  
    if (parseInt(t.val())==1){  
    $('#min').attr('disabled',true);  
    };  
    })  
  
});  
</script>  
    <script>
 
      $(document).ready(function () {
   
        $('#dataTables-example').dataTable({

			   "language": {
 
                "lengthMenu": "每页 _MENU_ 条记录",
 
                "zeroRecords": "没有找到记录",
  
               "info": "第 _PAGE_ 页 ( 共 _PAGES_ 页 )",
 
                "infoEmpty": "无记录",
 
                "infoFiltered": "(从 _MAX_ 条记录过滤)",

				 "sInfoPostFix": "",
	
			 "sSearch": "搜 索 : ",
	
			 "sUrl": "",
		
		 "sEmptyTable": "表中数据为空",
	
			 "sLoadingRecords": "载入中...",

				 "sInfoThousands": ",",
	
			 "oPaginate": {
			
		"sFirst": "首页",
	
				"sPrevious": "上页",

					"sNext": "下页",

					"sLast": "末页"
	
			 },
	
			 "oAria": {
	
			 "sSortAscending": ": 以升序排列此列",
	
			 "sSortDescending": ": 以降序排列此列"

			     },
	
			 
             }
	
	   });
       });
 
   </script>

  </body>

</html>
