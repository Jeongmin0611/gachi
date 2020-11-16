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

</style>
<body>
	<%@ include file="../inc/top.jspf"%>
	<div class="container">
	<div id="slideitemMain">
		<div id="classSlide" class="classSlideDiv" data-ride="carousel" data-interval="4000">
			<ul class="carousel-indicators">
            <li data-target="#slideimage" data-slide-to="0" class="active"></li>
            <li data-target="#slideimage" data-slide-to="1"></li>
            <li data-target="#slideimage" data-slide-to="2"></li>
            <li data-target="#slideimage" data-slide-to="3"></li>
        </ul>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/P/공예-창작/니트양말.PNG"/>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/P/공예-창작/레진공예.PNG"/>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/P/공예-창작/비즈.jpg"/>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/P/공예-창작/철사.jpg"/>
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
				<span class="itemListEx">적립금	:2원</span><br/>
				<span class="itemListEx"><input type="button" value="장바구니에 담기"/><input type="button" value="구매"/></span>
			</div>
		</div>
		<br/>
		<div id="slideitemEx">
			클래스소개<br/>
			차시	:112차	총 896시간
		</div>
		<div id="idbslideitemImg">
			<img src="img/클래스img.PNG"/>
		</div>
		<div>
			클래스 질문&댓글
			<div></div>
		</div>
		<div>
			클래스 수강평
			<div>보고 만들기</div>
		</div>
	</div>
	<%@ include file="../inc/bottom.jspf"%>
</body>
</html>