<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#classForm img{
		width:100%;
	}
	#classForm li{
		float:left;
	}
	#classForm{
		overflow: auto;
	}
	.classList1{
		width:350px;
		height:250px;
		margin:9px;
	}
</style>
<body>
	<%@ include file="../inc/top.jspf"%>
	<%@ include file="../inc/top2.jspf"%>
	<div class="container" id="classForm">
	신규순
	<ul>
		<li class="classList1"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</li>
		<li class="classList1"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</li>
		<li class="classList1"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</li>
		<li class="classList1"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</li>
		<li class="classList1"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</li>
		<li class="classList1"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</li>	
		<li class="classList1"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</li>
		<li class="classList1"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</li>
		<li class="classList1"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</li>
	</ul>
	<br/>
	<span id="classPageBtn">이전/1/2/3/4/5다음</span>
	</div>
	<%@ include file="../inc/bottom.jspf"%>
</body>
</html>