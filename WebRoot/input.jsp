<%@ page contentType="text/html; charset=GBK" %>
<html>
<style type="text/css">
<!--
@import url("../aqgc/style_c.css");
-->
</style>
<head>
<title>Ajax实例</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.style1 {
    color: #FF3333;
    font-weight: bold;
}
.style14 {
    font-size: 13px
}
.text12black {
    font-size: 12px;
}
-->
</style>
</head>
<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0"
    marginheight="0" marginwidth="0">
<center>
<table width="748" border="0" align="center" cellpadding="0"
    cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<script language="javascript">
  //创建XMLHttpRequest对象
function GetO()
{
  var ajax=false;
   try
   {
    ajax = new ActiveXObject("Msxml2.XMLHTTP");
   }
   catch (e)
   {
     try
     {
      ajax = new ActiveXObject("Microsoft.XMLHTTP");
     }
     catch (E)
     {
      ajax = false;
     }
   }
   if (!ajax && typeof XMLHttpRequest!='undefined')
   {
    ajax = new XMLHttpRequest();
   }
   return ajax;
}
 
function getMyHTML(serverPage, objID) {
  var ajax = GetO();
   //得到了一个html元素，在下面给这个元素的属性赋值
var obj = document.all[objID];
   //设置请求方法及目标，并且设置为异步提交
ajax.open("post", serverPage, true);
ajax.onreadystatechange = function()
{
   if (ajax.readyState == 4 && ajax.status == 200)
   {    //ajax.responseText是服务器的返回值，把值赋给id=passport1的元素的属性
   //innerHTML这个属性或说这个变量表示一组开始标记和结束标记之间的内容
    obj.innerHTML = ajax.responseText;
   }
  }
   //发送请求
ajax.send(null);
  }
  function CheckGroupName()
  {
     getMyHTML("http://13.1.1.51:8080/ajax/check.jsp?groupName="+name_form.group_name.value, "passport1");
  }
  //这个函数的作用是当用户的焦点从其他地方回到group_name这个输入框时再给属性赋回原内容
function sl(tx)
  {
   if(tx=='passport1')
  {
     document.all[tx].innerHTML = "<div class='explain_blue' align='left'>4-20 个字符 (包括大小写字母,中文,数字,特殊字符等) 1个汉字等于2个字符，建议使用中文。注册后不可修改。</div>";
    }
  }
function check()
{
   if(document.name_form.group_name.value.length<1)
   {
    alert("请您给您的群组取个名字！");
     document.name_form.group_name.focus();
     return false;
    }
  if(!OK())
  {
    return false;
   }
  document.name_form.action='addgroup.do';
   document.name_form.target='_parent';
   document.name_form.submit();
  }
  function OK()
  {
   var obj = document.getElementById("passport1");
   if(obj.innerHTML.indexOf("可用")==-1)
   {
    return false;
    }
    return true;
  }
</script>
<form name="name_form" method=post>
  <td height="200" valign="top"><table width="100%" height="270" border="1" bordercolor="#96D6E8"
    class="text12black">
      <tr>
        <td width="22%" height="20" align="right">用户名：</td>
        <td width="61%" align="left"><INPUT name="group_name" type="text"
            value="" size=30 maxlength="50" onBlur="javaScript:CheckGroupName();"
            onFocus="return sl('passport1');" /></td>
        <td id="passport1" valign="top"><div class="explain_blue" align='left'><span class="gray">4-20
            个字符 (包括大小写字母,中文,数字,特殊字符等) 1个汉字等于2个字符。</span></div></td>
      </tr>
    </table></td>
</form>
</BODY>
</html>