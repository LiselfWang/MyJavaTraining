<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fieldset>
<legend><b>Add Record</b></legend>
<form action="/borrow/addinfo" method="post">
<input type="text" name="name" placeholder="please input your name">
<input type="text" name="classes" placeholder="please input your class">
<input type="text" name="bookname" placeholder="please input borrow bookname">
<input type="submit" value="Submit">
</form>
</fieldset>
</body>
</html>