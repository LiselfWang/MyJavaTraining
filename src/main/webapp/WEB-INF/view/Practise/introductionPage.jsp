<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cat Love You!</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
<link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/twitter-bootstrap/4.2.1/js/bootstrap.min.js"></script>
<style>
.website{
width: 1440px;
height: 1500px;
margin:0 auto;
text-align:center;
}

.loginNavigation{
width:100%;
height: 30px;
line-height: 30px;
background-color:black;
font-size: 0px;
position: relative;
vertical-align: middle;
}

.loginNavigation .login{
width:400px;
text-align:right;
position: absolute;
right:120px;
font-size: 10px;
color: aliceblue !important;
font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
}

.navigation{
height:85px;
width:100%;
padding:0px 130px ;
position: relative;
}

.navigation-left{
width:425px;
height:85px;
font-size: 0px;
text-align:center;
display:inline-block;
float:left;
}

.navigation-right{
width:340px;
height:85px;
font-size: 0px;
text-align:center;
display:inline-block;
float:right;
}

.navigation-center{
margin: 0px -160px;
width:400px; 
height:300px;
position: absolute;
left: 50%;
top:-38px;
background-size: 200px 260px !important;
}

.title{
margin: 5px;
display: inline-block;
width:75px;
height:75px;
font-size: 16px;
text-align:center;
line-height: 75px;
}

.title a{
color:black;
transition: linear 0.1s;
}

.title a:hover{
color:tomato;
}

.guide{
width:100%;
height:120px;
position: relative;
text-align:center;
}

.guide .text{
position: absolute;
top:20px;
font-size:24px;
left:660px;
}

.guide .english{
position: absolute;
top:70px;
font-size:16px;
color:#999;
left:600px;
}

.images-top,.images-bottom{
width:100%;
height:250px;
font-size: 0px;
text-align: center;
}

.images-top .buou{
position: inline-block;
width:475px;
height: 230px;
margin:10px 6px;
}
.images-top .jiafei,.jinjianceng,.yingduan{
width:230px;
position: inline-block;
margin:10px 6px;
}

.images-bottom .meiduan,.zheer,.wumaomao{
width:230px;
position: inline-block;
margin:10px 6px;
}

.images-bottom .aijiaomao{
position: inline-block;
width:475px;
margin:10px 6px;
}

.button{
border: silver 1px solid;
margin:40px auto;
border-radius:10px;
text-align: center;
width:180px;
height: 60px;
line-height: 60px;
vertical-align: middle;
}

.button a{
color:black;
font-size:14px;
}

.button a:hover{
color:tomato;
}

/* .contain-box{
	width:100px;
	height:100px;
	background-color: red;
	overflow: hidden;
}

.contain-box .moving{
	transform: translateX(-100px);
	transition: linear 0.3s;
}

.contain-box:hover .moving{
	transform: translateX(0);
}

.box{
	width:100px;
	height:100px;
	background-color: aquamarine;
}

.moving{
	transform: translateX(500px);
} */

</style>
</head>
<!-- <body>

<div class="contain-box">
	<div class="box moving">
		布偶猫！！
	</div>
</div> -->
<div class="website">
	<div class="loginNavigation">
		<div class="login">
			您好，欢迎来到猫咪交易网&nbsp;&nbsp;&nbsp;
			<a>登录</a>&nbsp;|&nbsp;<a>免费注册</a>
		</div>	
	</div>
	<div class="navigation">
		<div class="navigation-left">
			<div class="title">
				<a href="http://www.maomijiaoyi.com/" target="_blank">首页</a>
			</div>
			<div class="title">
				<a href="http://www.maomijiaoyi.com/index.php?/chanpinliebiao_c_2.html" target="_blank">买猫卖猫</a>
			</div>
			<div class="title">
				<a href="http://www.maomijiaoyi.com/index.php?/xinwenliebiao_3.html" target="_blank">猫咪咨询</a>
			</div>
			<div class="title">
				<a href="http://www.maomijiaoyi.com/index.php?/xinwenliebiao_4.html" target="_blank">选猫知识</a>
			</div>
			<div class="title">
				<a href="http://www.maomijiaoyi.com/index.php?/pinzhongdaquan_5.html" target="_blank">猫咪品种</a>
			</div>
		</div>
		<div class="navigation-right">
			<div class="title">
				<a href="http://localhost:8080/maomao/myself">加入我们</a>
			</div>
			<div class="title">
				<a href="http://www.maomijiaoyi.com/index.php?/xinwenliebiao_6.html" target="_blank">联系我们</a>
			</div>
			<div class="title">
				<a href="http://www.maomijiaoyi.com/index.php?/lianxiwomen.html" target="_blank">关于我们</a>
			</div>
			<div class="title">
			<a href="http://www.maomijiaoyi.com/index.php?/home/ReleasePost" target="_blank">发布信息</a>
			</div>
		</div>
		<div class="navigation-center" style="background:url(/static/images/cat.png) top no-repeat;">
		</div>
	</div>
	<div class="background" style="background:url(http://www.maomijiaoyi.com/application/views/TPL_SIMPLE/images/index_tab_tu1.jpg?v=1.1) center no-repeat; height: 460px;">
	</div>
	<div class="guide">
		<span class="text">热门猫咪</span>
		<span class="english">——&nbsp;&nbsp; FAVORITE PET CAT &nbsp;&nbsp;——</span>
	</div>
	<div class="images-top">
		<img class="buou" src="http://www.maomijiaoyi.com/application/views/TPL_SIMPLE/images/breeds_37.jpg"/>
		<img class="jiafei" src="http://www.maomijiaoyi.com/application/views/TPL_SIMPLE/images/breeds_38.jpg"/>
		<img class="jinjianceng" src="http://www.maomijiaoyi.com/application/views/TPL_SIMPLE/images/breeds_39.jpg"/>
		<img class="yingduan" src="http://www.maomijiaoyi.com/application/views/TPL_SIMPLE/images/breeds_40.jpg"/>
	</div>
	<div class="images-bottom">
		<img class="meiduan" src="http://www.maomijiaoyi.com/application/views/TPL_SIMPLE/images/breeds_43.jpg"/>
		<img class="zheer" src="http://www.maomijiaoyi.com/application/views/TPL_SIMPLE/images/breeds_44.jpg"/>
		<img class="wumaomao" src="http://www.maomijiaoyi.com/application/views/TPL_SIMPLE/images/breeds_52.jpg"/>
		<img class="aijiaomao" src="http://www.maomijiaoyi.com/application/views/TPL_SIMPLE/images/breeds_54.jpg"/>
	</div>
	<div class="button">
		<a href="http://www.maomijiaoyi.com/index.php?/pinzhongdaquan_5.html">查看更多 >></a>
	</div>
</div>
</body>
</html>