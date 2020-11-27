<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../inc/top.jspf"%>
<%@ include file="../inc/top2.jspf"%>
<style>


/*======= 검색 ==========*/
#CintroCreateSearch {
	margin: 50px auto;
	text-align: right;
	width: 100%;
}
#CintroCreateSearch span{
	float: left;
}
#CintroCreateSearch span a{
	text-decoration: none;
	color:black;
}


/*======= 검색 ==========*/
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

<div class="container cfont">
	
	
	<!-- 검색 -->
	<div id="CintroCreateSearch">
	<span>
		<a href="#"  style="font-weight: bold;">전체</a> &nbsp; <a href="#">공예/창작</a> &nbsp; 
		<a href="#">요리</a> &nbsp; <a href="#">미술</a> &nbsp; 
		<a href="#">음악</a> &nbsp; <a href="#">라이프스타일</a> &nbsp; 
		<a href="#">운동</a> &nbsp; <a href="#">사진/영상</a> &nbsp; 
	</span>
	<select name="introCreateSelect1">
		<option value="Iall">전체</option>
		<option value="Inew">최신순</option>
		<option value="Ipopular">인기순</option>
	</select>
	</div>

	<!-- 리스트 -->
	<div class="row">
		<div class="col-sm-4">
			<a href="/gachi/classView"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classView"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classView"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classView"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classView"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classView"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classView"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classView"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
		<div class="col-sm-4">
			<a href="/gachi/classView"><img src="/gachi/img/artEx/artEx01.PNG" class="homeClassListImg"/></a><br/>
			<div class="homeClassListTxt">
				<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
				<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
					<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
					<span style="float: right">가격 &nbsp; 15,000원</span>
				</a>
			</div>				
		</div>
	</div>
	
	<!-- 페이징 -->
	<ul class="pagination justify-content-center" id="mypageMainPage">
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