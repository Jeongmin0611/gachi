<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 주문완료 */
	a:link, a:visited{
		color:#000;
		text-decoration:none;
	}
	a:hover{
		text-decoration:none;
		font-weight:bold;
	}
	
	#orderConfirmedMain{
		margin:50px auto 0;
		width:50%;
	}
	
	/**************/
	/* 상단*/
	/*01 장바구니 > 02 주문/결제 > 03 주문완료*/
	#orderConfirmedTop{
		overflow:auto;
		border:3px solid #ABCEE3;
		margin-bottom:20px;
	}
	#orderConfirmedTop li{
		color:#ABCEE3;
		float:left;
		margin:10px;
	}
	#orderConfirmedTop li:nth-child(5){
		font-weight:bold;
	}
	#orderConfirmedTop li:not(:nth-child(5)){
		color:gray;
	}
	#orderConfirmedContent>label{
		width:100%;
		font-size:2em;
		text-align:center;
		margin:50px 0;
	}
	
	/**************/
	/* 내용 */
	/* 주문내역 리스트 */
	#orderConfirmedLst{
		overflow:auto;
		border-top:1px solid gray;
		margin-bottom:50px;
	}
	#orderConfirmedLst li{
		float:left;
		border:1px solid #fff;
		padding:5px 30px;
		border-bottom:1px solid gray;
	}
	#orderConfirmedLst li:nth-child(2n+1){
		width:30%;
		background-color:#eee;
	}
	#orderConfirmedLst li:nth-child(2n){
		width:70%;
	}
	
	/* 하단 */
	#orderConfirmedBtm{
		text-align:center;
		overflow:auto;
		margin:20px 0 100px;
	}
	
</style>
<div class="container" id="orderConfirmedContainer">
	<div id="orderConfirmedTop">
		<ul>
			<li>01 장바구니</li>
			<li>></li>
			<li>02 주문/결제</li>
			<li>></li>
			<li>03 주문완료</li>
		</ul>
	</div>
	<div id="orderConfirmedContent">
		<label>주문이 완료되었습니다.</label>
		<ul id="orderConfirmedLst">
			<li>주문번호</li>
			<li>10101010</li>
			<li>결제금액</li>
			<li>17,500원</li>
			<li>결제수단</li>
			<li>신용카드</li>
			<li>주문내역</li>
			<li>프랑스 자수 만들기</li>
		</ul>
	</div>
	<div id="orderConfirmedBtm">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='/gachi/mypage'">결제내역보기</button>
		<button type="button" class="btn btn-outline-primary" onclick="location.href='/gachi'">홈으로</button>
	</div>
</div>