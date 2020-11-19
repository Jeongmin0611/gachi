<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 장바구니 */
	
	/**********************/
	/* 상단 */
	/* 01 장바구니 > 02 주문/결제 > 03 주문완료 */
	#userCartTop{
		overflow:auto;
		margin:20px 50px 10px;
	}
	#userCartTop li{
		float:left;
		margin:0 10px;
	}
	#userCartTop li:first-child{
		font-weight:bold;
	}
	#userCartTop li:not(:first-child){
		color:gray;
	}
	
	/**********************/
	/* 내용 */
	/*장바구니 내역 제목*/
	#userCartLstTtl, #userCartLst{
		overflow:auto;
	}
	#userCartLstTtl li, #userCartLst li{
		float:left;
		width:10%;
		text-align:center;
	}
	#userCartLstTtl li:nth-child(2){
		width:40%;
	}
	/*장바구니 내역 리스트*/
	#userCartLst{
		height:200px;
		line-height:160px;
	}
	#userCartLst li:nth-child(2){
		width:40%;
	}
	#userCartLst li img{
		float:left;
		margin:10px;
	}
	#userCartLst img{
		width:200px;
		height:150px;
		object-fit:cover;
		margin-top:5%;
	}
	
	/**********************/
	/* 하단 */
	#userCartBtm>label{
		float:right;
		font-size:0.7em;
		margin-right:10px;
	}
	#userCartBtm>button{
		background-color:#eee;
		color:#000;
		margin-left:10px;
	}
	
	/* 가격정보 */
	#userCartPrice{
		margin:20px 10px;
		height:150px;
		line-height:150px;
		text-align:center;
		background-color:#eee;
	}
	#userCartPrice>label{
		width:10%;
	}
	#userCartPrice>label:nth-child(7),#userCartPrice>label:nth-child(8){
		font-weight:bold;
	}
	/* 버튼 영역 */
	#userCartBtnDiv{
		margin:100px auto 50px;
		width:50%;
	}
	#userCartBtnDiv button{
		width:30%;
	}
	#userCartBtnDiv button:first-child,
	#userCartBtnDiv button:nth-child(2){
		background-color:#eee;
		color:#000;
	}
	#userCartBtnDiv button:last-child{
		background-color:#ABCEE3;
	}
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div id="userCartTop">
			<ul>
				<li>01 장바구니</li>
				<li>></li>
				<li>02 주문/결제</li>
				<li>></li>
				<li>03 주문완료</li>
			</ul>
		</div>
		<hr/>
		<div id="userCartContent">
			<ul id="userCartLstTtl">
				<li><input type="checkbox" name="selectAll" checked/></li>
				<li>클래스/상품명</li>
				<li>수량</li>
				<li>마일리지</li>
				<li>가격</li>
				<li>배송비</li>
				<li>삭제</li>
			</ul>
			<hr/>
			<ul id="userCartLst">
				<li><input type="checkbox" name="selectItem" checked/></li>
				<li>
					<img src="/gachi/img/test_image.jpg"/>
					<label>카모마일 프랑스 자수</label>
				</li>
				<li>1</li>
				<li>150p</li>
				<li>15,000원</li>
				<li>2,500원</li>
				<li><label class="badge badge-secondary">X</label></li>
			</ul>
		</div>
		<hr/>
		<div id="userCartBtm">
			<button type="button" class="btn btn-outline-light btn-sm user_btn_gray">선택상품삭제</button>
			<label>*주문 시 상품 합계 금액이 50,000원 이상(할인 전 기준)은 무료배송이며, 미만일 경우 2,500원의 배송비가 추가 됩니다.</label>
			<div id="userCartPrice">
				<label>총 구매금액</label>
				<label>15,000원</label>
				<label>+</label>
				<label>배송비</label>
				<label>2,500원</label>
				<label>=</label>
				<label>총 결제금액</label>
				<label>17,500원</label>
			</div>
			<div id="userCartBtnDiv">
				<button type="button" class="btn btn-outline-light">쇼핑계속하기</button>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/orderSheet'">선택상품 주문하기</button>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/orderSheet'">전체상품 주문하기</button>
			</div>
		</div>
	</div>
</div>