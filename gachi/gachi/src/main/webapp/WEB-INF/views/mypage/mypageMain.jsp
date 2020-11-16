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
	.mypageMainBtm{margin:100px 0;width:100%;background-color:pin}
	
</style>
<div class="container" id="myclassMainContainer">
	<%@ include file="../inc/userProfile.jspf"%>
	<!-- 마이페이지(메인) - 상단 -->
	<div id="mypageMainTop">
		<form id="mypageMainTopFrm">
			<input type="radio" value="전체"/><label>전체</label>
			<input type="radio" value="상품"/><label>상품</label>
			<input type="radio" value="클래스"/><label>클래스</label>
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
				<button type="button" class="btn btn-outline-light">배송조회</button>
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
				<button type="button" class="btn btn-outline-light">배송조회</button>
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
				<button type="button" class="btn btn-outline-light">배송조회</button>
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
				<button type="button" class="btn btn-outline-light">배송조회</button>
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
				<button type="button" class="btn btn-outline-light">배송조회</button>
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