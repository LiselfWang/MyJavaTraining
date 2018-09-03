<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${Animal}
<form action="/import" method="post">

多重：<input type="text" name="weight">
多高：<input type="text" name="height">
颜色：<input type="text" name="color">
<select>
<option value="长毛象">长毛象</option>
<option value="猛犸象">猛犸象</option>
<option value="大象">大象</option>
</select>
<input type="submit">
</form>
</body>
</html>