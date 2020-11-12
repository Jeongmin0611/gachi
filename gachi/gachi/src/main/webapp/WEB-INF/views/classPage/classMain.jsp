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
	}
	#slideitem{
		width:50%;
	}
</style>
<body>
	<%@ include file="../inc/top.jspf"%>
	<div class="container">
		<div id="classSlide" class="classSlideDiv" data-ride="carousel" data-interval="4000">
			<ul class="carousel-indicators">
            <li data-target="#slideimage" data-slide-to="0" class="active"></li>
            <li data-target="#slideimage" data-slide-to="1"></li>
            <li data-target="#slideimage" data-slide-to="2"></li>
            <li data-target="#slideimage" data-slide-to="3"></li>
        </ul>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/classmaintest.PNG"/>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/classmaintest.PNG"/>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/classmaintest.PNG"/>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/classmaintest.PNG"/>
                <div class="carousel-caption">
                </div>
            </div>
		</div>
			<div id="slideitem">
				(카테고리)<br/>
				(클래스명)<br/>
				(크리에이터 명)<br/>
			</div>
		</div>
	</div>	
	<%@ include file="../inc/bottom.jspf"%>
</body>
</html>