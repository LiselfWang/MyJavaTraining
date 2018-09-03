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
			
			getTodoList();
			
			function getTodoList(){
				
				$.getJSON("/todo/getList", {
					name: $("#queryName").val(),
					pageNumber: $("#pageNumber").val()
					}, function(data){
						
					  var template = $('#todoTemplate').html();
			            Mustache.parse(template);   // optional, speeds up future uses
			            var rendered = Mustache.render(template, {
			                "todoList": data
			            });
			            
			            $("#todo").html(rendered);
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
		});
		
	</Script>
</head>
<body>
<fieldset>
	<legend>List</legend>
	<form id="queryForm" action="/todo" method="get">
		<input type="text" id="queryName' name="name" value="" placeholder="Please input name..." />
		<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
		<input type="button" id="prevPage" name="prevPage" value="prev">
		<input type="button" id="nextPage" name="nextPage" value="next">
		<input type="submit" value="Query" />
		<input id="btnAdd" type="button" value="Add" />
	</form>
	Current Page Number : 
	<ul class="todoList">
		<li class="list-head">
			<b>Name</b>
			<span>Detail</span>
			<span>Action</span>
		</li>
	</ul>
</fieldset>

<script type="text/html" id="todoTemplate">
{{#todoList}}
<li>
<b>{{name}}</b>
<span>{{detail}}</span>
<input type="submit" class="btnDelete" value="delete" />
</li>
{{/todoList}}
</script>

</body>
</html>
