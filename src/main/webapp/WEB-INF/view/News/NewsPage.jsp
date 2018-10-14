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

#logo,
#mainPage,
#news,
#aboutUs{
display: inline-block;
font-size: 30px;
font-weight: bolder;
width:300px;
align-content:center;
}

#news{
 background-color:aquamarine;
}

#input{
position:fixed;
left:734px;
}

#newsSection{
width:700px;
border:solid 2px black;
font-size: 0px;
position:fixed;
left:250px;
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

#prePage,
#nextPage,
#query{
width:80px;
marigin:100px;
}

#prePage{
position:relative;
left:250px;
top: 600px;
padding:5px;
}
#nextPage{
position:relative;
left:815px;
top: 600px;
padding:5px;
}

</style>

<script>
$(function(){
	getShowitems();
	function getShowitems(){
		$.getJSON(
				"/news/getNewsitems",
				{"pageIndex":$("#pageIndex").val(),
			     "keywords":$("#hiddenkeywords").val()},
				function(data){
					for(var i=0;i<data.result.length;i++){
						var current = data.result[i];
						var date = new Date(current.createDate);
						current.standarddate = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
					}
					
					var tmp = $("#template").html();
					var realdata = Mustache.render(tmp,{"newsList":data.result});
					$("#newsList").html(realdata);	
					$("#prePage").attr("disabled",data.pagenumber<=1);
					$("#nextPage").attr("disabled",data.pagenumber>=data.totalpage);
				});
	}
	
	$(".more").click(function(){
		window.location = "/news/getNewsPage";
	})
	
	$("#query").click(function(){
		$("#pageIndex").val(1);
		$("#hiddenkeywords").val($("#querykeywords").val());
		getShowitems();
	})
	
	$("#prePage").click(function(){
		var page = $("#pageIndex");
		var index = parseInt(page.val());
		page.val(index-1);
		getShowitems();
	})
	
		$("#nextPage").click(function(){
		var page = $("#pageIndex");
		var index = parseInt(page.val());
		page.val(index+1);
		getShowitems();
	})
	
})
</script>
</head>
<body>
<div id="title">
<h1 id="logo">Logo</h1>
<a href="http://localhost:8080/news" id="mainPage">首页</a>
<a href="http://localhost:8080/news/getNewsPage" id="news">新闻</a>
<h1 id="aboutUs">关于我们</h1>
</div>
<br>
<div id="input">
<input type="text" id="querykeywords" placeholder="Please inpur keywords"></input>
<input type="button" id="query" value="查询"></input>
<input type="hidden" id="hiddenkeywords" name="title" value=""></input>
</div>
<div id="newsSection">
<ul id="newsList">

</ul>
</div>
<input type="hidden" id="pageIndex" value="1"></input>
<input type="button" id="prePage" value="上一页"></input>
<input type="button" id="nextPage" value="下一页"></input>

<script type="text/html" id="template">
{{#newsList}}
<li>
<a href="/news/getNewsDetail?id={{id}}" class="title">{{title}}</a>
<span class="date">{{standarddate}}</span>
</li>
{{/newsList}}
</script>
</body>
</html>