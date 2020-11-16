<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<style>
	h1{font-family:'OSeongandHanEum';}
	.a{
		margin:auto;
		width:100%;
	}
	.listMain{
		float:left;
	}
	.mainClass ul{
		overflow: auto;
	}
	.mainClass a{
		width:4%;
		
	}
	.lMeun1{
		width:100%;
		font-size:1.3em;
		
	}
	.lMeun2{
		float:right;
		width:100%;
	}
	.lMeun2 a{
		float:right;
	}
	.mainClass img{
		width:350px;
		margin:auto 10px;
		height:250px;
	}
	.mainClass li{
		margin-bottom:10px;
	}
	
	</style>
</head>
<body>
<%@ include file="../inc/top.jspf"%>
<%@ include file="../inc/top2.jspf"%>
<div class="container">
<div class="mainClass">
	<ul>
		<li class="lMeun1">인기상품</li>
		<li class="lMeun2"><a href="#">more</a></li>
		<li class="listMain"><div class="a"><img src="img/P/음악/Dj.png"/></div>음악	작성자<br/>제목</li>
		<li class="listMain"><div class="a"><img src="img/P/요리/포케.jpg"/></div>요리	작성자<br/>제목</li>
		<li class="listMain"><div class="a"><img src="img/P/미술/색연필 반려동물 .PNG"/></div>미술	작성자<br/>제목</li>
	</ul>
</div>
<div class="mainClass">
	<ul>
		<li class="lMeun1">신규상품</li>
		<li class="lMeun2"><a href="#">more</a></li>
		<li class="listMain"><div class="a"><img src="img/P/미술/건축물.PNG"/></div>미술	작성자<br/>제목</li>
		<li class="listMain"><div class="a"><img src="img/P/요리/나베.jpg"/></div>요리	작성자<br/>제목</li>
		<li class="listMain"><div class="a"><img src="img/P/공예-창작/알공예.jpg"/></div>공예-창작	작성자<br/>제목</li>
	</ul>
</div>
<div class="mainClass">
	<ul>
		<li class="lMeun1">추천상품</li>
		<li class="lMeun2"><a href="#">more</a></li>
		<li class="listMain"><div class="a"><img src="img/P/요리/스페인식문어요리.jpg"/></div>요리	작성자<br/>제목</li>
		<li class="listMain"><div class="a"><img src="img/P/미술/손글씨.PNG"/></div>미술	작성자<br/>제목</li>
		<li class="listMain"><div class="a"><img src="img/P/공예-창작/민화.jpg"/></div>공예-창작	작성자<br/>제목</li>
	</ul>
</div>
</div>
<%@ include file="../inc/bottom.jspf"%>

