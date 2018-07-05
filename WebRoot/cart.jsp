<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>所有goods</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	 <link rel="stylesheet" href="<%=basePath%>css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
	<link rel="stylesheet"  href="<%=basePath%>css/bootstrap.css">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap-table.min.css"  /> 
	<link href="../../BootStrap/jquery.bdt.css" rel="stylesheet" /> 
	<link rel="shortcut icon" href="<%=basePath%>images/1128.png">
	 <script src="<%=basePath%>js/bootstrao.min.js"></script>
   <script src="<%=basePath%>js/bootstrap-table.min.js"></script>
    <script src="<%=basePath%>js/bootstrap-table-export.min.js"></script>
     <script src="<%=basePath%>js/jquery.min.js"></script> 
      <script src="<%=basePath%>js/jquery.base64.min.js"></script> 
      <script src="../../JS/TableJs.js"></script> 
      <script src="../../BootStrap/FamilyJS.js"></script> 
      <script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>  
<script>  
$(document).ready(function(){  
//获得文本框对象  
var t = $("#text_box");  
//初始化数量为1,并失效减  
$('#min').attr('disabled',true);  
    //数量增加操作  
    $("#add").click(function(){      
        // 给获取的val加上绝对值，避免出现负数  
        t.val(Math.abs(parseInt(t.val()))+1);  
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
  </head>
  
  <body>
   <div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
				    <div class="box">
		                   <c:choose>
		                     <c:when test="${user.name ==null}">
		                    <p> <a href="reg.jsp">注册</a>
		                      <a href="login.jsp">登录</a> </p>
		                       </c:when>
		                      <c:otherwise>
		               <div class="yonghuming"><c:out value="${user.name}"></c:out>, 欢迎您!</div>
		                    </c:otherwise>
		                </c:choose>
                   </div>
               </div>
			</div>
		</div>
	</div>



	
<div class="logo">
		<a href="goods/goods_showGoods"><h1>BUY All YOU WANT</h1></a>
	</div>
<ul class="nav nav-pills">
<li class="active"><a href="goods/goods_queryGood?content=1">首页</a></li>
<li><a href="goods/goods_queryGood?content=1">大牌彩妆</a></li>
<li><a href="goods/goods_queryGood?content=2">高定限量</a></li>
<li><a href="goods/goods_queryGood?content=3">钟表王国</a></li>
<li><a href="goods/goods_queryGood?content=4">母婴用品</a></li>
<li><a href="main-1.jsp">关于我们</a></li>
<form action="order/order_queryOrders" class="navbar-form navbar-right"  method="post">
          <input type="text" class="form-control" placeholder="Search" name="goods.goodsname">
        <button type="submit" class="btn btn-default">查询订单</button>
     </form>
  </ul>

  <main>   
  
        <meta charset="UTF-8">
        
        <button class="btn btn-block">购物车</button>
      
      
      <div class="widget-content padded clearfix"> 
        <table id="AddFamily" class="table table-bordered table-striped" width="1000px" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto"> 
           <thead> 
              <th class="check-header hidden-xs"> 
                 <input id="checkAll" name="checkAll" type="checkbox"> 


	          <th>商品</th>
	          <th>单价</th> 
	          <th>数量</th>  
	          <th>操作</th>
    
          </thead> 
        <tbody>
        <s:iterator value="gwcList" status="status">
	          <tr>
	            <td><s:property value="#status.index"></s:property></td>

	          
	            <td><s:property value="goods.goodsname"></s:property></td>
	            <td><s:property value="goods.price"></s:property></td>
	            <td>
	            <input id="min" name="" type="button" value="-" />    
				<input id="text_box" name="order.goodnum" type="text" value="1" style="width:30px;text-align: center"/>    
				<input id="add" name="" type="button" value="+" />   
	           </td>
	            
	            <td><a href="order/order_addGtoorder?gwc.gwcid=<s:property 
	                  value='gwcid'/>&user.name=<s:property value='#session.user.name'/>"><button id="btnEdit" type="button" class="btn btn-default"> 
      <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>下单 
      </button></a> 

      <a href="gwc/gwc_deleteGwc?gwc.gwcid=<s:property 
	                  value='gwcid'/>&user.name=<s:property value='#session.user.name'/>"><button id="btnDel" type="button" class="btn btn-default" data-toggle="modal" data-target="#DeleteForm" onclick=""> 
      <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>删除
      </button></a></td>

	          </tr>
	         </s:iterator>
        </tbody>
       </table> 

       </div> 

<!--  @*创建表格*@ -->
    <script type="text/javascript">  
     $(document).ready(function () { 
     $("#btnDel").click(function () { 
     $(":checked").parent().parent().fadeOut("show"); //隐藏所有被选中的input元素 
     }
     ) 
     $("tr").mousemove(function () { 
     $(this).css("background", "#F0F0F0"); //鼠标经过背景颜色变为灰色 
     }
     ) 
     $("tr").mouseout(function () { 
     $(this).css("background", "#fff"); //离开后背景颜色回复白色 
     }
     ) 
     //全选 
    $("#checkAll").click(function () { 
    if ($("#checkAll").attr("checked") == false) { 
         $("input[name='checkbox']").each(function () { 
        $(this).attr("checked", true); 
    }); 
    } else { 
         $("input[name='checkbox']").each(function () { 
        $(this).attr("checked", false); 
    }); 
    } 
    }); 
  }); 
  //绑定编辑、回车事件 
    $(function () { 
    $('#btnEdit').click(edit); 
    $('#cells, #rows').keyup(function (e) { 
    if (e.keyCode === 13) { 
       //添加存入数据库的代码 
    } 
    }); 
     }); 
   //将表格转成可编辑的表格 
    function edit(index) { 
    $('#table').editableTableWidget();         //效果是单击编辑按钮后，所有的都可以编辑 
    $(":checked").editableTableWidget(); 
    $(":checked").parent().parent().editableTableWidget();//整行的可以编辑 
    } 
 
</script> 
</body> 
</html>
	
  </body>
</html>