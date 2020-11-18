<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    
<script>
	//스크롤이동
	function moveToReview(){
		var loca1 = document.querySelector("#").offsetTop;
		window.scrollTo({top:locaR, behavior:'smooth'});
	}
	function moveToQna(){
		var loca2 = document.querySelector("#").offsetTop;
		window.scrollTo({top:locaQ, behavior:'smooth'});
	}
</script>	

<style>
	
	a:link, a:visited{color:#000;text-decoration:none;}
	a:hover{text-decoration:none;font-weight:bold;}
	
	#cr_guide_navi{
		height:50px;
		background-color:#ddd;
		overflow:auto;
	}
	#cr_guide_navi li{
		float:left;
		width:25%;
		line-height:50px;
		text-align:center;
	}
	.aos-animate-div {margin: 50px 0 ;}
	.aos-animate-div img {width:100%;}
	.aos-animate-harf {float:left;width:50%;}
	.aos-animate-harf h3 {vertical-align:middle; line-height:50px; padding-top :100px}
	.aos-animate-harf button {width:50%;margin: auto;}
	
</style>

<div class="container cr_guide text-center " style="margin-bottom:50px;">
	<h1> 이용안내 </h1>    
	 	<div>
			<ul id="cr_guide_navi">
				<li><a href="#">클래스관리</a></li>
				<li><a href="#">개인정보수정</a></li>
				<li><a href="#">정산관리</a></li>
				<li><a href="#">공지/문의하기</a></li>
			</ul>
		</div>
		
	<div class="aos-animate-div">	
		<div class="aos-animate-harf">
			<h3>클래스 관리를 통하여 <br/>나만의 클래스를 쉽게 관리 할수있습니다.</h3>
			<button type="button" class="btn btn-outline-primary btn-block" onclick="location.href='/gachi/creatorMyClass'">신청하러가기</button>	
		</div>
		<div class="aos-animate-harf" data-aos="fade-down" data-aos-duration="1000">
			<img src ="/gachi/img/guide1.png"/>
		</div>
	</div>	
		
</div>	