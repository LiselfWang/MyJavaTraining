<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/mustache.js/2.3.0/mustache.js"></script>
<style>
.list{
font-size:0px;
}


.list .title{
font-weight:bolder;
font-size:20px;
border-bottom:solid 1px #666;
}

.list li{
width:200px;
font-size:13px;
}


</style>
</head>
<body>
<fieldset>
<legend>Borrow Record</legend>
<input type="text" id="queryname" placeholder="please input your name">
<input type="hidden" id="hiddenname" name="name" value="">
<input type="button" value="Query">
<input type="button" value="Add Record"><br>
<span id="currentPage">当前的页码：</span>
<ul class="list">
<li class="title">
<span>Name</span>
<span>Class</span>
<span>BorrowBook</span>
<span>BorrowDate</span>
<span>Action</span>
</li>
</ul>

<ul class="list" id="record">
<li>
<span>name</span>
<span>class</span>
<span>bookname</span>
<span>borrowdate</span>
<span>
<input type="button" data-id={{id}} value="Delete">
<input type="button" data-id={{id}} value="Edit">
<span>
</li>
</ul>

<input type="button" value="Pre">
<input type="hidden" id="pagenumber" value="1">
<input type="button" value="Next">
</fieldset>

<script type="text/html" id="template">
{{#borrowlist}}
<li>
<span>{{name}}</span>
<span>{{class}}</span>
<span>{{bookname}}</span>
<span>{{borrowdate}}</span>
<span>
<input type="button" data-id={{id}} value="Delete">
<input type="button" data-id={{id}} value="Edit">
<span>
</li>
{/borrowlist}}
</script>

</body>
</html>