<%@ page contentType="text/html; charset=GBK" %>
<html>
<style type="text/css">
<!--
@import url("../aqgc/style_c.css");
-->
</style>
<head>
<title>Ajaxʵ��</title>
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
  //����XMLHttpRequest����
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
   //�õ���һ��htmlԪ�أ�����������Ԫ�ص����Ը�ֵ
var obj = document.all[objID];
   //�������󷽷���Ŀ�꣬��������Ϊ�첽�ύ
ajax.open("post", serverPage, true);
ajax.onreadystatechange = function()
{
   if (ajax.readyState == 4 && ajax.status == 200)
   {    //ajax.responseText�Ƿ������ķ���ֵ����ֵ����id=passport1��Ԫ�ص�����
   //innerHTML������Ի�˵���������ʾһ�鿪ʼ��Ǻͽ������֮�������
    obj.innerHTML = ajax.responseText;
   }
  }
   //��������
ajax.send(null);
  }
  function CheckGroupName()
  {
     getMyHTML("http://13.1.1.51:8080/ajax/check.jsp?groupName="+name_form.group_name.value, "passport1");
  }
  //��������������ǵ��û��Ľ���������ط��ص�group_name��������ʱ�ٸ����Ը���ԭ����
function sl(tx)
  {
   if(tx=='passport1')
  {
     document.all[tx].innerHTML = "<div class='explain_blue' align='left'>4-20 ���ַ� (������Сд��ĸ,����,����,�����ַ���) 1�����ֵ���2���ַ�������ʹ�����ġ�ע��󲻿��޸ġ�</div>";
    }
  }
function check()
{
   if(document.name_form.group_name.value.length<1)
   {
    alert("����������Ⱥ��ȡ�����֣�");
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
   if(obj.innerHTML.indexOf("����")==-1)
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
        <td width="22%" height="20" align="right">�û�����</td>
        <td width="61%" align="left"><INPUT name="group_name" type="text"
            value="" size=30 maxlength="50" onBlur="javaScript:CheckGroupName();"
            onFocus="return sl('passport1');" /></td>
        <td id="passport1" valign="top"><div class="explain_blue" align='left'><span class="gray">4-20
            ���ַ� (������Сд��ĸ,����,����,�����ַ���) 1�����ֵ���2���ַ���</span></div></td>
      </tr>
    </table></td>
</form>
</BODY>
</html>