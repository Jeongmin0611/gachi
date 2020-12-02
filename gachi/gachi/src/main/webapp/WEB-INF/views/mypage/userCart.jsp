<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 장바구니 */
	
	/**********************/
	/* 상단 */
	/* 01 장바구니 > 02 주문/결제 > 03 주문완료*/
	#userCartTop{
		text-align:center;
		line-height:50px;
	}
	/**********************/
	/* 내용 */
	
	#userCartContent{
		text-align: center;
	}
	#userCartContent>div>div:nth-child(3){
		text-align: left;
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
<script>
	$(function(){
		//전체체크
		$("#cartSelectAll").click(function(){
			if($("#cartSelectAll").prop("checked")){
				$("input:checkbox").prop("checked",true);
			}else{
				$("input:checkbox").prop("checked",false);
			}
		});
		
		//선택상품삭제
		$("#selectDel").click(function(){
			
		});
	});
</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div class="row" id="userCartTop">
			<div class="col-3">
				<img src="/gachi/img/icon_cart.png" style="width:35px"/>
				<div><b>장바구니</b></div>
			</div>
			<div class="col-1">></div>
			<div class="col-4">
				<img src="/gachi/img/icon_ordersheet.png" style="width:25px"/>
				<div style="color:gray">주문/결제</div>
			</div>
			<div class="col-1">></div>
			<div class="col-3">
				<img src="/gachi/img/icon_check.png" style="width:30px"/>
				<div style="color:gray">주문완료</div>
			</div>
		</div>
		<hr style="background:#000"/>
		<div id="userCartContent">
			<div class="row">
				<div class="col-1"><input type="checkbox" id="cartSelectAll" checked/></div>
				<div class="col-3"></div>
				<div class="col-4">클래스/상품명</div>
				<div class="col-1">수량</div>
				<div class="col-1">마일리지</div>
				<div class="col-1">가격</div>
				<div class="col-1">삭제</div>
			</div>
			<hr/>
			<c:set var="sum" value="0"/>
			<c:set var="ship" value="2500"/>
			<c:set var="price" value="0"/>
			<c:forEach var="cvo" items="${cList }">
				<div class="row">
					<div class="col-md-1"><input type="checkbox" value="${cvo.code }" checked/></div>
					<div class="col-md-3" style="overflow:hidden"><img src="/gachi/img/${cvo.class_img1 }" style="width:100%;height:100px;object-fit: cover"/></div>
					<div class="col-md-4">${cvo.class_name } - ${cvo.username }</div>
					<div class="col-md-1">${cvo.amount }</div>
					<div class="col-md-1">${cvo.stack }p</div>
					<div class="col-md-1">${cvo.real_price }원</div>
					<div class="col-md-1"><button class="btn btn-secondary btn-sm" onclick="location.href='/gachi/userCartDelete?code=${cvo.code}'">X</button></div>
				</div>
				<c:set var="sum" value="${sum+cvo.real_price*cvo.amount }"/>
			</c:forEach>
			<c:forEach var="gvo" items="${gList }">
				<div class="row">
					<div class="col-md-1"><input type="checkbox" value="${gvo.code }" checked/></div>
					<div class="col-md-3" style="overflow:hidden"><img src="/gachi/img/${gvo.goods_img1 }" style="width:100%;height:100px;object-fit: cover"/></div>
					<div class="col-md-4">${gvo.goods_name }</div>
					<div class="col-md-1">${gvo.amount }</div>
					<div class="col-md-1">${gvo.stack }p</div>
					<div class="col-md-1">${gvo.real_price }원</div>
					<div class="col-md-1"><button class="btn btn-secondary btn-sm" onclick="location.href='/gachi/userCartDelete?code=${gvo.code}'">X</button></div>
				</div>
				<c:set var="sum" value="${sum+gvo.real_price*gvo.amount }"/>
				<c:if test="${sum ge 50000}">
					<c:set var="ship" value="0"/>
				</c:if>
				<c:set var="price" value="${sum+ship }"/>
			</c:forEach>
		</div>
		<hr/>
		<div id="userCartBtm">
			<button type="button" id="selectDel" class="btn btn-outline-light btn-sm user_btn_gray">선택상품삭제</button>
			<button type="button" class="btn btn-outline-light btn-sm user_btn_gray" onclick="location.href='/gachi/userCartDeleteAll'">전체삭제</button>
			<label>*주문 시 상품 합계 금액이 50,000원 이상(할인 전 기준)은 무료배송이며, 미만일 경우 2,500원의 배송비가 추가 됩니다.</label>
			<div id="userCartPrice">
				<label>총 구매금액</label>
				<label>${sum }원</label>
				<label>+</label>
				<label>배송비</label>
				<label>${ship }원</label>
				<label>=</label>
				<label>총 결제금액</label>
				<label>${price }원</label>
			</div>
			<div id="userCartBtnDiv">
				<button type="button" class="btn btn-outline-light">쇼핑계속하기</button>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/orderSheet'">선택상품 주문하기</button>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/orderSheet'">전체상품 주문하기</button>
			</div>
		</div>
	</div>
</div>