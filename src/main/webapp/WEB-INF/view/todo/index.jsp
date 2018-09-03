<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/mustache.js/2.3.0/mustache.js"></script>
	<style>
	.todoList li{
		padding: 10px 0;
	}
		.todoList li b{
			display:inline-block;
			width:200px;
		}
		
		.todoList li span{
			display:inline-block;
			width:200px;
		}
		
		.todoList .list-head{
			font-weight:bold;
			font-size:20px;
			border-bottom:solid 1px #666;
		}
	</style>
	
	<Script>
		$(function(){
			
			var maxPage = 0;
			
			getTodoList();
			
			function getTodoList(){
				
				$.getJSON("/todo/getList", {
					name: $("#hidName").val(),
					pageNumber: $("#pageNumber").val()
					}, function(data){
						var template = $('#todoTemplate').html();
			            Mustache.parse(template);   // optional, speeds up future uses
			            var rendered = Mustache.render(template, {
			                "todoList": data.result
			            });
			            
			            $("#currentPage").html(data.currentPage + " / " + data.totalPage);
			            $("#todo").html(rendered);

			            $("#nextPage").attr("disabled",data.totalPage <= data.currentPage);
			            $("#prevPage").attr("disabled",data.currentPage <= 1);
			            
				});
			}
			
			$("#prevPage").click(function(){
				var $pn = $("#pageNumber");
				var number=parseInt($pn.val());
				if(number > 1){
					$pn.val(number - 1);
				}
				
				getTodoList();
			});
			
			$("#nextPage").click(function(){
				var $pn = $("#pageNumber");
				var number=parseInt($pn.val());
				$pn.val(number + 1);

				getTodoList();
			});
			
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
		});
		
	</Script>
</head>
<body>
<fieldset>
	<legend>List</legend>
	
	<input type="text" id="queryName" placeholder="Please input name..." />
	<input type="button" id="btnQuery" value="Query" />
	<input type="button" id="btnAdd" value="Add" />
	<input type="hidden" id="hidName" name="name" value="" />

	<br>
	Current Page Number : <span id="currentPage"></span>
	<ul class="todoList">
		<li class="list-head">
			<b>Name</b>
			<span>Detail</span>
			<span>Action</span>
		</li>
	</ul>
	<ul id="todo" class="todoList">
	
	</ul>
	
	<input type="hidden" id="pageNumber" value="1" />
	<input type="button" id="prevPage" value="prev">
	<input type="button" id="nextPage" value="next">
</fieldset>

<script type="text/html" id="todoTemplate">
{{#todoList}}
<li>
<b>{{name}}</b>
<span>{{detail}}</span>
<input type="button" class="btnDelete" data-id="{{id}}" value="delete" />
</li>
{{/todoList}}
</script>

</body>
</html>
