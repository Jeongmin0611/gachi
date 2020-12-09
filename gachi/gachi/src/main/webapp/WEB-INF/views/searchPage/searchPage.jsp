<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jspf" %>
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
		<!-- 검색에대한 클래스 -->
		<h3 class="homeClassListTitle">클래스</h3>
		<div class="row">
		<c:forEach var="result" items="${result }">
		<p style="text-align: right"><a href="/gachi/classList?selectval=Ipopular">more</a></p>
				<div class="col-sm-4">
					<a href="/gachi/classView?code=${result.code }"><img src="img/${result.class_img }" class="homeClassListImg"/></a><br/>
						<div class="homeClassListTxt">
							<p><span class="badge badge-info" style="font-size:0.9em">${result.category }</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
							<a href="/gachi/classView?code=${result.code }"><span>${result.class_name }</span><br/>
								<span>by &nbsp;</span><span class=""> ${result.nickname }</span><br/>				
								<span style="float: right">가격 &nbsp; ${result.real_price }원</span>
							</a>
						</div>				
				</div>	
				</c:forEach>		
		</div>
		
		<!-- 검색에대한 스토어 -->
		<h3 class="homeClassListTitle" style="margin-top: 50px;">스토어</h3>
		<div class="row">
		<c:forEach var="result2" items="${result2 }">
		<p style="text-align: right"><a href="/gachi/classPage">more</a></p>
				<div class="col-sm-4">
					<a href="/gachi/classView?code=${result2.code }"><img src="img/${result2.goods_img1 }" class="homeClassListImg"/></a><br/>
						<div class="homeClassListTxt">
							<p><span class="badge badge-info" style="font-size:0.9em">${result2.category }</span><i class="far fa-heart fa-lg p-2" style="float:right; height: 15px;"></i></p>
							<a href="/gachi/classView?code=${result2.code }"><span>${result2.goods_name }</span><br/>			
								<span style="float: right">가격 &nbsp; ${result2.real_price}원</span>
							</a>
						</div>				
				</div>
				</c:forEach>
		</div>
		
		<!-- 검색에대한 크리에이터 -->
		<h3 class="homeClassListTitle" style="margin-top: 50px;">크리에이터</h3>
		<p style="text-align: right"><a href="/gachi/classPage">more</a></p>
		<div class="row" style="margin-bottom:50px;">

		</div>
	</div>