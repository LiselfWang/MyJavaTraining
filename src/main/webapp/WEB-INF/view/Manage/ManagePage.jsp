<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/mustache.js/2.3.0/mustache.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-8">
		
      			<input type="hidden" id="hiddenkeywords" name="title" value=""></input>
 			<div class="input-group mb-3">
      			<input type="text" id="querykeywords" class="form-control" placeholder="Please inpur keywords" />
      			<div class="input-group-append">
      				<input type="button" id="query" value="查询" class="btn btn-primary" />
      			</div>
      		</div>
        </div>
    </div>
  
	<div class="row">
		<div class="col">
			<input type="button" id="add" value="新增" class="btn btn-warning btn-sm"></input>
    	</div>
	</div>
<div class="row">
	<div class="col">
		<table class="table">
			<colgroup>
				<col />
				<col style="width:200px;"/>
				<col style="width:200px;"/>
			</colgroup>
		  	<thead>
			    <tr>
			      <th scope="col" colspan="3"><h3>新闻列表</h3></th>
			    </tr>
			</thead>
			<tbody id="newsList" >
		 
			</tbody>
		</table>
	</div>
</div>


	<div class="row">
    	<div class="col">
    	<input type="hidden" id="pageIndex" value="1"></input>
    	<nav aria-label="Page navigation example">
        </nav>
		
    	</div>
	</div>
</div>

<script type="text/html" id="pagetemplate">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only" id="prePage">Previous</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only" id="nextPage">Next</span>
      </a>
    </li>
  </ul>

</script>

<script type="text/html" id="template">
{{#newsList}}
<tr>
<td class="title table-danger">{{title}}</td>
<td class="date table-success">{{standarddate}}</td>
<td>
<input type="button" class="editbtn btn btn-primary btn-sm table-secondary" data-key="{{id}}" value="编辑"></input>
<input type="button" class="delbtn btn btn-warning btn-sm" data-key="{{id}}" value="删除"></input>
</td>
</tr>
{{/newsList}}
</script>

<script>
$(function(){
	getNewsitems();
	function getNewsitems(){
		$.getJSON(
				"/manage/getNewsItems",
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
					})
					}
	$("#query").click(function(){
		$("#pageIndex").val(1);
		$("#hiddenkeywords").val($("#querykeywords").val());
		getNewsitems();
	})
	
	$("#prePage").click(function(){
		var page = $("#pageIndex");
		var index = parseInt(page.val());
		page.val(index-1);
		getNewsitems();
	})
	
		$("#nextPage").click(function(){
		var page = $("#pageIndex");
		var index = parseInt(page.val());
		page.val(index+1);
		getNewsitems();
	})
	
	$("#add").click(function(){
		window.location = "/manage/getAddPage";
	})
	
	$("#newsList").on("click",".delbtn",function(){
		var currentid = $(this).data("key");
		$.post("/manage/deleteItems",
				{"id":currentid},
				function(result){
					if(result){
						getNewsitems();
					}else{
						alert("failed");
					}
				})
	   })
	   
	 $("#newsList").on("click",".editbtn",function(){
			var currentid = $(this).data("key");
			window.location = "/manage/editPage?id="+currentid;
	 })
	
	});
</script>
</body>
</html>