<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.ClassListTitle { /*클래스 리스트 제목(인기, 신규, 추천)*/
	font-weight: 600px;
}
/*======= 크리에이터 리스트 ==========*/
.homeClassListImg {/*이미지 사이즈 조절*/
	width: 100%;
	margin: 10px auto;
	height: 250px;
}

.homeClassListTxt {
	overflow: auto;
	margin-bottom: 10px;
	padding: 0;
}

.homeClassListTxt p {
	margin: 0;
}

.homeClassListTxt p>span { /* 클래스 리스트 카테고리 */
	width: 100%;
	background-color: lightblue;
	color: white;
}

/*a태그 설정*/
.col-sm-4 a {
	text-decoration: none;
	color: black;
}
.fa-heart{ /*하트 색상*/
	color:red;
}
/*======= 크리에이터 리스트 ==========*/
/* 이미지 오버 효과 */
.row img {
	max-width: 100%;
	position: relative;
	opacity: 1;
}

.row img:hover {
	-webkit-transform: scale(1.05);
	transform: scale(1.05);
}

.row * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.45s ease-in-out;
	transition: all 0.45s ease-in-out;
}

/* 이미지 오버 효과 끝 */
.pagination{
	margin:50px 0;
}


</style>
<script>
$(".hover").mouseleave(
	function () {
		$(this).removeClass("hover");
	}
);
</script>
	<%@ include file="../inc/top.jspf"%>
	<%@ include file="../inc/top2.jspf"%>
	<div class="container">
	<h3 class="ClassListTitle">인기 클래스</h3>
	<div class="row">
		<div class="col-sm-4">
			<a href="/gachi/classMain"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classMain"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classMain"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classMain"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classMain"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classMain"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classMain"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg pt-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classMain"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classMain"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classMain"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classMain"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classMain"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classMain"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classMain"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classMain"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classMain"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classMain"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classMain"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
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
	</div>
	<%@ include file="../inc/bottom.jspf"%>