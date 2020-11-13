<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	/*장바구니 상단*/
	/*01 장바구니 > 02 주문/결제 > 03 주문완료*/
	#cartTop{overflow:auto;}
	#cartTop li{
		float:left;
		margin:20px 10px 10px;
	}
	#cartTop li:first-child{font-weight:bold;}
	#cartTop li:not(:first-child){color:gray;}
	
	/*장바구니 목록 제목*/
	#cartLstTtl, #cartLst{overflow:auto;}
	#cartLstTtl li, #cartLst li{float:left;width:10%;text-align:center;}
	#cartLstTtl li:nth-child(2){width:40%;}
	
	/*장바구니 목록*/
	#cartLst{height:200px;line-height:160px;}
	#cartLst li:nth-child(2){width:40%;}
	#cartLst li img{float:left;margin:10px;}
	#cartLst img{width:200px;height:150px;object-fit:cover;margin-top:5%;}
	
	/*장바구니 하단*/
	#cartBtm>label{float:right;font-size:0.7em;}
	#cartPrice{margin:20px 10px;height:150px;line-height:150px;text-align:center;background-color:#eee;}
	#cartPrice>label{width:8%;}
	#cartPrice>label:nth-child(7),#cartPrice>label:nth-child(8){font-weight:bold;}
	#cartBtnDiv{margin:50px auto 100px;width:50%;}
	#cartBtnDiv button{width:30%;}
	
</style>
<div class="container" id="cartMain">
	<%@ include file="../inc/userProfile.jspf"%>
	<div id="cartTop">
		<ul>
			<li>01 장바구니</li>
			<li>></li>
			<li>02 주문/결제</li>
			<li>></li>
			<li>03 주문완료</li>
		</ul>
	</div>
	<hr/>
	<div id="cartContent">
		<ul id="cartLstTtl">
			<li><input type="checkbox" name="selectAll" checked/></li>
			<li>클래스/상품명</li>
			<li>수량</li>
			<li>적립금</li>
			<li>가격</li>
			<li>배송비</li>
			<li>삭제</li>
		</ul>
		<hr/>
		<ul id="cartLst">
			<li><input type="checkbox" name="selectItem" checked/></li>
			<li>
				<img src="/gachi/img/test_image.jpg"/>
				<label>카모마일 프랑스 자수</label>
			</li>
			<li>1</li>
			<li>150</li>
			<li>15,000원</li>
			<li>2,500원</li>
			<li><label class="badge badge-secondary">X</label></li>
		</ul>
	</div>
	<hr/>
	<div id="cartBtm">
		<button type="button" class="btn btn-outline-dark btn-sm">선택상품삭제</button>
		<label>*주문 시 상품 합계 금액이 50,000원 이상(할인 전 기준)은 무료배송이며, 미만일 경우 2,500원의 배송비가 추가 됩니다.</label>
		<div id="cartPrice">
			<label>총 구매금액</label>
			<label>15,000원</label>
			<label>+</label>
			<label>배송비</label>
			<label>2,500원</label>
			<label>=</label>
			<label>총 결제금액</label>
			<label>17,500원</label>
		</div>
		<div id="cartBtnDiv">
			<button type="button" class="btn btn-outline-primary">쇼핑계속하기</button>
			<button type="button" class="btn btn-outline-primary" onclick="location.href='/gachi/orderSheet'">선택상품 주문하기</button>
			<button type="button" class="btn btn-primary" onclick="location.href='/gachi/orderSheet'">전체상품 주문하기</button>
		</div>
	</div>
</div>