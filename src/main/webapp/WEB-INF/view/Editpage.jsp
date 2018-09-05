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
<legend><b>更新信息</b></legend>
<form action="/buytickets/edit" method="post">
Id:<label>${info.id}</label><br>
Name:<input type="text" name="name" value="${info.name}"><br>
Age:<input type="text" name="age" value="${info.age}"><br>
Destination:<input type="text" name="destination" value="${info.destination}"><br>
Date:<input type="text" name="date" disabled value="${info.date}"><br>
<input type="submit" value="保存">
</form>
</fieldset>
</body>
</html>