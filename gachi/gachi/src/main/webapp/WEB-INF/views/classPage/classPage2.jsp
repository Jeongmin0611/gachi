<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#classForm img{
		width:350px;
		height:250px;
	}
	#classForm li{
		float:left;
	}
	#classForm{
		overflow: auto;
		margin:50px auto;
	}
	.classList1{
		width:30%;
		margin: auto 15px;
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
	</div>
	<!-- paging -->
		<hr/>
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">Prev</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	<%@ include file="../inc/bottom.jspf"%>
</body>
</html>