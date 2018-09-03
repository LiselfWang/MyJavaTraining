<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach
    items="${registerlist}"
    begin="0"
    end="${registerlist.size()}"
    step="1"
    var="current"
    varStatus="userStatus">
<li class='item'>
	<span class = 'name'>${current.getName()}</span>
	<span class = 'age'>${current.getAge()}</span>
	<span class = 'hobby'>${current.getHobby()}</span>
</li>
${userStatus.index} 此项的索引，从0开始  <br>
${userStatus.count} 此项的计数序号，从1开始  <br>
${userStatus.first} 此项是否是第一项，布尔值  <br>
${userStatus.last} 此项是否是最后一项，布尔值  <br>
${userStatus.begin} 此次迭代的起始索引，对应&lt;c:foreach&gt;中begin属性值  <br>
${userStatus.end} 此次迭代的终止索引，对应&lt;c:foreach&gt;中end属性值  <br>
${userStatus.step} 此次迭代的跳跃步伐，对应&lt;c:foreach&gt;中step属性值   <br>

</c:forEach>
</body>
</html>