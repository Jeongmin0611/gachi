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
	function moveToCreateClass() {
		var locaR = document.querySelector("#guide_scroll_Classcreate").offsetTop;
		window.scrollTo({
			top : locaR,
			behavior : 'smooth'
		});
	}
	function moveToStatClass() {
		var locaQ = document.querySelector("#guide_scroll_Statclass").offsetTop;
		window.scrollTo({
			top : locaQ,
			behavior : 'smooth'
		});
	}
	function moveToSettleClass() {
		var locaW = document.querySelector("#guide_scroll_SettleClass").offsetTop;
		window.scrollTo({
			top : locaW,
			behavior : 'smooth'
		});
	}
	
</script>	




<style>
	
	a:link, a:visited{color:#000;text-decoration:none;}
	a:hover{text-decoration:none;font-weight:bold;}
	
	#cr_guide_navi{
		height:50px;
		overflow:auto;
		margin:0 auto;
	}
	#cr_guide_navi li{
		float:left;
		width:33%;
		line-height:50px;
		text-align:center;
	}
	#cr_guide_navi button{
		margin:0 auto;
		width:50%;
		}
	#guide_navi_div ul{margin:0 auto; width:50%;}
	
	.cr_guide {margin : 0 auto; }
	.aos-animate-div {margin: 0px auto; background:#E4E6DA }
	.aos-animate-half {float:left; width:40%; padding:10%;}
	.aos-animate-half img {width: 100%; }
	.aos-animate-div img {width:70%;}
	.aos-animate-guide {width:70%; margin:0 auto;}
	.aos-animate-guide h3 {vertical-align:middle; line-height:50px; padding-top :30px}
	.aos-animate-guide button {width:20%; margin:50px auto; margin-bottom:100px;}
	
</style>

<div class="cr_guide text-center " style="margin-bottom:50px;">

	 	<div id="guide_navi_div">
			<ul id="cr_guide_navi">
				<li><button type="button" class="btn btn-outline-primary btn-block" onclick="moveToCreateClass()">클래스관리</button></li>
				<li><button type="button" class="btn btn-outline-primary btn-block" onclick="moveToStatClass()">클래스통계</button></li>
				<li><button type="button" class="btn btn-outline-primary btn-block" onclick="moveToSettleClass()">정산관리</button></li>

			</ul>
		</div> 
		<div class="aos-animate-half" style="margin-bottom:200px;"data-aos="fade-down" data-aos-duration="10000">
				<img src ="/gachi/img/guideTitle.PNG"/>
		</div>
		<div class="aos-animate-half" data-aos="fade-down-left" style="margin-top:10%;">
				<img src ="/gachi/img/logo.png"/>
		</div>	
		
		<div class="aos-animate-div ">	
			<div class="aos-animate-guide" id ="guide_scroll_Classcreate"style="margin-bottom:100px;"data-aos="flip-left"data-aos-easing="ease-out-cubic" data-aos-duration="3000">
				<img src ="/gachi/img/guide01.png"/>
			</div>
			<div class="aos-animate-guide" style="width:50%"data-aos="fade-left" data-aos-easing="ease-out-cubic" data-aos-duration="3000">
				<img src ="/gachi/img/guide03.png"/>
			</div>
			<div class="aos-animate-guide" data-aos="zoom-in" data-aos-duration="3000">
				<h3><b> 클래스관리 <br/>클래스 관리를 통하여 <br/>나만의 클래스를 쉽게 관리 할수있습니다.</b></h3>
				<button type="button" class="btn btn-outline-primary btn-block" onclick="location.href='/gachi/creatorMyClass'">신청하러가기</button>	
			</div>
			
			<div class="aos-animate-guide" id ="guide_scroll_Statclass" style="width:50%"data-aos="flip-left"data-aos-easing="ease-out-cubic" data-aos-duration="3000">
				<img src ="/gachi/img/guide02.png"/>
			</div>
			<div class="aos-animate-guide" data-aos="zoom-in" data-aos-duration="3000">
				<h3><b>  클래스통계 <br/>나의 통계를 한눈에!</b></h3>
				<button type="button" class="btn btn-outline-info btn-block" onclick="location.href='/gachi/creatorStatClass'">통계 확인하기</button>	
			</div>
			
			<div class="aos-animate-guide" id ="guide_scroll_SettleClass" style="width:50%"data-aos="flip-left"data-aos-easing="ease-out-cubic" data-aos-duration="3000">
				<img src ="/gachi/img/guide04.PNG"/>
			</div>
			<div class="aos-animate-guide" data-aos="zoom-in" data-aos-duration="3000">
				<h3><b>  정산관리 <br/> 나의 수익을 정리하여 간편하게 !</b></h3>
				<button type="button" class="btn btn-outline-primary btn-block" onclick="location.href='/gachi/creatorSettle'">정산 확인하기</button>	
			</div>
		</div>		
	</div>











