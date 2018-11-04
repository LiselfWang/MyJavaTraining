<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
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
      				<input type="button" id="query" value="查询" class="btn btn-primary btn-sm" />
      			</div>
      		</div>
        </div>
    </div>
  
	<div class="row">
		<div class="col">
			<input type="button" id="add" value="新增" class="btn btn-sm"></input>
    	</div>
	</div>
<div class="row">
	<div class="col">
		<table class="table table-striped table-dark">
			<colgroup>
			    <col style="width:200px;"/>
				<col />
				<col style="width:200px;"/>
				<col style="width:100px;"/>
				<col style="width:200px;"/>
			</colgroup>
		  	<thead>
			    <tr>
			      <th><h4>新闻标题</h4></th>
			      <th><h4>新闻内容</h4></th>
			      <th><h4>发布日期</h4></th>
			      <th><h4>发布</h4></th>
			      <th><h4>操作</h4></th>
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
    	<nav aria-label="Page navigation example" class="pageSection">
    	
        </nav>
    	</div>
	</div>
</div>

<script type="text/html" id="pagetemplate">
  <ul class="pagination">
{{#prevDisabled}}
    <li class="page-item disabled">
      <a class="page-link prePage" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
{{/prevDisabled}}

{{^prevDisabled}}
  <li class="page-item">
      <a class="page-link prePage" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
{{/prevDisabled}}

{{#pager}}
{{#disabled}}
    <li class="page-item disabled"><a class="page-link pager" href="#">{{number}}</a></li>
{{/disabled}}

{{^disabled}}
 <li class="page-item"><a class="page-link pager" href="#">{{number}}</a></li>
{{/disabled}}
{{/pager}}

{{#nextDisabled}}
    <li class="page-item disabled">
      <a class="page-link nextPage" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
{{/nextDisabled}}
{{^nextDisabled}}
    <li class="page-item">
      <a class="page-link nextPage" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
{{/nextDisabled}}

  </ul>
</script>

<script type="text/html" id="template">
{{#newsList}}
<tr>
<td class="title">{{title}}</td>
<td class="content">{{content}}</td>
<td class="date">{{standarddate}}</td>
<td class="status">{{status}}</td>
<td>
<input type="button" class="editbtn btn btn-primary btn-sm" data-key="{{id}}" value="编辑"></input>
<input type="button" class="delbtn btn btn-sm" data-key="{{id}}" value="删除"></input>
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
						var date = new Date(current.publishDate);
						current.standarddate = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();	
						}
				    var tmp = $("#template").html();
					var realdata = Mustache.render(tmp,{"newsList":data.result});
					$("#newsList").html(realdata);
					
					 function getpager(pageIndex,totalPage){
						 var pageArray = [];
						 for(var i=1;i<=totalPage;i++){
							 pageArray.push({
								 number:i,
								 disabled:(i===pageIndex)
							 });
						 }
						 return pageArray;
					 }
					 

					 var pagetmp = $("#pagetemplate").html();
					 var pageRender = Mustache.render(pagetmp,{
						 prevDisabled:(data.pagenumber===1),
					     nextDisabled:(data.pagenumber===data.totalpage),
					     pager:getpager(data.pagenumber,data.totalpage)
					 });
					 
					 $(".pageSection").html(pageRender);
					 
					})
					}
	
	
	$("#query").click(function(){
		$("#pageIndex").val(1);
		$("#hiddenkeywords").val($("#querykeywords").val());
		getNewsitems();
	})
	

	$(".pageSection").on("click",".page-link:not(.disabled)",function(){
		var pn = $("#pageIndex");
		if($(this).is(".prePage")){
			var number = parseInt(pn.val());
			pn.val(number-1);
		}else if($(this).is(".nextPage")){
			var number = parseInt(pn.val());
			pn.val(number+1);
		}else if($(this).is(".pager")){
			pn.val($(this).text());
		}
		getNewsitems();
		return false;
	})
	
	$("#add").click(function(){
		window.location = "/manage/getAddPage";
	})
	
	$("#newsList").on("click",".delbtn",function(){
		var currentid = $(this).data("key");
		if(window.confirm("是否确认删除")){
			$.post("/manage/deleteItems",
					{"id":currentid},
					function(result){
						if(result){
							getNewsitems();
						}else{
							alert("failed");
						}
					})
		}
		
	   })
	   

	 $("#newsList").on("click",".editbtn",function(){
			var currentid = $(this).data("key");
			window.location = "/manage/editPage?id="+currentid;
	 })
	
	});
	
</script>
</body>
</html>