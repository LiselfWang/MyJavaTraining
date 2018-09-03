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
<legend><b>填写信息</b></legend>
<form action="/buytickets/add" method="post">
<input type="text" name="name" placeholder="please input your name">
<input type="text" name="age" placeholder="please input your age">
<input type="text" name="destination" placeholder="please input your destination" >
<input type="submit" value="提交">
</form>
</fieldset>
</body>
</html>