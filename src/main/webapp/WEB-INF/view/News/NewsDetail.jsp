<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
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
    	<input type="hidden" value="${checkone.id}">
    	<h5><p class="text-center">${checkone.title}</p></h5>
     	</div>
     </div>
    
     <div class="row">
    	<div class="col-sm">
    	<textarea class="form-control" id="exampleFormControlTextarea1" rows="3">${checkone.content}</textarea>
     	</div>
     </div>
     
     <div class="row">
    	<div class="col-sm">
    	<p class="text-right"><script>
		var date = new Date(${checkone.publishDate.getTime()});
		var standarddate= date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
		document.write(standarddate);
		</script></p>
     	</div>
     </div>

</div>
</body>
</html>