<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#classSlide{
		width:50%;
		height:400px;
		margin:0;
		float:left;
		overflow:auto;
	}
	#slideitem{
		width:50%;
		height:400px;
		float:left;
	}
	#slideitemMain img{
		width:100%;
	}
	#slideitemMain{
		margin:50px 0 0 0;
	}
	#slideitem input{
		margin:10px;
		width:175px;
		height:40px;
	}
	.itemListEx{
		margin:70px;
		font-size:1.2em;
	}
	#slideitemEx{
		wdith:100%;
		margin:40px;
	}
	#idbslideitemImg{
		wdith:100%;
	}
	#idbslideitemImg img{
		width:90%;
		margin:0 60px;
	}
	#QNADiv ul,#dbEndDiv ul{
		border:1px solid gray;
		height:200px;
	}
	#QNADiv li,#dbEndDiv li{
		float:left;
		margin:0;
		padding:0;
		width:10%;
		
	}
	#QNADiv li:nth-child(6n+2),#dbEndDiv li:nth-child(6n+2){width:50%;}
	#dbEndDiv{margin:0 0 50px 0;}

</style>
<body>
	<%@ include file="../inc/top.jspf"%>
	<div class="container">
	<div id="slideitemMain">
		<div id="classSlide" class="classSlideDiv" data-ride="carousel" data-interval="4000">
			
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/craftsEx/craftsEx01.PNG"/>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/craftsEx/craftsEx02.jpg"/>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/craftsEx/craftsEx03.jpg"/>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/craftsEx/craftsEx04.jpg"/>
                <div class="carousel-caption">
                </div>
            </div>
		</div>
		</div>
			<div id="slideitem">
				<span class="itemListEx">창작/공예</span><br/>
				<span class="itemListEx">클래스명 곰돌이만들기</span><br/>
				<span class="itemListEx">크리에이터 명	: 홍길동</span><br/>
				<br/>
				<span class="itemListEx">가격	:199999원</span><br/>
				<span class="itemListEx">적립금	:199 원</span><br/>
				<span class="itemListEx"><input type="button" value="장바구니에 담기"/><input type="button" value="구매"/></span>
			</div>
		</div>
		<br/>
		<div id="slideitemEx">
			클래스소개<br/>
			차시	:112차	총 896시간
		</div>
		<div id="idbslideitemImg">
			<img src="img/classimgEx.PNG"/>
		</div>
		<div>
			클래스 질문&댓글
			<div id="QNADiv">
				<ul>
					<li>번호</li>
					<li>제목</li>
					<li>작성자</li>
					<li>작성일</li>
					<li>조회수</li>
					<li>상태</li>
				</ul>		
			</div>
		</div>
		<div>
			클래스 수강평
			<div id="dbEndDiv">
				<ul>
					<li>번호</li>
					<li>제목</li>
					<li>작성자</li>
					<li>작성일</li>
					<li>조회수</li>
					<li>상태</li>
				</ul>		
			</div>
		</div>
	</div>
	<%@ include file="../inc/bottom.jspf"%>
</body>
</html>