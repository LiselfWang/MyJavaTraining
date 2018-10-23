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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js" crossorigin="anonymous"></script>
</head>
<style>
input.error{
			border-color:red;
		}
		
label.error{
			color:red;
		}
</style>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col">
			<h1>Edit Page</h1>
		</div>
	</div>
	
<div class="row">
		<div class="col">	
<form id="formEdit" action="/manage/getEditInfo" method="post">
  <div class="form-group">
  	<input type="hidden" name="id" value="${editone.id}"/>
    <label for="formGroupExampleInput">Title:</label>
    <input type="text" class="form-control" name="title" id="newsTitle" value="${editone.title}"/>
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Content</label>
    <input type="text" class="form-control" name="content" id="newsContent" value="${editone.content}"/>
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">PublishDate:</label>
    <input type="text" class="form-control" name="publishDate" id="newsPublish" value="${editone.publishDate}"/>
  </div>
  <div class="form-group">
    <div class="form-check">
      <input type="checkbox" class="form-check-input" name="status" id="check" ${editone.status == "Y" ? "checked" :""} value="Y"/>
      <label class="form-check-label" for="check">
        Is Shown
      </label>
    </div>
  </div>
  <button type="submit" class="btn btn-primary" id="Save">Save</button>
  <button type="button" class="btn btn-primary" id="Cancel">Cancel</button>
</form>
</div>
	</div>
</div>

<script>
	$("#Cancel").click(function(){
		window.location = "/manage";
	})
	
	$("#newsPublish").datepicker({
	clearBtn: true
	});
	
	 $("#formEdit").validate({
		 rules: {
			    title:{
					required: true,
					rangelength:[1,30]
				},
				content: {
					required: true,
					rangelength:[1,100]
				},
				publishDate: {
					required: true
				}
			}	 
		 });
</script>
</form>
</body>
</html>