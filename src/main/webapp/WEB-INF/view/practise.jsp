<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
function load(){
	window.confirm("代码已经加载完成")
}

</script>

</head>
<body onload = "load()">







<ul class="list-group" id="listSection">

</ul>

<script>
function person(age,sex,education,lastName){
	this.age = age;
	this.sex = sex;
	this.education = education;
	this.lastName = lastName;
	this.changeName = function(_name){
		this.lastName = "林"+_name;
	}
	
	this.changeName(lastName);

} 

function marriage(someone){
	if(someone.age<18){
		console.log("非合法结婚年龄");
	}else if(someone.education.indexOf("本科")==-1){
		console.log("配不上我们家儿子");
	}else{
		console.log(someone.lastName + "结婚了");
	}
}

marriage(new person(18,"女","大学本科","俐力"));

$(function(){
	getPlayList();
	function getPlayList(){
		$.getJSON(
			"/practise/getPlayList",
			function(data){
				var templateData = $("#template").html();
				var realList = Mustache.render(templateData,{"listContent":data})
				$("#listSection").html(realList);
			}
		)
	}
})

</script>

<script type="text/html" id="template">
{{#listContent}}
  <li class="list-group-item active">明星大侦探登记表</li>
  <li class="list-group-item">姓名：{{name}}</li>
  <li class="list-group-item">年龄：{{age}}</li>
  <li class="list-group-item">职业：{{job}}</li>
  <li class="list-group-item">兴趣爱好：{{hobby}}</li>
  <li class="list-group-item">
     个人肖像：<img style="height:200px;" src="{{url}}" id="images"></img>
  </li>
{{/listContent}}
</script>

</body>
</html>