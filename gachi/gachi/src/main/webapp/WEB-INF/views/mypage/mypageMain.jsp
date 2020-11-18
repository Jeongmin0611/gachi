<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>	
	
	/* 마이페이지(메인) - 컨테이너 */
	#myclassMainContainer{
		overflow-x:hidden; /* 가로 스크롤 숨기기 */
	}
	
	/*******/
	/* 상단 */
	/* 라디오, 버튼(이전달,다음달), 날짜, 조회 */
	#mypageMainTop{
		margin:20px;
		text-align:right;
	}
	#mypageMainTop label{
		margin:5px;
	}
	#mypageMainTopFrm
	#mypageMainTopFrm>button{
		margin:5px;
	}
	
	/*******/	
	/* 내용 */
	#mypageMainContent{
		float:clear;
		margin-bottom:100px;
	}
	/* 날짜 라벨 */
	#mypageMainContent>div>label{ 
		width:100%;
		height:50px;
		line-height:50px;
		text-align:center;
		font-size:1.5em;
		margin:50px 0 30px;
		background-color:#eee;
	}
	/* 주문리스트 */
	.mypageMainLst{
		width:80%;
		float:left;
	}
	.mypageMainLst>li{
		margin:10px 30px;
		line-height:25px;
	}
	.mypageMainLst>li:first-child{
		margin:20px 30px 20px 50px;
		float:left;
	}
	.mypageMainLst>li:nth-child(2){
		margin:0;
	}
	.mypageMainLst>li:nth-child(5){
		margin:0 50px 0 0;
	}
	/*클래스썸네일*/
	.mypageMainLst img{
		width:200px;
		height:150px;
		object-fit:cover;
	}
	/*리스트 버튼*/
	.mypageMainLstBtn{
		height:180px;
		overflow:auto;
		text-align:center;
		padding-top:3%;
	}
	.mypageMainLstBtn>button{
		width:50%;
		float:clear;
		margin:5px;
	}
	.mypageMainLstBtn>button:first-child{
		background-color:#ABCEE3;
	}
	.mypageMainLstBtn>button:last-child{
		background-color:#eee;
		color:#000;
	}
	
	/*******/
	/* 하단 */
	/* 페이징 */
	.mypageMainBtm{margin:100px 0;width:100%;}
	
	/* 모달 */
	#mypageModal{
		display:none;
		position:absolute;
		width:100%;
		height:100%;
		z-index:1;
	}
	.mypageModal_content{
		width:500px;
		height:500px;
		margin:100px auto;
		padding:20px 10px;
		background-color:#fff;
		border:2px solid #eee;
	}
	.mypageModal_content>div:nth-child(3){
		height:100px;
		text-align:center;
		background-color:#eee;
		font-size:1.5em;
		line-height:100px;
	}
	.mypageModal_content>label{
		font-size:1.3em;
	}
	.mypageModal_content ul{
		width:80%;
		margin:0 auto;
		overflow:auto;
		border-top:1px solid gray;
		margin-bottom:50px;
	}
	.mypageModal_content li{
		width:70%;
		float:left;
		border-bottom:1px solid gray;
		text-align:center;
		padding:0 20px;
	}
	.mypageModal_content li:nth-child(2n+1){
		text-align:left;
		background-color:#eee;
		width:30%;
	}
	.mypageModal_layer{
		position:fixed;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background-color:rgba(0,0,0,0.5);
		z-index:-1;
	}
	#mypageModalClose{
		margin:0 auto;
	}
	#mypageModalBtm{
		text-align:center;
	}
	
</style>
<script>
	$(function(){
		//모달창 띄우기
	    $(".mypageDelivery").click(function(){
    		$("#mypageModal").css({
               "top": (($(window).height()-$("#mypageModal").outerHeight())/2+$(window).scrollTop())+"px",
               "left": (($(window).width()-$("#mypageModal").outerWidth())/2+$(window).scrollLeft())+"px"
               //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
            
            });
	        $("#mypageModal").fadeIn();
	    });
	    $("#mypageModalClose, .mypageModal_layer").click(function(){
	       $("#mypageModal").fadeOut();
	    });   
	});

</script>
<div class="container" id="myclassMainContainer">
	<%@ include file="../inc/userProfile.jspf"%>
	<!-- 마이페이지(메인) - 상단 -->
	<div id="mypageMainTop">
		<form id="mypageMainTopFrm">
			<input type="radio" name="option"/><label>전체</label>
			<input type="radio" name="option"/><label>상품</label>
			<input type="radio" name="option"/><label>클래스</label>
			<button type="button" class="btn btn-outline-dark btn-sm">◀</button><!-- 이전달 -->
			<input type="date" id="mypageMainDate1"/>
			-
			<input type="date" id="mypageMainDate2"/>
			<button type="button" class="btn btn-outline-dark btn-sm">▶</button><!-- 다음달 -->
			<button type="button" class="btn btn-primary btn-sm">조회</button>
		</form>
	</div>
	<div id="mypageMainContent">
		<div>
			<label>2020-11-06</label>
			<ul class="mypageMainLst">
				<li><img src="/gachi/img/test_image.jpg"/></li>
				<li>
					<label class="badge badge-info">공예/창작</label>
					<label class="badge badge-light"><a href="#">주문번호 10101010</a></label>
				</li>
				<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
				<li>크리에이터명 <a href="#">홍길동</a></li>
				<li>결제가격 15000원</li>
				<li>결제일시 20.11.06 19:30:34</li>
			</ul>
			<div class="mypageMainLstBtn">
				<button type="button" class="btn btn-outline-light mypageDelivery">배송조회</button>
				<button type="button" class="btn btn-outline-light">결제취소</button>
			</div>
		</div>
		<div>
			<label>2020-11-06</label>
			<ul class="mypageMainLst">
				<li><img src="/gachi/img/test_image.jpg"/></li>
				<li>
					<label class="badge badge-info">공예/창작</label>
					<label class="badge badge-light"><a href="#">주문번호 10101010</a></label>
				</li>
				<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
				<li>크리에이터명 <a href="#">홍길동</a></li>
				<li>결제가격 15000원</li>
				<li>결제일시 20.11.06 19:30:34</li>
			</ul>
			<div class="mypageMainLstBtn">
				<button type="button" class="btn btn-outline-light mypageDelivery">배송조회</button>
				<button type="button" class="btn btn-outline-light">결제취소</button>
			</div>
		</div>
		<div>
			<label>2020-11-06</label>
			<ul class="mypageMainLst">
				<li><img src="/gachi/img/test_image.jpg"/></li>
				<li>
					<label class="badge badge-info">공예/창작</label>
					<label class="badge badge-light"><a href="#">주문번호 10101010</a></label>
				</li>
				<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
				<li>크리에이터명 <a href="#">홍길동</a></li>
				<li>결제가격 15000원</li>
				<li>결제일시 20.11.06 19:30:34</li>
			</ul>
			<div class="mypageMainLstBtn">
				<button type="button" class="btn btn-outline-light mypageDelivery">배송조회</button>
				<button type="button" class="btn btn-outline-light">결제취소</button>
			</div>
		</div>
		<div>
			<label>2020-11-06</label>
			<ul class="mypageMainLst">
				<li><img src="/gachi/img/test_image.jpg"/></li>
				<li>
					<label class="badge badge-info">공예/창작</label>
					<label class="badge badge-light"><a href="#">주문번호 10101010</a></label>
				</li>
				<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
				<li>크리에이터명 <a href="#">홍길동</a></li>
				<li>결제가격 15000원</li>
				<li>결제일시 20.11.06 19:30:34</li>
			</ul>
			<div class="mypageMainLstBtn">
				<button type="button" class="btn btn-outline-light mypageDelivery">배송조회</button>
				<button type="button" class="btn btn-outline-light">결제취소</button>
			</div>
		</div>
		<div>
			<label>2020-11-06</label>
			<ul class="mypageMainLst">
				<li><img src="/gachi/img/test_image.jpg"/></li>
				<li>
					<label class="badge badge-info">공예/창작</label>
					<label class="badge badge-light"><a href="#">주문번호 10101010</a></label>
				</li>
				<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
				<li>크리에이터명 <a href="#">홍길동</a></li>
				<li>결제가격 15000원</li>
				<li>결제일시 20.11.06 19:30:34</li>
			</ul>
			<div class="mypageMainLstBtn">
				<button type="button" class="btn btn-outline-light mypageDelivery">배송조회</button>
				<button type="button" class="btn btn-outline-light">결제취소</button>
			</div>
		</div>
	</div>
	<div class="mypageMainBtm">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">Prev</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</div>
</div>
<div id="mypageModal">
	<div class="mypageModal_content">
		<h2>배송조회</h2>
		<hr/>
		<div>상품이 배송진행중 상태입니다.</div>
		<label>송장정보</label>
		<ul>
			<li>송장번호</li>
			<li>10101010</li>
			<li>택배사</li>
			<li>한진택배</li>
			<li>대표번호</li> 
			<li>1588-0011</li>
		</ul>
		<div id="mypageModalBtm">
			<button type="button" class="btn btn-primary" id="mypageModalClose">확인</button>
		</div>
	</div>
	<div class="mypageModal_layer"></div>
</div>