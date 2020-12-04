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
	
	.userMainDiv{
		box-shadow:0px 0px 10px 1px #eee;
		padding:20px;
		margin:50px auto;
		width:50%;
	}
	
	/**************/
	/* 상단*/
	/*01 장바구니 > 02 주문/결제 > 03 주문완료*/
	#orderConfirmedTop{
		overflow:auto;
		margin:20px 50px 10px;
	}
	
	/* 로고사이즈 */
	#orderConfirmedTop>ul>li img{
		margin:0 5px;
	}
	#orderConfirmedTop>ul>li:first-child img{
		width:30px;
	}
	#orderConfirmedTop>ul>li:nth-child(3) img{
		width:22px;
	}
	#orderConfirmedTop>ul>li:nth-child(5) img{
		width:25px;
	}
	
	#orderConfirmedTop li{
		float:left;
		margin:0 10px;
	}
	#orderConfirmedTop li:nth-child(5){
		font-weight:bold;
	}
	#orderConfirmedTop li:not(:nth-child(5)){
		color:gray;
	}
	
	/**************/
	/* 내용 */
	
	#orderConfirmedContent>div{
		margin:30px auto 0;
		width:100px;
		height:100px;
		text-align:center;
	}
	#orderConfirmedContent>div img{
		width:80%;
	}
	#orderConfirmedContent>label{
		width:100%;
		text-align:center;
		margin:10px 0 100px;
		font-size:1.5em;
	}
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
		margin:100px 0 50px;
	}
	#orderConfirmedBtm button:first-child{
		background-color:#eee;
		color:#000;
		
	}
	#orderConfirmedBtm button:last-child{
		background-color:#ABCEE3;
	}
	
</style>
<div class="container userMainDiv cfont">
	<div id="orderConfirmedTop">
		<ul>
			<li><img src="/gachi/img/icon_cart.png"/>장바구니</li>
			<li>></li>
			<li><img src="/gachi/img/icon_ordersheet.png"/>주문/결제</li>
			<li>></li>
			<li><img src="/gachi/img/icon_check.png"/>주문완료</li>
		</ul>
	</div>
	<hr style="background:#000"/>
	<div id="orderConfirmedContent">
		<div>
			<img src="/gachi/img/icon_check.png"/>
		</div>
		<label>주문이 완료되었습니다.</label>
		<ul id="orderConfirmedLst">
			<li>주문번호</li>
			<li>${order_code }</li>
			<li>결제금액</li>
			<li>17,500원</li>
			<li>결제수단</li>
			<li>신용카드</li>
			<li>주문내역</li>
			<li>프랑스 자수 만들기</li>
		</ul>
	</div>
	<div id="orderConfirmedBtm">
		<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/mypage'">결제내역보기</button>
		<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi'">홈으로</button>
	</div>
</div>