<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>主页</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="css/css.css" />
	</head>
	<body class="homepage">
		<div id="page-wrapper">
				<div id="header">
					<div class="inner">
					  <header>
					    <div class="inner">
					      <header>
					        <h1><a href="#" id="logo">Honey</a></h1>
					        <hr />
					        <p>寻蜜人生</p>
				          </header>
					      <footer> <a href="#banner" class="button circled scrolly">开始</a> </footer>
				        </div>
					    <h1>&nbsp;</h1>
					  </header>
					</div>
						<nav id="nav">
							<ul>
								<li><a href="main.jsp">主页</a></li>
								<li>
									<a href="gouwuche.jsp">购物车</a>
								</li>
								<li><a href="index.jsp">商品详情</a></li>
								<li><a href="liuyan.jsp">给我留言</a></li>
                                <li><a href="gerenzhongxin.jsp">个人中心</a></li>
							</ul>
						</nav>

				</div>

			<!-- Banner -->
				<section id="banner">
					<header>
						<h2>热卖推荐</h2>
   					</header>
				</section>

			<!-- Carousel -->
				<section class="carousel">
					<div class="reel">

						<article>
							<a href="main.jsp" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
							<header>
								<h3><a href="#">荆条蜜</a></h3>
							</header>
							<p>止咳润肺、健胃通便、促进体力恢复</p>
						</article>

						<article>
							<a href="main.jsp" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
							<header>
								<h3><a href="#">糠椴蜜</a></h3>
							</header>
							<p>清热补中、润肺止咳、解毒润燥</p>
						</article>

						<article>
							<a href="main.jsp" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
							<header>
								<h3><a href="#">枣花蜜</a></h3>
							</header>
							<p>补血益气</p>
						</article>

						<article>
							<a href="main.jsp" class="image featured"><img src="images/pic04.jpg" alt="" /></a>
							<header>
								<h3><a href="#">洋槐蜜</a></h3>
							</header>
							<p>美容养颜、排毒清脂、祛斑正气</p>
						</article>

						<article>
							<a href="main.jsp" class="image featured"><img src="images/pic05.jpg" alt="" /></a>
							<header>
								<h3><a href="#">枸杞蜜</a></h3>
							</header>
							<p>主调血气两亏、体质虚弱、视力下降</p>
						</article>

						<article>
							<a href="main.jsp" class="image featured"><img src="images/picfeng.jpg" alt="" /></a>
							<header>
								<h3><a href="#">蜂王浆</a></h3>
							</header>
							<p>降低血糖血脂血压、抗衰老抗氧化</p>
						</article>
					</div>
				</section>
				
				

		<!--Scripts -->
			<script src="js/jquery.min.js"></script><!--轮播-->
			<script src="js/jquery.dropotron.min.js"></script>
			<script src="js/jquery.scrolly.min.js"></script>
			<script src="js/jquery.onvisible.min.js"></script>
			<script src="js/skel.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script>
	</body>
</html>