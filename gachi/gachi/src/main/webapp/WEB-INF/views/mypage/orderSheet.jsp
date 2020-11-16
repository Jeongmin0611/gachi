<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 주문신청서 */
	a:link, a:visited{
		color:#000;
		text-decoration:none;
	}
	a:hover{
		text-decoration:none;
		font-weight:bold;
	}
	
	#orderSheetContainer{
		margin:50px auto 0;
		width:50%;
	}
	
	/**************/
	/* 상단 */
	/* 01 장바구니 > 02 주문/결제 > 03 주문완료 */
	#orderSheetTop{
		overflow:auto;
		border:3px solid #ABCEE3;
		margin-bottom:20px;
	}
	#orderSheetTop li{
		color:#ABCEE3;
		float:left;
		margin:10px;
	}
	#orderSheetTop li:nth-child(3){
		font-weight:bold;
	}
	#orderSheetTop li:not(:nth-child(3)){
		color:gray;
	}
	
	/**************/
	/* 내용 */
	#orderSheetContent{
		margin-bottom:20px;
	}
	
	/* 주문신청서 내역 제목 */
	#orderSheetTtl, #orderSheetTtl{
		overflow:auto;
	}
	#orderSheetTtl li, #orderSheetLst li{
		float:left;
		width:10%;
		text-align:center;
	}
	#orderSheetTtl li:first-child{
		width:70%;
	}
	
	/* 주문신청서 내역 리스트 */
	#orderSheetLst{
		height:200px;
		line-height:160px;
	}
	#orderSheetLst li:first-child{
		width:70%;
		text-align:left;
	}
	#orderSheetLst li img{
		float:left;
		margin:10px;
	}
	#orderSheetLst img{
		width:200px;
		height:150px;
		object-fit:cover;
		margin-top:5%;
	}
	
	/* 주문자정보 */
	#orderSheetUserInfo{
		overflow:auto;
		margin-bottom:40px;
	}
	#orderSheetUserInfo li{
		overflow:auto;
		text-align:center;
		margin-bottom:20px;
	}
	#orderSheetUserInfo li:nth-child(2n+1){
		width:30%;
		float:left;
	}
	#orderSheetUserInfo li:nth-child(2n){
		width:70%;
	}
	#orderSheetUserInfo li>input{
		width:100%;
		padding:0 10px;
	}
	#orderSheetUserInfo li:nth-child(8)>input:first-child{
		width:15%;
	}
	#orderSheetUserInfo li:nth-child(8)>input:last-child{
		width:70%;
	}
	
	/* 결제정보 */
	#orderSheetPay{
		margin-bottom:40px;
		overflow:auto;
	}
	#orderSheetPay li{
		text-align:center;
		margin-bottom:20px;
		overflow:auto;
	}
	#orderSheetPay li:nth-child(2n+1){
		width:30%;
		float:left;
	}
	#orderSheetPay li:nth-child(2n){
		width:70%;
		text-align:left;
	}
	#orderSheetPay li:nth-child(4)>input{
		width:50%;
	}
	#orderMsg{
		width:100%;
		height:60px;
	}
	
	/* 가격정보 */
	#orderSheetPrice{
		margin:0 10px;
		width:48%;
		height:170px;
		overflow:hidden;
		background-color:#eee;
		padding:20px;
		float:left;
	}
	#orderSheetPrice>li{
		width:50%;
		overflow:auto;
		float:left;
		margin:10px 0;
	}
	#orderSheetPrice>li:nth-child(2n+1){
		font-weight:bold;
	}
	#orderSheetPrice>li:nth-child(2n){
		text-align:right;
	}
	
	/* 최종가격 */
	#orderSheetPriceFinal{
		margin:0 10px;
		width:48%;
		height:170px;
		overflow:hidden;
		padding:20px;
		border:3px solid #ABCEE3;
	}
	#orderSheetPriceFinal>li{
		font-size:1.5em;
		text-align:center;
		margin:10px;
	}
	#orderSheetPriceFinal>li:nth-child(2){
		font-size:1.2em;
	}
	#orderSheetPriceFinal>li:nth-child(3){
		width:100%;
		text-align:right;
		font-size:0.8em;
	}
	
	/**************/
	/* 하단 */
	#orderSheetBtm{overflow:auto;text-align:center;width:100%;margin:10px 0 50px;}
	#orderSheetBtm>button{margin:10px 5px;}
</style>
<div class="container" id="orderSheetContainer">
	<div id="orderSheetTop">
		<ul>
			<li>01 장바구니</li>
			<li>></li>
			<li>02 주문/결제</li>
			<li>></li>
			<li>03 주문완료</li>
		</ul>
	</div>
	<div id="orderSheetContent">
		<label>주문내역</label>
		<hr/>
		<ul id="orderSheetTtl">
			<li>클래스/상품명</li>
			<li>수량</li>
			<li>마일리지</li>
			<li>가격</li>
		</ul>
		<hr/>
		<ul id="orderSheetLst">
			<li>
				<img src="/gachi/img/test_image.jpg"/>
				<label>카모마일 프랑스 자수</label>
			</li>
			<li>1</li>
			<li>150p</li>
			<li>15,000원</li>
		</ul>
		<label>주문자 정보</label>
		<hr/>
		<div id="orderSheetUserInfo">
			<ul>
				<li>이름</li>
				<li><input type="text" name="username" value="홍길동"/></li>
				<li>E-mail</li>
				<li><input type="text" name="userid" value="userid@bitcamp.com"/></li>
				<li>연락처</li>
				<li><input type="text" name="tel" value="010-9999-8888"/></li>
				<li>주소</li>
				<li>
					<input type="text" name="zipcode" value="01234" readonly/>
					<button type="button" class="btn btn-primary btn-sm">검색</button>
					<input type="text" name="addr" value="서울시 마포구 백범로" readonly/>
				</li>
				<li>상세주소</li>
				<li><input type="text" name="addrDetail" value="11111222222"/></li>
				<li>배송메세지</li>
				<li><textarea name="orderMsg" id="orderMsg"></textarea></li>
			</ul>
		</div>
		<label>결제정보</label>
		<hr/>
		<div id="orderSheetPay">
			<ul>
				<li>결제수단</li>
				<li><input type="radio" name="creditCard" value="신용카드" checked/><label>신용카드</label></li>
				<li>적립금사용</li>
				<li>
					<input type="text" name="useMileage" value="1000"/>
					<button type="button" class="btn btn-primary btn-sm">적용</button>
					<label>(현재 마일리지 1,000p)</label>
				</li>
			</ul>
		</div>
		<label>총 결제금액</label>
		<hr/>
		<ul id="orderSheetPrice">
			<li>총 구매금액</li>
			<li>15,000원</li>
			<li>배송비 </li>
			<li>2500원</li>
			<li>마일리지 사용</li>
			<li>-0원</li>
		</ul>
		<ul id="orderSheetPriceFinal">
			<li>최종결제금액</li>
			<li>17,500원</li>
			<li>(마일리지 150p)</li>
		</ul>
	</div>
	<div id="orderSheetBtm">
		<label><input type="checkbox" name="orderAgree""/>구매진행에 동의합니다.</label>
		<button type="button" class="btn btn-primary" id="orderSheetBtn" onclick="location.href='/gachi/orderConfirmed'">결제하기</button>
		<button type="button" class="btn btn-secondary" id="orderSheetBtn" onclick="location.href='/gachi/userCart'">취소</button>
	</div>
</div>
