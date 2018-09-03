<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.items,
.title{
font-size:0;
}

.items .cell,
.title .cell{
display:inline-block;
margin:5px;
width:200px;
font-size:13px;
}


.title .cell{
font-size:20px;
font-weight:bolder;
border-bottom: solid 1px #ccc;
}
</style>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){

	$(".delbutton").click(function(){
		return (confirm("sure?"));
	})
	
	$("[name='prepage']").click(function(){
		gotopage(-1);
	});
	
	$("[name='nextpage']").click(function(){
		gotopage(1);
	});

	function gotopage(number){
		var $pn = $("#pagenumber");
		$pn.val(parseInt($pn.val()) + number);
		$("#queryform").submit();
	}

    $(".Addbutton").click(function(){
    	window.location = '/buytickets/addPage';		
    })
})

</script>
</head>
<body>
<fieldset>
<legend><b>购票查询系统</b></legend>
<form id="queryform" action="/buytickets" method="get">
<input type="text" name="id" value="${queryid}" placeholder="please input your ID">
<input type="hidden" id="pagenumber" name="pagenumber" value="${pagenumber}">
<input type="button" name="prepage" value="pre" <c:if test="${pagenumber<=1}">disabled</c:if>>
<input type="button" name="nextpage" value="next" <c:if test="${pagenumber>=totalpage}">disabled</c:if>>
<input type="button" class="Addbutton" name="addinfo" value="添加个人信息" >
<input type="submit" value="查询">
</form>

<ul>
	<li class="title">
		<span class="cell"><b>Name</b></span>
		<span class="cell"><b>Age</b></span>
		<span class="cell"><b>Id</b></span>
		<span class="cell"><b>Destination</b></span>
		<span class="cell"><b>Action</b></span>
	</li>

	<c:forEach 
	    items="${webshowlist}"
	    begin="0"
	    end="${webshowlist.size()}"
	    step="1"
	    var="current"
	    varStatus="userStatus">
	<li class="items">
		<form action="/buytickets/delete" method="post">
		<span class="cell">${current.getName()}</span>
		<span class="cell">${current.getAge()}</span>
		<span class="cell">${current.getId()}</span>
		<span class="cell">${current.getDestination()}</span>
		<span class="cell">
			<input type="hidden" name="id" value="${current.getId()}">
			<input type="submit" class="delbutton" value="delete">
		</span>

		</form>
	</li>
	</c:forEach>
</ul>
</fieldset>
</body>
</html>