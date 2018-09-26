<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.InfoList{
width:700px;
}

.InfoList #title,
#newsTitle{
display:inline-block;
width:200px;
}

.InfoList #title{
width:100px;
}

#newsTitle,
#newsContent,
#newsPublish{
width:500px;
margin:5px;
}

#newsPublish{
width:200px;
}

#Save,
#Cancel{
width:80px;
margin:20px;
}

#Save{
position:relative;
left:85px;
}
#Cancel{
position:relative;
left:100px;
}

</style>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/mustache.js/2.3.0/mustache.js"></script>
</head>
<body>
<form action="/manage/getAddInfo" method="post">
<div class="InfoList">
<b id="title">Title:</b><input type="text" name="title" id="newsTitle" placeholder="Input news title"></input><br>
</div>
<div class="InfoList">
<b id="title">Content:</b><textarea rows="10" cols="50" name="content" id="newsContent" placeholder="Input news content"></textarea><br>
</div>
<div class="InfoList">
<b id="title">PublishDate:</b><input type="text" name="publishDate" id="newsPublish" placeholder="News published date"></input><br>
</div>
<b id="title">Is Show:</b><input type="checkbox" name="status" value="Y"><br>
<input type="submit" value="Save" id="Save">
<input type="button" value="Cancel" id="Cancel">
<script>
	$("#Cancel").click(function(){
		window.location = "/manage";
	})
</script>
</form>
</body>
</html>