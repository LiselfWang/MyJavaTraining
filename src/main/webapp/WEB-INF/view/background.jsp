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
width:180px;
font-size:13px;
}


.title .cell{
font-size:20px;
font-weight:bolder;
border-bottom: solid 1px #ccc;
}

.delbutton,
.editbutton{
margin:10px;
}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
<script>
$(function(){
   getinfolist();
   function getinfolist(){
	   $.getJSON("/buytickets/getinfolist", {
			id: $("#hidId").val(),
			pagenumber: $("#pagenumber").val()
			}, function(data){
				for(var i = 0; i< data.result.length; i++){
					var currentitem = data.result[i];
					var currentDate = new Date(currentitem.date);
					currentitem.date = currentDate.getFullYear() + "/" + (currentDate.getMonth()+1) + "/" + currentDate.getDate();
				}	
				
				var template = $('#infotemplate').html();
	            Mustache.parse(template);   // optional, speeds up future uses
	            var rendered = Mustache.render(template, {
	                "information": data.result
	            });
	            
	            $("#currentPage").html(data.pagenumber + " / " + data.totalpage);
	            $("#info").html(rendered);
	            $("#nextpage").attr("disabled",data.totalpage <= data.pagenumber);
	            $("#prepage").attr("disabled",data.pagenumber <= 1);
	            	
        });
	}
			
	$("#prepage").click(function(){
		var pagenumber = $("#pagenumber");
		var index = parseInt(pagenumber.val());
		if(index>1){
			pagenumber.val(index-1)
			}
		getinfolist();
		});
		
	$("#nextpage").click(function(){debugger;
		var pagenumer =$("#pagenumber");
		var index = parseInt(pagenumer.val());
		pagenumer.val(index+1);
		getinfolist();
		});
		

    $(".Addbutton").click(function(){
    	window.location = '/buytickets/addPage';		
    });
    
    
    $("#info").on("click",".editbutton",function(){
    	var currentid = $(this).data("id")
    	window.location = '/buytickets/editPage?currentid='+currentid;	
    	});
    
    	
    $("#Querybut").click(function(){
    	$("#hidId").val($("#queryid").val());
    	$("pagenumber").val(1);
    	getinfolist();
    	});
    
    	
    $("#info").on("click",".delbutton",function(){
    	var currentid = $(this).data("id")
    	$.post("/buytickets/delete", {
			"id": currentid
		}, function(result){
			if(result){
				getinfolist();
			}else{
				alert("System error!!")
			}
				
	     });
   	});
 
});

</script>
</head>
<body>
<fieldset>
<legend><b>购票查询系统</b></legend>

<input type="text" id="queryid" value="" placeholder="please input your ID">
<input type="hidden" id="hidId" name="id" value="">
<input type="button" class="Addbutton" value="添加个人信息" >
<input type="button" id="Querybut" value="查询">
 <br>
Current Page Number : <span id="currentPage"></span>
  <ul>
	<li class="title">
		<span class="cell"><b>Name</b></span>
		<span class="cell"><b>Age</b></span>
		<span class="cell"><b>Id</b></span>
		<span class="cell"><b>Destination</b></span>
		<span class="cell"><b>Create Date</b></span>
		<span class="cell"><b>Action</b></span>
	</li>
  </ul>
  
  <ul id="info" class="infoList">
	
 </ul>

<input type="hidden" id="pagenumber" value="1">
<input type="button" id="prepage" value="pre">
<input type="button" id="nextpage"value="next">
  
	</fieldset>
	
	<script type="text/html" id="infotemplate">

	{{#information}}
	<li class="items">
		<span class="cell">{{name}}</span>
		<span class="cell">{{age}}</span>
		<span class="cell">{{id}}</span>
		<span class="cell">{{destination}}</span>
        <span class="cell">{{date}}</span>
		<span>
			<input type="button" class="delbutton" data-id={{id}} value="delete">
			<input type="button" class="editbutton" data-id={{id}} value="edit">
		</span>
	</li>
    {{/information}}

   </script>
</body>
</html>