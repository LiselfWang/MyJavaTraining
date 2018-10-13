<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.mainPage{
 background-color:aquamarine;
}

#newsSection{
width:700px;
border:solid 2px black;
font-size: 0px;
position:fixed;
right:180px;
top: 150px;
padding:20px;
}

.title,
.date{
display:inline-block;
font-size:13px;
margin:20px;
}

.title{
width:450px;
}


.date{
width:100px;
align-content:right;
}

.more{
position:absolute;
right:30px;
bottom:10px;
width:80px;
}
</style>

<script>
$(function(){
	getNewsList();
	function getNewsList(){
		$.getJSON(
				"/news/getNewsList",
				function(data){
					for(var i=0;i<data.result.length;i++){
						var current = data.result[i];
						var date = new Date(current.createDate);
						current.standarddate = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();	
					}
					
					var tmp = $("#template").html();
					var realdata = Mustache.render(tmp,{"newsList":data.result});
					$("#newsList").html(realdata);	
				});
	}
	
	$(".more").click(function(){
		window.location = "/news/getNewsPage";
	})
	
})
</script>
</head>
<body>
<div id="title">
<h1 class="logo">Logo</h1>
<a href="http://localhost:8080/news" class="mainPage">首页</a>
<a href="http://localhost:8080/news/getNewsPage" class="news">新闻</a>
<h1 class="aboutUs">关于我们</h1>
</div>

<div id="newsSection">
<ul id="newsList">

</ul>
<input type="button" class="more" value="更多"></input>
</div>

<script type="text/html" id="template">
{{#newsList}}
<li>
<a href="news/getNewsDetail?id={{id}}" class="title">{{title}}</a>
<span class="date">{{standarddate}}</span>
</li>
{{/newsList}}
</script>
</body>
</html>