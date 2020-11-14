<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	a:link, a:visited{color:#000;text-decoration:none;}
	a:hover{text-decoration:none;font-weight:bold;}
	#orderSheetMain{margin:50px auto 0;width:50%;}
	
	/*장바구니 상단*/
	/*01 장바구니 > 02 주문/결제 > 03 주문완료*/
	#cartTop{overflow:auto;}
	#cartTop li{
		float:left;
		margin:20px 10px 10px;
	}
	#cartTop li:nth-child(3){font-weight:bold;}
	#cartTop li:not(:nth-child(3)){color:gray;}
	
	#orderSheetContent{}
	
	/*주문신청서 목록 제목*/
	#orderSheetTtl, #orderSheetTtl{overflow:auto;}
	#orderSheetTtl li, #orderSheetLst li{float:left;width:10%;text-align:center;}
	#orderSheetTtl li:first-child{width:70%;}
	
	/*주문신청서 목록*/
	#orderSheetLst{height:200px;line-height:160px;}
	#orderSheetLst li:first-child{width:70%;text-align:left;}
	#orderSheetLst li img{float:left;margin:10px;}
	#orderSheetLst img{width:200px;height:150px;object-fit:cover;margin-top:5%;}
	
	/*주문자정보*/
	#orderSheetUserInfo li{overflow:auto;text-align:center;margin-bottom:20px;}
	#orderSheetUserInfo li:nth-child(2n+1){width:30%;float:left;}
	#orderSheetUserInfo li:nth-child(2n){width:70%;}
	#orderSheetUserInfo li>input{width:100%;padding:0 10px;}
	#orderSheetUserInfo li:nth-child(8)>input:first-child{width:15%;}
	#orderSheetUserInfo li:nth-child(8)>input:last-child{width:70%;}
	#orderMsg{width:100%;height:60px;}
	
	/*결제정보*/
	#orderSheetPay li{text-align:center;margin-bottom:20px;overflow:auto;}
	#orderSheetPay li:nth-child(2n+1){width:30%;float:left;}
	#orderSheetPay li:nth-child(2n){width:70%;text-align:left;}
	#orderSheetPay li:nth-child(4)>input{width:50%;}
	
	/*가격정보*/
	#orderSheetPrice{text-align:center;overflow:auto;background-color:#eee;}
	#orderSheetPrice>label{line-height:100px;width:25%;}
	#orderSheetPrice>label:nth-child(4){font-size:1.5em;}
	#orderSheetPrice>label:nth-child(5){}
	
	/*하단 - 버튼*/
	#orderSheetBtm{text-align:center;margin-bottom:50px;}
	#orderSheetBtm>button{margin:10px 5px;}
</style>
<div class="container" id="orderSheetMain">
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
	</div>
	<hr/>
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
	<hr/>
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
	<div id="orderSheetPrice">
		<label>총 구매금액 15,000원</label>
		+
		<label>배송비 2,500원</label>
		-
		<label>마일리지 사용 0원</label>
		<label>총 금액 17,500원</label>
		<label>(발생 마일리지 150p)</label>
	</div>
	<div id="orderSheetBtm">
		<label><input type="checkbox" name="orderAgree" id="orderSheetAgree"/>구매진행에 동의합니다.</label>
		<button type="button" class="btn btn-primary" id="orderSheetBtn">결제하기</button>
		<button type="button" class="btn btn-secondary" id="orderSheetBtn" onclick="location.href='/gachi/userCart'">취소</button>
	</div>
	
</div>
