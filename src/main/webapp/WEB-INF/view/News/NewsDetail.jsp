<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
<style>
#title{
width:1250px;
font-size: 0px;
border-bottom: solid 2px black;
padding: 0,50px,0,50px;
margin:0,50px;
align-content: center
}

.logo,
.mainPage,
.news,
.aboutUs{
display: inline-block;
font-size: 30px;
font-weight: bolder;
width:300px;
align-content:center;
}

.news{
 background-color:aquamarine;
}

#newscontent *{
width:1250px;
font-size: 18px;
align-content:center;
}

#content{
font-size: 13px;
border:1px solid rgba(0,0,0,0);
}

#newstitle{
font-size: 25px;
font-weight:bolder;
align-content:center;
}

</style>
<script>

</script>

</head>
<body>
<div id="title">
<h1 class="logo">Logo</h1>
<a href="http://localhost:8080/news" class="mainPage">首页</a>
<a href="http://localhost:8080/news/getNewsPage" class="news">新闻</a>
<h1 class="aboutUs">关于我们</h1>
</div>
<div id="newscontent">
<input type="hidden" value="${checkone.id}">
<h1 id="newstitle">${checkone.title}</h1><br>
<textarea rows="5" cols="50" id="contetnt">${checkone.content}</textarea><br>
<span>发布时间：<script>
var date = new Date(${checkone.publishDate.getTime()});
var standarddate= date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
document.write(standarddate);
</script></span>
</div>
</body>
</html>