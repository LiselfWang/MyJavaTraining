<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/mustache.js/2.3.0/mustache.js"></script>
<style>
#title {
width:1400px;
height:50px;
border-bottom: solid 2px black;
padding: 0,50px,0,50px;
}

#querykeywords,
#query,
#add{
position:relative;
left:430px;
}

#query,
#add{
width:80px;
margin:10px;
}


#newsList{
font-size:0px;
padding:10px;
}

.title,
.date,
.addbtn,
.delbtn{
font-size:15px;
margin:10px;
display:inline-block;
}

.title{
width:600px;
}

.date{
width:200px;
}

.addbtn{
width:75px;
}

.delbtn{
width:75px;
}

#prePage,
#nextPage{
width:80px;
marigin:100px;
}

#prePage{
position:relative;
left:250px;
padding:5px;
}
#nextPage{
position:relative;
left:815px;
padding:5px;
}
</style>
<script>
$(function(){
	getNewsitems();
	function getNewsitems(){
		$.getJSON(
				"/manage/getNewsItems",
				{"pageIndex":$("#pageIndex").val(),
			     "keywords":$("#hiddenkeywords").val()},
				function(data){
					for(var i=0;i<data.result.length;i++){
						var current = data.result[i];
						var date = new Date(current.createDate);
						current.standarddate = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();	
						}
				    var tmp = $("#template").html();
					var realdata = Mustache.render(tmp,{"newsList":data.result});
					$("#newsList").html(realdata);	
					$("#prePage").attr("disabled",data.pagenumber<=1);
					$("#nextPage").attr("disabled",data.pagenumber>=data.totalpage);
					})
					}
	$("#query").click(function(){
		$("#pageIndex").val(1);
		$("#hiddenkeywords").val($("#querykeywords").val());
		getNewsitems();
	})
	
	$("#prePage").click(function(){
		var page = $("#pageIndex");
		var index = parseInt(page.val());
		page.val(index-1);
		getNewsitems();
	})
	
		$("#nextPage").click(function(){
		var page = $("#pageIndex");
		var index = parseInt(page.val());
		page.val(index+1);
		getNewsitems();
	})
	
	$("#add").click(function(){
		window.location = "/manage/getAddPage";
	})
	
	$("#newsList").on("click",".delbtn",function(){
		var currentid = $(this).data("key");
		$.post("/manage/deleteItems",
				{"id":currentid},
				function(result){
					if(result){
						getNewsitems();
					}else{
						alert("failed");
					}
				})
	   })
	   
	   
	
	});
</script>
</head>
<body>
<div id="title">
<input type="text" id="querykeywords" placeholder="Please inpur keywords"></input>
<input type="hidden" id="hiddenkeywords" name="title" value=""></input>
<input type="button" id="query" value="查询"></input>
<input type="button" id="add" value="新增"></input>
</div>
<fieldset>
<legend><b>新闻列表</b></legend>
<ul id="newsList">

</ul>
</fieldset>
<br>
<input type="hidden" id="pageIndex" value="1"></input>
<input type="button" id="prePage" value="上一页"></input>
<input type="button" id="nextPage" value="下一页"></input>

<script type="text/html" id="template">
{{#newsList}}
<li>
<span class="title">{{title}}</span>
<span class="date">{{standarddate}}</span>
<span>
<input type="button" class="editbtn" data-key="{{id}}" value="编辑"></input>
<input type="button" class="delbtn" data-key="{{id}}" value="删除"></input>
</span>
</li>
{{/newsList}}
</script>

</body>
</html>