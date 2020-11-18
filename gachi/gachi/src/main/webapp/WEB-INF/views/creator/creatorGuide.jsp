<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    
<script>
	// AOS
	var myAOS = function() {
		AOS.init({
			easing : 'ease-out-back',
			duration : 1500
		});
	}
	myAOS();
	//스크롤이동
	function moveToReview() {
		var loca1 = document.querySelector("#").offsetTop;
		window.scrollTo({
			top : locaR,
			behavior : 'smooth'
		});
	}
	function moveToQna() {
		var loca2 = document.querySelector("#").offsetTop;
		window.scrollTo({
			top : locaQ,
			behavior : 'smooth'
		});
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
	.cr_guide {margin : 0 auto;}
	.aos-animate-div {margin:0 auto ; background:#E4E6DA }
	.aos-animate-half {float:left; width:50%; padding:10%;}
	.aos-animate-half img{width: 100%}
	.aos-animate-div img {width:70%;}
	.aos-animate-guide {width:70%;}
	.aos-animate-guide h3 {vertical-align:middle; line-height:50px; padding-top :30px}
	.aos-animate-guide button {width:20%; margin:50px auto;}
	
</style>

<div class="cr_guide text-center " style="margin-bottom:50px;">
<!--   
	 	<div>
			<ul id="cr_guide_navi">
				<li><a href="#">클래스관리</a></li>
				<li><a href="#">개인정보수정</a></li>
				<li><a href="#">정산관리</a></li>
				<li><a href="#">공지/문의하기</a></li>
			</ul>
		</div> -->
		<div class="aos-animate-half" style="margin-bottom:200px;"data-aos="fade-down" data-aos-duration="10000">
				<img src ="/gachi/img/guideTitle.PNG"/>
		</div>
		<div class="aos-animate-half" data-aos="fade-down-left" style="margin-top:10%;">
				<img src ="/gachi/img/logo.png"/>
		</div>	
		
		<div class="aos-animate-div ">	
			<div class="aos-animate-guide" style="margin-bottom:100px;"data-aos="flip-left"data-aos-easing="ease-out-cubic" data-aos-duration="3000">
				<img src ="/gachi/img/guide1.png"/>
			</div>
			<div class="aos-animate-guide" data-aos="zoom-in" data-aos-duration="3000">
				<h3><b> 클래스관리 <br/>클래스 관리를 통하여 <br/>나만의 클래스를 쉽게 관리 할수있습니다.</b></h3>
				<button type="button" class="btn btn-outline-primary btn-block" onclick="location.href='/gachi/creatorMyClass'">신청하러가기</button>	
			</div>
			
			<div class="aos-animate-guide" style="width:50%"data-aos="flip-left"data-aos-easing="ease-out-cubic" data-aos-duration="3000">
				<img src ="/gachi/img/guide2.PNG"/>
			</div>
			<div class="aos-animate-guide" data-aos="flip-right" data-aos-duration="3000">
				<h3><b>  클래스통계 <br/>나의 통계를 한눈에!</b></h3>
				<button type="button" class="btn btn-outline-info btn-block" onclick="location.href='/gachi/creatorMyClass'">통계 확인하기</button>	
			</div>

		</div>		
	</div>











