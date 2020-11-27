<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>	
	
	/* 마이페이지(메인) - 컨테이너 */
	
	.mypageTop>div{	
		width:;
		float:;
		margin:;
	}
	.mypageTop button,
	.mypageContent button{
		background-color: #abcee3;
		margin:5px 0;
	}	
	.mypageContent>div>div{
		margin:auto 0;
	}	
	.mypageContent>div>div:nth-child(2){
		text-align:left;
	}
	/*클래스썸네일*/
	.mypageContent img{
		width: 150px;
	    height: 100px;
	    object-fit: cover;
	}

	/* 페이징 */
	.mypageMainBtm{
		margin:100px 0 50px;
		width:100%;
	}
	
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
	.mypageModal_content>div:first-child{
		margin:0 auto;
		width:100px;
		height:100px;
		background-color:#ffdac3;
		border-radius: 50%;
		text-align:center;
	}
	.mypageModal_content>div:first-child img{
		width:80%;
	}
	.mypageModal_content>div:nth-child(2){
		margin-top:20px;
		height:100px;
		text-align:center;
		border:2px solid #eee;
		font-size:1.3em;
		line-height:100px;
	}
	.mypageModal_content>div:nth-child(2) label{
		color:#ABCEE3;
	}
	.mypageModal_content>label{
		font-size:1em;
	}
	.mypageModal_content>label:nth-child(3){
		margin-top:30px;
	}
	/* 송장정보 */
	.mypageModal_content ul{
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
		background-color:#abcee3;
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
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<!-- 마이페이지(메인) - 상단 -->
	<div class="userMainDiv">
		<div class="mypageTop">
			<div class="d-none d-sm-none d-md-block">
				<!-- xs, sm 크기에서만 숨기기  -->
				<input type="radio" name="option"/><label>전체</label>
				<input type="radio" name="option"/><label>상품</label>
				<input type="radio" name="option"/><label>클래스</label>
						
				<input type="date" id="mypageMainDate1"/>
				-
				<input type="date" id="mypageMainDate2"/>
			
				<button type="button" class="btn btn-outline-light btn-sm">조회</button>
			</div>
			<!-- xs, sm 크기에서만 보이기  -->
			<div class="d-block d-sm-bolck d-md-none">
				<div>
					<input type="radio" name="option"/><label>전체</label>
					<input type="radio" name="option"/><label>상품</label>
					<input type="radio" name="option"/><label>클래스</label>
				</div>
				<div>	
					<input type="date" id="mypageMainDate1"/>
					-
					<input type="date" id="mypageMainDate2"/>
				
				<button type="button" class="btn btn-outline-light btn-block">조회</button>
				</div>
			</div>
		</div>
		<div class="mypageContent">
			<h4>2020.11.06</h4>
			<hr class="userHr"/>
			<div class="row">	
				<div class="col-md-3"><img src="/gachi/img/test_image.jpg"/></div>
				<div class="col-md-6">
					<ul class="mypageMainLst">
						<li>
							<label class="badge badge-info">공예/창작</label>
							<label class="badge badge-light"><a href="#">주문번호 10101010</a></label>
						</li>
						<li>클래스명 <a href="#">카모마일 프랑스 자수</a></li>
						<li>크리에이터명 <a href="#">홍길동</a></li>
						<li>결제가격 15000원</li>
						<li>결제일시 20.11.06 19:30:34</li>
					</ul>
				</div>
				<!-- xs 크기에서만 숨기기  -->
				<div class="col-md-3 col d-none d-sm-block">
					<div><button type="button" class="btn btn-outline-light mypageDelivery">배송조회</button></div>
					<div><button type="button" class="btn btn-outline-light">결제취소</button></div>
				</div>
				<!-- xs 크기에서만 보이기  -->
				<div class="col-md-3 d-block d-sm-none">
					<div><button type="button" class="btn btn-outline-light mypageDelivery">배송조회</button>
						<button type="button" class="btn btn-outline-light">결제취소</button></div>
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
</div>
<div id="mypageModal" class="cfont">
	<div class="mypageModal_content">
		<div>
			<img src="/gachi/img/icon_delivery.png">
		</div>
		<div>상품이 <label>배송진행중</label> 상태입니다.</div>
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
			<button type="button" class="btn btn-outline-light" id="mypageModalClose">확인</button>
		</div>
	</div>
	<div class="mypageModal_layer"></div>
</div>