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


.list .title *{
font-weight:bolder;
font-size:20px;
border-bottom:solid 1px #666;
}

.list .item{
display:inline-block;
width:200px;
font-size:13px;
}


</style>
</head>
<body>
<fieldset>
<legend><b>Borrow Record</b></legend>
<input type="text" id="queryname" placeholder="please input your name">
<input type="hidden" id="hiddenname" name="name" value="">
<input type="button" value="Query">
<input type="button" value="Add Record"><br>
<span id="currentPage">当前的页码：</span>
<ul class="list">
<li class="title">
<span class="item">Name</span>
<span class="item">Classes</span>
<span class="item">BorrowBook</span>
<span class="item">BorrowDate</span>
<span class="item">Action</span>
</li>
</ul>

<ul class="list" id="record">
<li>
<span class="item">name</span>
<span class="item">classes</span>
<span class="item">bookname</span>
<span class="item">borrowdate</span>
<span class="item">
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
<span class="item">{{name}}</span>
<span class="item">{{classes}}</span>
<span class="item">{{bookname}}</span>
<span class="item">{{borrowdate}}</span>
<span class="item">
<input type="button" data-id={{id}} value="Delete">
<input type="button" data-id={{id}} value="Edit">
<span>
</li>
{/borrowlist}}
</script>

</body>
</html>