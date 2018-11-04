<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">

<div class="row">
    <div class="col-sm">
      <h2 class="logo">Logo</h2>
    </div>
     <div class="col-sm">
     <h2><a href="http://localhost:8080/news" class="mainPage">首页</a></h2>
    </div>
    <div class="col-sm">
      <h2><a href="http://localhost:8080/news/getNewsPage" class="news">新闻</a></h2>
    </div>
    <div class="col-sm">
      <h2><class="aboutUs">关于我们</h2>
    </div>
  </div>
<br>
<div class="row">
	<div class="col-sm">
	<table class="table">
	<colgroup>
		<col />
		<col style="width:200px;"/>
	</colgroup>
  		<thead class="thead-dark">
    		<tr>
      		<th scope="col">新闻摘要</th>
      		<th scope="col">发布日期</th>
   			 </tr>
  		</thead>
  		<tbody id="newsList">
    
  		</tbody>
	</table>
	</div>
</div>

<div class="row">
	<div class="col-sm">
		<input type="button" class="btn btn-primary more" value="更多"></input>

	</div>
</div>
</div>

<script type="text/html" id="template">
{{#newsList}}
<tr>
<td>
<a href="news/getNewsDetail?id={{id}}">{{title}}</a>
</td>
<td>{{standarddate}}</td>
<tr>
{{/newsList}}
</script>

<script>
$(function(){
	getNewsList();
	function getNewsList(){
		$.getJSON(
				"/news/getNewsList",
				function(data){
					for(var i=0;i<data.length;i++){
						var current = data[i];
						var date = new Date(current.createDate);
						current.standarddate = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();	
					}
					
					var tmp = $("#template").html();
					var realdata = Mustache.render(tmp,{"newsList":data});
					$("#newsList").html(realdata);	
				});
	}
	
	$(".more").click(function(){
		window.location = "/news/getNewsPage";
	})
	
})
</script>
</body>
</html>