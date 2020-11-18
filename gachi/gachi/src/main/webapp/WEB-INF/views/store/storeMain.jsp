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
	.mainClass{
		margin:50px auto;
	}
	/*이미지 오버효과*/
	.listMain img{
max-width: 100%;
  position: relative;
  opacity: 1;	
	}
	.listMain:hover img{
  -webkit-transform: scale(1.05);
  transform: scale(1.05);
	
	}
	.listMain *{
 -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.45s ease-in-out;
  transition: all 0.45s ease-in-out;
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
		<li class="lMeun2"><a href="/gachi/storePage1">more</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/musicEx/musicEx01.png"/></div>음악	작성자<br/>제목</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/cookingEx/cookingEx01.jpg"/></div>요리	작성자<br/>제목</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/artEx/artEx01.PNG"/></div>미술	작성자<br/>제목</a></li>
	</ul>
</div>
<div class="mainClass">
	<ul>
		<li class="lMeun1">신규상품</li>
		<li class="lMeun2"><a href="/gachi/storePage2">more</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/artEx/artEx02.PNG"/></div>미술	작성자<br/>제목</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/cookingEx/cookingEx02.jpg"/></div>요리	작성자<br/>제목</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/craftsEx/craftsEx05.jpg"/></div>공예-창작	작성자<br/>제목</a></li>
	</ul>
</div>
<div class="mainClass">
	<ul>
		<li class="lMeun1">추천상품</li>
		<li class="lMeun2"><a href="/gachi/storePage3">more</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/cookingEx/cookingEx03.jpg"/></div>요리	작성자<br/>제목</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/artEx/artEx03.PNG"/></div>미술	작성자<br/>제목</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/craftsEx/craftsEx06.PNG"/></div>공예-창작	작성자<br/>제목</a></li>
	</ul>
</div>
</div>
<%@ include file="../inc/bottom.jspf"%>

