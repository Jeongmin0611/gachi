<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 장바구니 */
	
	/**********************/
	/* 상단 */
	/* 01 장바구니 > 02 주문/결제 > 03 주문완료*/
	#userCartTop{
		font-size:0.9em;
		text-align:center;
		line-height:50px;
	}
	#userCartTop>label{
		margin:0 5px;
	}
	/**********************/
	/* 내용 */
	
	#userCartContent{
		text-align: center;
	}
	#userCartContent>div{
		margin: 5px;
	}
	#userCartContent>div>div:nth-child(3){
		text-align: left;
	}
	#userCartContent>button{
		float:left;
		margin:10px 5px;
	}
	#userCartContent>label{
		width:100%;
		font-size:0.7em;
		margin-right:10px;
		text-align:right;
	}
	
	/**********************/
	/* 하단 */
	
	#userCartBtm>div{
		text-align: right;
		margin: 20px 10px;
	}
	#userCartBtm>div:last-child{
		text-align: center;
	} 
	#userCartBtm>div:last-child>button:first-child,
	#userCartBtm>div:last-child>button:nth-child(2){
		background-color:#eee;
		color:#000;
	}
	#userCartBtm>div:last-child>button:last-child{
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
		<div id="userCartTop">
			<label style="font-size:1.1em"><b>1 장바구니</b></label>
			>
			<label style="color:gray">2 주문/결제</label>
			>
			<label style="color:gray">3 주문완료</label>
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
			<button type="button" id="selectDel" class="btn btn-info btn-sm">선택상품삭제</button>
			<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/gachi/userCartDeleteAll'">전체삭제</button>
			<label>*주문 시 상품 합계 금액이 50,000원 이상(할인 전 기준)은 무료배송이며, 미만일 경우 2,500원의 배송비가 추가 됩니다.</label>
		</div>
		<hr/>
		<div id="userCartBtm">
			<div><b>합계</b> ${sum }원</div>	
			<c:if test="${ship eq 0}">
				<div><b>배송비 무료</b></div>
			</c:if>	
			<c:if test="${ship ne 0}">
				<div><b>배송비</b> +${ship }원</div>
			</c:if>	
			<hr class="userHr"/>
			<div style="font-size:1.2em"><b>총 금액</b> ${price }원</div>
			<div id="userCartBtnDiv">
				<button type="button" class="btn btn-outline-light">쇼핑계속하기</button>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/orderSheet'">선택상품 주문하기</button>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/orderSheet'">전체상품 주문하기</button>
			</div>
		</div>
	</div>
</div>