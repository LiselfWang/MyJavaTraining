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
<legend><b>Edit Record</b></legend>
<form action="/borrow/editinfo" method="post">
Id: <label>${editone.id}</label><br>
<input type="hidden" name="id" value="${editone.id}">
Name: <input type="text" name="name" value="${editone.name}"><br>
Class: <input type="text" name="classes" value="${editone.classes}"><br>
Bookname: <input type="text" name="bookname" value="${editone.bookname}"><br>
Borrowdate: <label>${editone.borrowdate}</label><br>
<input type="submit" value="Save">
</form>
</fieldset>
</body>
</html>