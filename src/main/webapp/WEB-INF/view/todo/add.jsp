<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css" crossorigin="anonymous">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js" crossorigin="anonymous"></script>
	<style>
		input.error{
			border-color:red;
		}
		
		label.error{
			color:red;
		}
	
	</style>
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col">
			<h1>Add TODO</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<form id="formAdd" action="/todo/add" method="post">
				<div class="form-group">
				    <label>name:</label>
				    <input type="text" name="name" class="form-control" />
				</div>
				<div class="form-group">
				    <label>detail:</label>
				    <input type="text" name="detail" class="form-control"/>
				</div>
				<div class="form-group">
					<label>deadline:</label>
				    <input type="input" name="deadline" id="deadline" class="form-control" />
				</div>
				<div class="form-group form-check">
				    <input type="checkbox" name="isFinish" id="isFinish" value="Y" class="form-check-input" />
				    <label class="form-check-label" for="isFinish">is finish</label>
				</div>
				<div class="form-group">
				    <input type="submit" class="btn btn-primary" value="Add" />
				</div>
			</form>
		</div>
	</div>
</div>
<script>

$('#deadline').datepicker({
	clearBtn: true
});

$("#formAdd").validate({
	rules: {
		name: {
			required: true,
			rangelength:[2,20]
		},
		detail: {
			required: true
		},
		deadline: {
			required: true
		}
	}
});
</script>
</body>
</html>
