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
    <div class="col-8">
  <div class="input-group">
  <input type="text" class="form-control" id="querykeywords" placeholder="Please inpur keywords">
  <input type="hidden" id="hiddenkeywords" name="title" value=""></input>
  <div class="input-group-append">
    <button class="btn btn-primary more" type="button" id="button-addon2 query">查询</button>
  </div>
</div>
  </div>
</div>
  <br>
<div class="row">
    <div class="col-12">
    <table class="table">
	<colgroup>
		<col />
		<col style="width:300px;"/>
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
  <nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
    <input type="hidden" id="pageIndex" value="1"></input>
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
</nav>
 </div>
  </div>
 </div>
 
<script type="text/html" id="template">
{{#newsList}}
<tr>
	<td><a href="/news/getNewsDetail?id={{id}}" class="title">{{title}}</a></td>
	<td class="date">{{standarddate}}</td>
</tr>
{{/newsList}}
</script>

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
</body>
</html>