<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>带提示的Ajax验证表单</title>
<style type="text/css">
form {
	width:500px;
	border:1px solid #ccc;
}
fieldset {
	border:0;
	padding:10px;
	margin:10px;
	position:relative;
}
label {
	display:block;
	font:normal 12px/17px verdana;
}
input {width:160px;}
span.hint {
	font:normal 11px/14px verdana;
	background:#eee url(http://www.poluoluo.com/jzxy/UploadFiles_333/201107/20110730193853491.gif) no-repeat top left;
	color:#444;
	border:1px solid #888;
	padding:5px 5px 5px 40px;
	width:250px;
	position:absolute;
	margin: -12px 0 0 14px;
	display:none;
}


fieldset.welldone span.hint {
	background:#9fd680 url(http://www.poluoluo.com/jzxy/UploadFiles_333/201107/20110730193854173.jpg) no-repeat top left;
	border-color:#749e5c;
	color:#000;
}
fieldset.kindagood span.hint {
	background:#ffffcc url(http://www.poluoluo.com/jzxy/UploadFiles_333/201107/20110730193854311.jpg) no-repeat top left;
	border-color:#cc9933;
}


fieldset.welldone {
	background:transparent url(http://www.poluoluo.com/jzxy/UploadFiles_333/201107/20110730193854611.gif) no-repeat 194px 19px;
}
fieldset.kindagood {
	background:transparent url(http://www.poluoluo.com/jzxy/UploadFiles_333/201107/20110730193854780.gif) no-repeat 194px 19px;
}


</style>

<script type="text/javascript">
function checkUsernameForLength(whatYouTyped) {
	var fieldset = whatYouTyped.parentNode;
	var txt = whatYouTyped.value;
	if (txt.length > 5) {
		fieldset.className = "welldone";
	}
	else {
		fieldset.className = "";
	}
}
function checkPassword(whatYouTyped) {
	var fieldset = whatYouTyped.parentNode;
	var txt = whatYouTyped.value;
	if (txt.length > 3 && txt.length < 8) {
		fieldset.className = "kindagood";
	} else if (txt.length > 7) {
		fieldset.className = "welldone";
	} else {
		fieldset.className = "";
	}
}
function checkEmail(whatYouTyped) {
	var fieldset = whatYouTyped.parentNode;
	var txt = whatYouTyped.value;
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(txt)) {
		fieldset.className = "welldone";
	} else {
		fieldset.className = "";
	}
}
function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      oldonload();
      func();
    }
  }
}

function prepareInputsForHints() {
  var inputs = document.getElementsByTagName("input");
  for (var i=0; i<inputs.length; i++){
    inputs[i].onfocus = function () {
      this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
    }
    inputs[i].onblur = function () {
      this.parentNode.getElementsByTagName("span")[0].style.display = "none";
    }
  }
}
addLoadEvent(prepareInputsForHints);
</script>
</head>
<body>
<form
	action="#"
	name="basicform"
	id="basicform" >
<fieldset>
	<label for="username">用户名:</label>
	<input
		type="text"
		id="username"
		onkeyup="checkUsernameForLength(this);" />
	<span class="hint">用户名最低6位哦</span>
</fieldset>

<fieldset>
	<label for="password">密码:</label>
	<input
		type="password"
		id="password"
		onkeyup="checkPassword(this);" />
	<span class="hint">密码需要4到8位哦</span>
</fieldset>

<fieldset>
	<label for="email">Email地址:</label>
	<input
		type="text"
		id="email"
		onkeyup="checkEmail(this);" />
	<span class="hint">You can enter your real address without worry - we don't spam!</span>
</fieldset>
</form>
</body>
</html>