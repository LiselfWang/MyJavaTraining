<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<style>
.table,* {
font-size:14px;
text-align:center;
border-collapse:collapse;
border: 1px solid black;

}

#title{
font-weight:bold;
font-size:20px;
text-align:center;
}

#photo{
width: 100px;
}

#photo #img{
width: 100px;
}

td{
width: 80px;
}

#work-experience {
height: 20px;
}

#skill {
height: 100px;
text-align:left;
vertical-align: top;
}



</style>
</head>
<body>
<table calss="table">
<thead>
<tr>
<th colspan="14" id="title">求职简历</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2">姓名</td>
<td colspan="2"></td>
<td colspan="2">性别</td>
<td colspan="2"></td>
<td colspan="2">出生日期</td>
<td colspan="2"></td>
<td colspan="2" rowspan="5" id="photo"><img id="img" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546358133034&di=d612de8ba65f2830ed02e037d2108c1e&imgtype=0&src=http%3A%2F%2Fwx2.sinaimg.cn%2Flarge%2F683b8743ly1fd0ogav0bgj20qo0y9jve.jpg"></img></td>
</tr>

<tr>
<td colspan="2">民族</td>
<td colspan="2"></td>
<td colspan="2">政治面貌</td>
<td colspan="2"></td>
<td colspan="2">婚姻状况</td>
<td colspan="2"></td>
</tr>

<tr>
<td colspan="2">籍贯</td>
<td colspan="2"></td>
<td colspan="2">现所在地</td>
<td colspan="2"></td>
<td colspan="2">健康状况</td>
<td colspan="2"></td>
</tr>

<tr>
<td colspan="2">学历</td>
<td colspan="2"></td>
<td colspan="2">学位</td>
<td colspan="2"></td>
<td colspan="2">毕业时间</td>
<td colspan="2"></td>
</tr>

<tr>
<td colspan="2" >特长及爱好</td>
<td colspan="10"></td>
</tr>

<tr>
<td colspan="2">毕业学校</td>
<td colspan="6"></td>
<td colspan="2">专业</td>
<td colspan="4"></td>
</tr>

<tr>
<td colspan="2">外语水平</td>
<td colspan="6"></td>
<td colspan="2">计算机水平</td>
<td colspan="4"></td>
</tr>

<tr>
<td colspan="2">手机</td>
<td colspan="6"></td>
<td colspan="2">E-mail</td>
<td colspan="4"></td>
</tr>

<tr>
<td colspan="2">求职意向</td>
<td colspan="12"></td>
</tr>

<tr>
<td rowspan="4" colspan="2" id="work-experience">工作经历</td>
<td colspan="3" id="work-experience">起止年月</td>
<td colspan="3 id="work-experience">工作单位/学校</td>
<td colspan="3" id="work-experience">专业/主要职责</td>
<td colspan="3" id="work-experience">离职原因/毕业时间</td>
</tr>

<tr>
<td colspan="3" id="work-experience"></td>
<td colspan="3" id="work-experience"></td>
<td colspan="3" id="work-experience"></td>
<td colspan="3" id="work-experience"></td>
</tr>

<tr>
<td colspan="3" id="work-experience"></td>
<td colspan="3" id="work-experience"></td>
<td colspan="3" id="work-experience"></td>
<td colspan="3" id="work-experience"></td>
</tr>

<tr>
<td colspan="3" id="work-experience"></td>
<td colspan="3" id="work-experience"></td>
<td colspan="3" id="work-experience"></td>
<td colspan="3" id="work-experience"></td>
</tr>

<tr>
<td id="skill" colspan="14">个人技能</td>
</tr>

<tr>
<td id="skill" colspan="14">自我评价</td>
</tr>

<tr>
<td id="skill" colspan="14"><a href="http://localhost:8080/maomao/myself" target="_blank"/>职业发展设想</td>
</tr>
</tbody>
</table>



</body>
</html>