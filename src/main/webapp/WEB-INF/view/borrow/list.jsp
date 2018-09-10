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
margin:10px;
display:inline-block;
width:200px;
}

.list .item{
display:inline-block;
width:200px;
font-size:13px;
margin:10px;
}

.button{
margin:5px;
}
</style>

<script>

$(function(){
	getborrowlist();
	function getborrowlist(){
		$.getJSON("/borrow/getborrowlist",{"pagenumber":$("#pagenumber").val(),"name":$("#hiddenname").val()},
			function(data){
			for (var i = 0; i < data.result.length; i++) {
				var current = data.result[i];
				var currentdate = new Date(current.borrowdate);
				current.standarddate = currentdate.getFullYear()+"/"+(currentdate.getMonth()+1)+"/"+currentdate.getDate();	
			}
		
			var tmp = $("#template").html();
			var realdata = Mustache.render(tmp,{"borrowlist": data.result});
			$("#record").html(realdata);
			$("#currentPage").html(data.pagenumber+"/"+data.totalpage);
			$("#prepage").attr("disabled",data.pagenumber<=1);
			$("#nextpage").attr("disabled",data.pagenumber>=data.totalpage);
		})
	}
		
	$("#query").click(function(){
		$("#pagenumber").val(1);
		$("#hiddenname").val($("#queryname").val());
		getborrowlist();
	})
	

    $("#prepage").click(function(){
    	var page = $("#pagenumber");
    	var index = parseInt(page.val());
    	page.val(index-1);
    	getborrowlist();
    })

   $("#nextpage").click(function(){
		var page = $("#pagenumber");
    	var index = parseInt(page.val());
    	page.val(index+1);
    	getborrowlist();
    })
	
	$("#addbut").click(function(){
		window.location = "/borrow/addpage";
	})
	
	$("#record").on("click", "#editbut", function(){
		var currentid = $(this).data("id");
		window.location = "/borrow/editpage?id="+currentid;
	})
	
	$("#record").on("click", "#delbut", function(){
		var currentid = $(this).data("id");
		$.post("/borrow/delete",{"id":currentid}, function(result){
			if(result){
				getborrowlist();
			}else{
				alert("failed");
			}
		})
	})
	
})
</script>
</head>
<body>
<fieldset>
<legend><b>Borrow Book Record</b></legend>
<input type="text" id="queryname" placeholder="please input your name">
<input type="hidden" id="hiddenname" name="name" value="">
<input type="button" id="query" value="Query">
<input type="button" id="addbut" value="Add Record"><br>
<br>
当前的页码:<span id="currentPage"></span>
<ul class="list">
<li class="title">
<span>Name</span>
<span>Classes</span>
<span>BorrowBook</span>
<span>BorrowDate</span>
<span>Action</span>
</li>
</ul>

<ul class="list" id="record">

</ul>

<input type="button" id="prepage"value="Pre">
<input type="hidden" id="pagenumber" value="1">
<input type="button" id="nextpage" value="Next">
</fieldset>

<script type="text/html" id="template">
{{#borrowlist}}
<li>
<span class="item">{{name}}</span>
<span class="item">{{classes}}</span>
<span class="item">{{bookname}}</span>
<span class="item">{{standarddate}}</span>
<span class="item">
<input type="button" id="delbut" class="button" data-id="{{id}}" value="Delete">
<input type="button" id="editbut" class="button" data-id="{{id}}" value="Edit">
<span>
</li>
{{/borrowlist}}
</script>

</body>
</html>