<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<fieldset>
	<legend>Add</legend>
	<form action="/todo/add" method="post">
		name: <input type="text" name="name" /> <br>
		detail: <input type="text" name="detail" /> <br>
		fool: <input type="checkbox" name="fool" value="123" /> <br>
		<input type="submit" value="Add" />
	</form>
</fieldset>
</body>
</html>
