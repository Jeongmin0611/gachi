<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
/* 클래스 리스트 */
.homeClassListImg {
	width: 100%;
	margin: 10px auto;
	height: 250px;
}

.homeClassListTitle { /*클래스 리스트 제목(인기, 신규, 추천)*/
	font-weight: 600px;
}
.homeClassListTitle+p{
	margin: 0;
}
.homeClassListTitle+p>a { /* more */
	text-decoration: none;
	color: #91b4c8;
	font-weight: 600px;
	font-size: 20px;
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
.col-sm-4 a { /*a태그 설정*/
	text-decoration: none;
	color: black;
}
.fa-heart{ /*하트 색상*/
	color:red;
}
/* 클래스 리스트 끝*/



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
</style>
</head>

<script>
	//이미지 오버 효과
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
	
</script>
<body>
	<div class="container cfont">
		<!-- 인기 -->
		<h3 class="homeClassListTitle">인기 클래스</h3>
		<p style="text-align: right"><a href="/gachi/classList?selectval=Ipopular">more</a></p>
		<div class="row">
			<c:forEach var="list" items="${plist }">
				<div class="col-sm-4">
					<a href="/gachi/classView?code=${list.code }"><img src="img/${list.class_img1 }" class="homeClassListImg"/></a><br/>
						<div class="homeClassListTxt">
							<p><span>${list.category }</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
							<a href="/gachi/classView?code=${list.code }"><span>${list.class_name }</span><br/>
								<span>by &nbsp;</span><span class=""> ${list.nickname }</span><br/>				
								<span style="float: right">가격 &nbsp; ${list.real_price }원</span>
							</a>
						</div>				
				</div>
			</c:forEach>			
		</div>
		
		<!-- 신규 -->
		<h3 class="homeClassListTitle" style="margin-top: 50px;">신규 클래스</h3>
		<p style="text-align: right"><a href="/gachi/classPage">more</a></p>
		<div class="row">
			<c:forEach var="nlist" items="${nlist }">
				<div class="col-sm-4">
					<a href="/gachi/classView?code=${nlist.code }"><img src="img/${nlist.class_img1 }" class="homeClassListImg"/></a><br/>
						<div class="homeClassListTxt">
							<p><span>${nlist.category }</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
							<a href="/gachi/classView?code=${nlist.code }"><span>${nlist.class_name }</span><br/>
								<span>by &nbsp;</span><span class=""> ${nlist.nickname }</span><br/>				
								<span style="float: right">가격 &nbsp; ${nlist.real_price }원</span>
							</a>
						</div>				
				</div>
			</c:forEach>
		</div>
		
		<!-- 추천 -->
		<h3 class="homeClassListTitle" style="margin-top: 50px;">추천 클래스</h3>
		<p style="text-align: right"><a href="/gachi/classPage">more</a></p>
		<div class="row" style="margin-bottom:50px;">
			<div class="col-sm-4">
				<a href="/gachi/classView"><img src="img/cookingEx/cookingEx01.jpg" class="homeClassListImg"/></a><br/>
					<div class="homeClassListTxt">
						<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
						<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
							<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
							<span style="float: right">가격 &nbsp; 15,000원</span>
						</a>
					</div>				
			</div>
			<div class="col-sm-4">
				<a href="/gachi/classView"><img src="img/cookingEx/cookingEx11.jpg" class="homeClassListImg"/></a><br/>
					<div class="homeClassListTxt">
						<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
						<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
							<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
							<span style="float: right">가격 &nbsp; 15,000원</span>
						</a>
					</div>				
			</div>
			<div class="col-sm-4">
				<a href="/gachi/classView"><img src="img/cookingEx/cookingEx12.jpg" class="homeClassListImg"/></a><br/>
					<div class="homeClassListTxt">
						<p><span>공예/창작</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
						<a href="/gachi/classView"><span>카모마일 프랑스 자수</span><br/>
							<span>by &nbsp;</span><span class=""> 홍길동</span><br/>				
							<span style="float: right">가격 &nbsp; 15,000원</span>
						</a>
					</div>				
			</div>
		</div>
	</div>