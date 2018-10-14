<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col">
			<h1>TODO List</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-8">
			<div class="input-group mb-3">
			  <input type="text" id="queryName" placeholder="Please input name..." class="form-control" />
			  <div class="input-group-append">
			    <input type="button" id="btnQuery" value="Query" class="btn btn-primary" />
			  </div>
			</div>
		</div>

	</div>
	<div class="row">
		<div class="col">
			
			<input type="button" id="btnAdd" value="Add"  class="btn" />
			<input type="hidden" id="hidName" name="name" value="" />
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
			      <th scope="col">Name</th>
			      <th scope="col">Detail</th>
			      <th scope="col">Log Date</th>
			      <th scope="col">Is finish</th>
			      <th scope="col">Action</th>
			    </tr>
			  </thead>
			  <tbody id="todo">
			    
			  </tbody>
			</table>
		
			<ul >
			
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<input id="pageNumber" type="hidden" value="1" />
			<nav aria-label="Page navigation example" id="pagerBox">
			</nav>
		</div>
	</div>
</div>

<script type="text/html" id="pagerTemplate">
<ul class="pagination">
	{{#prevDisabled}}
		<li class="page-item disabled"><a class="page-link">Previous</a></li>
	{{/prevDisabled}}
	{{^prevDisabled}}
		<li class="page-item"><a class="page-link prev" href="#">Previous</a></li>
	{{/prevDisabled}}

	{{#pager}}
		{{^disabled}}
		<li class="page-item"><a class="page-link pager" href="#">{{number}}</a></li>
		{{/disabled}}
		{{#disabled}}
		<li class="page-item disabled"><a class="page-link" href="#">{{number}}</a></li>
		{{/disabled}}
	{{/pager}}

	{{#nextDisabled}}
		<li class="page-item disabled"><a class="page-link">Next</a></li>
	{{/nextDisabled}}
	{{^nextDisabled}}
		<li class="page-item"><a class="page-link next" href="#">Next</a></li>
	{{/nextDisabled}}
	

	
</ul>
</script>

	<script type="text/html" id="todoTemplate">
{{#todoList}}
<tr>
	<th scope="row">{{name}}</th>
	<td>{{detail}}</td>
	<td>{{formattedDate}}</td>
	<td>{{isFinish}}</td>
	<td>
		<input type="button" class="btnEdit btn btn-primary btn-sm" data-id="{{id}}" value="edit" />
		<input type="button" class="btnDelete btn btn-sm" data-id="{{id}}" value="delete" />
	</td>
</tr>
{{/todoList}}
	</script>
	<Script>

		$(function(){
			
			var maxPage = 0;
			
			getTodoList();
			
			function getTodoList(){
				
				$.getJSON("/todo/getList", {
					keywords: $("#hidName").val(),
					pageIndex: $("#pageNumber").val()
					}, function(data){
						for(var i = 0; i< data.result.length; i++){
							var currentTodo = data.result[i];
							var currentDate = new Date(currentTodo.deadline);
							currentTodo.formattedDate = currentDate.getFullYear() + "/" + (currentDate.getMonth()+1) + "/" + currentDate.getDate();
						}	
						
						var template = $('#todoTemplate').html();
			            Mustache.parse(template);   // optional, speeds up future uses
			            var rendered = Mustache.render(template, {
			                "todoList": data.result
			            });
			            
			            $("#currentPage").html(data.currentPage + " / " + data.totalPage);
			            $("#todo").html(rendered);
						//$("#pageNumber").val(data.currentPage);
			            
			            var pagerTemplate = $('#pagerTemplate').html();
			            Mustache.parse(pagerTemplate);   // optional, speeds up future uses
			            
			            function getPager(currentPage, totalPage){
			            	var result =[];
			            	for(var i = 1;i <=totalPage;i++){
			            		result.push({
		            				number:i,
		            				disabled: (i === currentPage)
			            		});
			            	}
			            	
			            	return result;
			            }
			            
			            var pagerRendered = Mustache.render(pagerTemplate, {
			                prevDisabled: (data.currentPage === 1),
			                nextDisabled: (data.currentPage === data.totalPage),
			                pager: getPager(data.currentPage ,data.totalPage)
			            });
			            
			            $("#pagerBox").html(pagerRendered);  
				});
			}

			
			$("#btnAdd").click(function(){
				window.location = '/todo/addPage';
				
			});
			
			$("#btnQuery").click(function(){
				$("#pageNumber").val(1);
				$("#hidName").val($("#queryName").val());
				getTodoList();
			});
			
			$("#todo").on("click", ".btnDelete", function(){
				var currentId = $(this).data("id");

				$.post( "/todo/delete", {
							"id": currentId
						}, function(result){
							if(result){
								getTodoList();
							}else{
								alert("System error!!")
							}
							
			          });
			});
			
			$("#todo").on("click", ".btnEdit", function(){
				var currentId = $(this).data("id");

				window.location = "/todo/editPage?id=" + currentId;
			});
			
			$("#pagerBox").on("click", ".page-link", function(){
				var $pn = $("#pageNumber");
				if($(this).is(".prev")){
					var number=parseInt($pn.val());
					if(number > 1){
						$pn.val(number - 1);
					}
				}else if($(this).is(".next")){
					var number=parseInt($pn.val());
					$pn.val(number + 1);
				}else if($(this).is(".pager")){
					$pn.val($(this).text());
				}
				
				getTodoList();
				return false;
			});
			
		});
		
	</Script>
</body>
</html>
