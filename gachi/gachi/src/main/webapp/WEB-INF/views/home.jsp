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
	/* 이미지 오버 효과 */

.mainClass img{
max-width: 100%;
  position: relative;
  opacity: 1;
}


.mainClass li:hover img, .mainClass li.hover img{
  -webkit-transform: scale(1.05);
  transform: scale(1.05);
}
.mainClass *{
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
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);

</script>
<body>
<div class="container">
<div class="mainClass">
	<ul>
		<li class="lMeun1">인기클래스</li>
		<li class="lMeun2"><a href="/gachi/classPage">more</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/musicEx/musicEx01.png"/></div>음악	DJ Jazzy<br/>디제잉 기초잡기</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/cookingEx/cookingEx01.jpg"/></div>요리	백종원<br/>하와이안 포케 만들기</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/artEx/artEx01.PNG"/></div>미술	모죠<br/>색연필 반려동물 그리기</a></li>
	</ul>
</div>
<div class="mainClass">
	<ul>
		<li class="lMeun1">신규클래스</li>
		<li class="lMeun2"><a href="/gachi/classPage2">more</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/artEx/artEx02.PNG"/></div>미술	제야<br/>건축물 그리기</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/cookingEx/cookingEx02.jpg"/></div>요리	백종원<br/>나베요리 기초특강</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/craftsEx/craftsEx05.jpg"/></div>공예-창작	김창작<br/>곰돌이미니가방</a></li>
	</ul>
</div>
<div class="mainClass">
	<ul>
		<li class="lMeun1">추천클래스</li>
		<li class="lMeun2"><a href="/gachi/classPage3">more</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/cookingEx/cookingEx03.jpg"/></div>요리	백종원<br/>스페인문어요리</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/artEx/artEx03.PNG"/></div>미술	한성원<br/>손글씨</a></li>
		<li class="listMain"><div class="a"><a href="/gachi/classMain" style="text-decoration:none"><img src="img/craftsEx/craftsEx06.PNG"/></div>공예-창작	마형수<br/>악세서리</a></li>
	</ul>
</div>
</div>


