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
<h1>
	<a href="/gachi/adminDashboard">어드민</a>
	<a href="/gachi/mypage">마이페이지</a>
</h1>


<P>  테스트테스트테스트 </P>
<div class="container">
<div class="mainClass">
	<ul>
		<li class="lMeun1">인기클래스</li>
		<li class="lMeun2"><a href="/gachi/classPage">more</a></li>
		<li class="listMain"><div class="a"><img src="img/P/음악/Dj.png"/></div></li>
		<li class="listMain"><div class="a"><img src="img/P/요리/포케.jpg"/></div></li>
		<li class="listMain"><div class="a"><img src="img/P/미술/색연필 반려동물 .PNG"/></div></li>
	</ul>
</div>
<div class="mainClass">
	<ul>
		<li class="lMeun1">신규클래스</li>
		<li class="lMeun2"><a href="/gachi/classPage2">more</a></li>
		<li class="listMain"><div class="a"><img src="img/P/미술/건축물.PNG"/></div></li>
		<li class="listMain"><div class="a"><img src="img/P/요리/나베.jpg"/></div></li>
		<li class="listMain"><div class="a"><img src="img/P/공예-창작/알공예.jpg"/></div></li>
	</ul>
</div>
<div class="mainClass">
	<ul>
		<li class="lMeun1">추천클래스</li>
		<li class="lMeun2"><a href="/gachi/classPage3">more</a></li>
		<li class="listMain"><div class="a"><img src="img/P/요리/스페인식문어요리.jpg"/></div></li>
		<li class="listMain"><div class="a"><img src="img/P/미술/손글씨.PNG"/></div></li>
		<li class="listMain"><div class="a"><img src="img/P/공예-창작/민화.jpg"/></div></li>
	</ul>
</div>
</div>


