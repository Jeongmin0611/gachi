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
	.userMainDiv{
		box-shadow:0px 0px 10px 1px #eee;
		padding:20px;
		margin:50px auto;
		width:50%;
	}
	
	/**************/
	/* 상단 */
	/* 01 장바구니 > 02 주문/결제 > 03 주문완료 */
	#orderSheetTop{
		overflow:auto;
		margin:20px 50px 10px;
	}
	/* 로고사이즈 */
	#orderSheetTop>ul>li img{
		margin:0 5px;
	}
	#orderSheetTop>ul>li:first-child img{
		width:30px;
	}
	#orderSheetTop>ul>li:nth-child(3) img{
		width:22px;
	}
	#orderSheetTop>ul>li:nth-child(5) img{
		width:25px;
	}
	#orderSheetTop li{
		float:left;
		margin:0 10px;
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
	#orderSheetContent input,
	#orderSheetContent textarea{
		outline:none;
	}
	#orderSheetContent>label{
		margin-left:20px;
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
	#orderSheetUserInfo li input{
		width:70%;
		padding:0 20px;
		text-align:center;
	}
	#orderSheetUserInfo li:nth-child(8)>input:first-child{
		width:15%;
		padding:0;
		border:none;
	}
	#orderSheetUserInfo li:nth-child(8)>input:last-child{
		width:70%;
		border:none;
	}
	#orderSheetUserInfo li:nth-child(10)>input{
		width:100%;
	}
	#orderSheetUserInfo textarea{
		border:1px solid #ddd;
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
	#orderSheetContent input{
		border:none;
		border-bottom:1px solid #ddd;
	}
	
	/**************/
	/* 하단 */
	#orderSheetBtm{
		overflow:auto;
		text-align:center;
		width:100%;
		margin:100px 0 50px;
	}
	/* 버튼 */
	#orderSheetBtm>button{
		margin:10px 5px;
	}
	#orderSheetContent button,
	#orderSheetBtm button{
		background-color:#ABCEE3;
	}
	#orderSheetBtm button:last-child{
		background-color:#eee;
		color:#000;
	}
</style>
<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp49958481');  // 가맹점 식별 코드
	
	function requestpay(){
		// IMP.request_pay(param, callback) 호출
		IMP.request_pay({
		   pg : 'html5_inicis', // 결제방식
		    pay_method : 'card',	// 결제 수단
		    merchant_uid : 'merchant_' + new Date().getTime(), //주문번호 생성
		   name : '주문명: 결제 테스트',	// order 테이블에 들어갈 주문명 혹은 주문 번호
		    amount : '100',	// 결제 금액
		    buyer_email : 'member0@gachi.com',	
		   buyer_name :  '박회원',	// 
		    buyer_tel :  '010-1234-5678',	
		    buyer_addr :  '서울시 마포구 백범로',	
		    buyer_postcode :  '01234',	
		}, function(rsp) { // callback
			if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
			      // jQuery로 HTTP 요청
			      jQuery.ajax({
			          url: "/gachi/orderConfirmed", // 가맹점 서버
			          method: "POST",
			          headers: { "Content-Type": "application/json" },
			          data: JSON.stringify({
			              imp_uid: rsp.imp_uid,
			              merchant_uid: rsp.merchant_uid
			          })
			      }).done(function (data) {
			        // 가맹점 서버 결제 API 성공시 로직
			      })
			    } else {
			      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
			    }
		});
	}
</script>
<div class="container userMainDiv cfont" id="orderSheetContainer">
	<div id="orderSheetTop">
		<ul>
			<li><img src="/gachi/img/icon_cart.png"/>장바구니</li>
			<li>></li>
			<li><img src="/gachi/img/icon_ordersheet.png"/>주문/결제</li>
			<li>></li>
			<li><img src="/gachi/img/icon_check.png"/>주문완료</li>
		</ul>
	</div>
	<hr style="background:#000"/>
	<div id="orderSheetContent">
		<label>주문내역</label>
		<hr style="background:#000"/>
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
		<hr style="background:#000"/>
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
					<button type="button" class="btn btn-outline-light btn-sm">검색</button>
					<input type="text" name="addr" value="서울시 마포구 백범로" readonly/>
				</li>
				<li>상세주소</li>
				<li><input type="text" name="addrDetail" value="11111222222"/></li>
				<li>배송메세지</li>
				<li><textarea name="orderMsg" id="orderMsg"></textarea></li>
			</ul>
		</div>
		<label>결제정보</label>
		<hr style="background:#000"/>
		<div id="orderSheetPay">
			<ul>
				<li>결제수단</li>
				<li><input type="radio" name="creditCard" value="신용카드" checked/><label>신용카드</label></li>
				<li>적립금사용</li>
				<li>
					<input type="text" name="useMileage" value="1000"/>
					<button type="button" class="btn btn-outline-light btn-sm">적용</button>
					<label>(현재 마일리지 1,000p)</label>
				</li>
			</ul>
		</div>
		<label>총 결제금액</label>
		<hr style="background:#000"/>
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
		<label><input type="checkbox" name="orderAgree"/>구매진행에 동의합니다.</label>
		<button type="button" class="btn btn-outline-light" id="orderSheetBtn" onclick="requestpay()">결제하기</button>
		<button type="button" class="btn btn-outline-light" id="orderSheetBtn" onclick="location.href='/gachi/userCart'">취소</button>
	</div>
</div>
