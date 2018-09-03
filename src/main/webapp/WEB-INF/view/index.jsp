<%@page import="com.leo.model.Register"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.item{
	font-size 0px;
}

.title *,
.item *{
	margin:10px;
	display:inline-block;
}

 .name{
	width:200px;
	font-size 13px;
}

 .age{
	width:200px;
	font-size 13px;
}

 .hobby{
	width:200px;
	font-size 13px;
	}

.title{
	font-weight: bolder;
	font-size:20px;
	border-bottom: solid 1px #ccc;
}

</style>

<script>
function confirm(){
	if(!confirm("Sure?")){
		event.preventDefault();
	}
}
</script>
</head>
<body>
<fieldset>
<legend><b>报名表</b></legend>
<form action="/admission/add" method="post">
<input type="text" name="name">
<input type="text" name="age">
<input type="text" name="hobby">
<input type="submit" value="报名">
</form>
</fieldset>

<fieldset>
<legend><b>填报结果</b></legend>
<form action="/admission" method="get">
<input type="text" name="name" placeholder="please input your name" value="${queryname}">
<input type="submit" value="查询">
</form>
<br>
<ul>
<li class="title">
<span class="name">Name</span>
<span class="age">Age</span>
<span class="hobby">Hobby</span>
<span >Action</span>
</li>
<c:forEach
    items="${showlist}"
    begin="0"
    end="${showlist.size()}"
    var="replace"
    varStatus="status">
    <li class="item">
    <form action="/admission/delete" method="post">
			<span class="name">${replace.getName()}</span> 
			<span class="age">${replace.getAge()}</span>
			<span class="hobby">${replace.getHobby()}</span>
			<input type="hidden" name="id" value="${replace.getId()}">
			<input type="submit" value="删除"  onclick="confirm()">
			</form>
			</li>
    </c:forEach>
</ul>
</fieldset>

</body>
</html>