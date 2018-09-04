<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<fieldset>
	<legend>Edit</legend>
	<form action="/todo/edit" method="post">
		<input type="hidden" name="id" value="${todo.id}" /> <br>
		name: <input type="text" name="name" value="${todo.name}"  /> <br>
		detail: <input type="text" name="detail" value="${todo.detail}"  /> <br>
		Create Date: <input type="text" name="createDate" disabled value='${todo.createDate}' style="width:300px;" /> <br>
		<input type="submit" value="Save" />
	</form>
</fieldset>
</body>
</html>
