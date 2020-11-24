<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>


	$(()=>{
		AOS.init();
		console.log("aos init");
		$("#headerDiv").css("display","none");
		AOS.init();
		$('.class-img-list').each(function(){
			$(this).mouseenter(function(){
				$(this).css('z-index','10');
			});
			$(this).mouseleave(function(){
				$(this).css('z-index','2');
			});
		});//each
	});
	
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
a:link, a:visited {
	color: #000;
	text-decoration: none;
}

a:hover {
	text-decoration: none;
	font-weight: bold;
}

#cr_guide_navi {
	height: 50px;
	overflow: auto;
	margin: 0 auto;
}

#cr_guide_navi li {
	float: left;
	width: 33%;
	line-height: 50px;
	text-align: center;
}

#cr_guide_navi button {
	margin: 0 auto;
	width: 50%;
}

#guide_navi_div ul {
	margin: 0 auto;
	width: 50%;
}

.cr_guide {
	margin: 0 auto;
}

.aos-animate-div {
	margin: 0px auto;
	background: #E4E6DA
}

.aos-animate-half {
	float: left;
	width: 40%;
	padding: 10%;
}

.aos-animate-div img {
	width: 70%;
}

.aos-animate-guide {
	width: 70%;
	margin: 0 auto;
}

.aos-animate-guide h3 {
	vertical-align: middle;
	line-height: 50px;
	padding-top: 30px
}

.aos-animate-guide button {
	width: 20%;
	margin: 50px auto;
	margin-bottom: 100px;
}
</style>

<div class="cr_guide text-center ad_font" style="margin-bottom:50px;">

	 	<div id="guide_navi_div"style="margin-top: 100px">
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
		
	<div class="row">
		<div class="col-xs-12 col-md-12" id="row-guide-div">
			<div class="font class-guide-title">
			현재 등록된 클래스 
			</div>
			<ul>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src=/gachi/img/cookingEx/cookingEx03.jpg alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/craftsEx/craftsEx02.jpg" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/craftsEx/craftsEx03.jpg" alt="클래스 이미지">
				</li>			
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/cookingEx/cookingEx04.jpg" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/pictureEx/pictureEx05.PNG" alt="클래스 이미지">
				</li>			
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/cookingEx/cookingEx05.jpg" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/musicEx/musicEx06.PNG" alt="클래스 이미지">
				</li>			
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/pictureEx/pictureEx06.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/musicEx/musicEx04.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/pictureEx/pictureEx01.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/pictureEx/pictureEx02.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/pictureEx/pictureEx03.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/craftsEx/craftsEx04.jpg" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/musicEx/musicEx05.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/craftsEx/craftsEx05.jpg" alt="클래스 이미지">
				</li>			
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/musicEx/musicEx18.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/exerciseEx/exerciseEx04.jpg" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/musicEx/musicEx10.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/exerciseEx/exerciseEx03.jpg" alt="클래스 이미지">
				</li>			
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/musicEx/musicEx19.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/exerciseEx/exerciseEx07.jpg" alt="클래스 이미지">
				</li>			
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/musicEx/musicEx07.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/exerciseEx/exerciseEx01.jpg" alt="클래스 이미지">
				</li>			
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/exerciseEx/exerciseEx02.jpg" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/pictureEx/pictureEx21.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/pictureEx/pictureEx07.PNG" alt="클래스 이미지">
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/exerciseEx/exerciseEx13.jpg" alt="클래스 이미지">					
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/exerciseEx/exerciseEx14.jpg" alt="클래스 이미지">					
				</li>				
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/cookingEx/cookingEx02.jpg" alt="클래스 이미지">				
				</li>
				<li class="class-img-list" data-aos="fade-up" data-aos-duration="2000">
						<img class="class-guide-image" src="/gachi/img/cookingEx/cookingEx01.jpg" alt="클래스 이미지">			
				</li>
			
			</ul>
		</div>
	</div>
	<div class="row end text-center">
		<div class="col-xs-12 col-md-2"></div>
		<div class="col-xs-12 col-md-8" data-aos="zoom-out" style="margin-top:100px" >
			<div id="guide-font-sub ">
				크리에이터 관리기능을 알아보았습니다.
			</div><!-- font-sub -->
			<div id="guide-font">
				크리에이터 메인페이지로 돌아가볼까요 ?
			</div><!-- font -->
			<div id="guide-btn">
				<button type="button" class="btn btn-outline-primary btn-block" onclick="location.href='/gachi/creatorDashboard'">크리에이터관리 둘러보기</button>
			</div><!-- news-btn -->
		</div>
		<div class="col-xs-12 col-md-2"></div>
</div><!-- row -->











