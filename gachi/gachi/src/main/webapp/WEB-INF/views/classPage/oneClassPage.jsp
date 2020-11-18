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
	/* 이미지 오버 효과 */
.classList1 img{
max-width: 100%;
  position: relative;
  opacity: 1;
}
	
.classList1:hover img, .classList1.hover img{
  -webkit-transform: scale(1.05);
  transform: scale(1.05);
}
.classList1 *{
 -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.45s ease-in-out;
  transition: all 0.45s ease-in-out;

}
	/* 이미지 오버 효과 끝*/
</style>

<body>
	<%@ include file="../inc/top.jspf"%>
	<%@ include file="../inc/top2.jspf"%>
	<div class="container" id="classForm">
	<ul>
		<li class="classList1"><a href="#" style="text-decoration:none"><img src="/gachi/img/artEx/artEx20.PNG"><br/>인물실사화<br/>모죠</a></li>
		<li class="classList1"><a href="#" style="text-decoration:none"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</a></li>
		<li class="classList1"><a href="#" style="text-decoration:none"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</a></li>
		<li class="classList1"><a href="#" style="text-decoration:none"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</a></li>
		<li class="classList1"><a href="#" style="text-decoration:none"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</a></li>
		<li class="classList1"><a href="#" style="text-decoration:none"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</a></li>	
		<li class="classList1"><a href="#" style="text-decoration:none"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</a></li>
		<li class="classList1"><a href="#" style="text-decoration:none"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</a></li>
		<li class="classList1"><a href="#" style="text-decoration:none"><img src="/gachi/img/classtest.PNG"><br/>제목<br/>작성자</a></li>
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