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
	}
	
	/**************/
	/* 상단 */
	/* 01 장바구니 > 02 주문/결제 > 03 주문완료 */
	#orderSheetTop{
		font-size:0.9em;
		text-align:center;
		line-height:50px;
	}
	#orderSheetTop>label{
		margin:0 5px;
	}

	
	/**************/
	/* 내용 */
	#orderSheetContent{
		margin-bottom:20px;
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
	/* 주문자정보 */ /* 결제정보 */
	#orderSheetUserInfo>div>div:nth-child(2n+1),
	#orderSheetPay>div>div:nth-child(2n+1){
		text-align:center;
	}
	#orderSheetUserInfo>div>div,
	#orderSheetPay>div>div{
		margin:10px 0;
	}
	#orderSheetUserInfo input,
	#orderSheetUserInfo textarea,
	#orderSheetPay input{
		width:100%;
	}
	
	/**************/
	/* 하단 */
	#orderSheetBtm{
		overflow:auto;
		text-align:center;
		width:100%;
		margin:0 0 50px;
	}
	/* 버튼 */
	#orderSheetBtm>div{
		text-align: right;
		margin: 20px 10px;
	}
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
	$(function(){
		$("#sameUserInfo").change(function(){
			if($("#sameUserInfo").is(":checked")){
				$("#shipUsername").val($("#orderUsername").val());
				$("#shipUserid").val($("#orderUserid").val());
				$("#shipTel").val($("#orderTel").val());
				$(".shipZipcode").val($("#orderZipcode").val());
				$(".shipAddr").val($("#orderAddr").val());
				$("#shipAddrDetail").val($("#orderAddrDetail").val());
			}else{
				$("#shipUsername").val("");
				$("#shipUserid").val("");
				$("#shipTel").val("");
				$(".shipZipcode").val("");
				$(".shipAddr").val("");
				$("#shipAddrDetail").val("");
			}
		});
		$("#mileageBtn").click(function(){
			$("#mileageLbl").val($("#mileageInput").val());
		});
	});
</script>
<div class="container userMainDiv cfont" id="orderSheetContainer">
	<div id="orderSheetTop">
		<label style="color:gray">1 장바구니</label>
		>
		<label style="font-size:1.2em"><b>2 주문/결제</b></label>
		>
		<label style="color:gray">3 주문완료</label>
	</div>
	<hr style="background:#000"/>
	<div id="orderSheetContent">
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
			<div class="row">
				<div class="col-md-4">이름</div>
				<div class="col-md-8"><input type="text" name="username" id="orderUsername" value="홍길동" style="border:none;outline:none;background:#eee" readonly/></div>
			</div>
			<div class="row">
				<div class="col-md-4">E-mail</div>
				<div class="col-md-8"><input type="text" name="userid" id="orderUserid" value="userid@bitcamp.com" style="border:none;outline:none;background:#eee" readonly/></div>
			</div>
			<div class="row">
				<div class="col-md-4">연락처</div>
				<div class="col-md-8"><input type="text" name="tel" id="orderTel" value="010-9999-8888" style="border:none;outline:none;background:#eee" readonly/></div>
			</div>
			<div class="row">
				<div class="col-md-4">주소</div>
				<!-- xs에서 숨기기 -->
				<div class="col-md-8 d-none d-sm-block">
					<div class="row">
						<div class="col-md-2" style="padding:5px"><input type="text" name="zipcode" id="orderZipcode" value="01234" readonly/></div>
						<div class="col-md-1" style="padding:5px"><button type="button" class="btn btn-outline-light btn-sm" style="width:100%;margin:0">검색</button></div>
						<div class="col-md-9" style="padding:5px"><input type="text" name="addr" id="orderAddr" value="서울시 백범로" readonly/></div>
					</div>
				</div>
				<!-- xs에서 보이기 -->
				<div class="col-md-8 d-block d-sm-none">
					<div class="row">
						<div class="col-4" style="padding:5px"><input type="text" name="zipcode" id="orderZipcode" value="01234" readonly/></div>
						<div class="col-2" style="padding:5px"><button type="button" class="btn btn-outline-light btn-sm" style="width:100%;margin:0">검색</button></div	>			
					</div>
					<div class="row">
						<div class="col-12 d-block d-sm-none" style="padding:5px"><input type="text" name="addr" id="orderAddr" value="서울시 백범로" readonly/></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">상세주소</div>
				<div class="col-md-8"><input type="text" name="addrDetail" id="orderAddrDetail" value="11111222222"/></div>
			</div>
		</div>
		<label>배송지 정보</label>
		<label style="float:right"><input type="checkbox" id="sameUserInfo"/>주문자 정보와 동일</label>
		<hr style="background:#000"/>
		<div id="orderSheetUserInfo">
			<div class="row">
				<div class="col-md-4">이름</div>
				<div class="col-md-8"><input type="text" name="username" id="shipUsername" readonly/></div>
			</div>
			<div class="row">
				<div class="col-md-4">E-mail</div>
				<div class="col-md-8"><input type="text" name="userid" id="shipUserid" readonly/></div>
			</div>
			<div class="row">
				<div class="col-md-4">연락처</div>
				<div class="col-md-8"><input type="text" name="tel" id="shipTel" readonly/></div>
			</div>
			<div class="row">
				<div class="col-md-4">주소</div>
				<!-- xs에서 숨기기 -->
				<div class="col-md-8 d-none d-sm-block">
					<div class="row">
						<div class="col-md-2" style="padding:5px"><input type="text" name="zipcode" class="shipZipcode" readonly/></div>
						<div class="col-md-1" style="padding:5px"><button type="button" class="btn btn-outline-light btn-sm" style="width:100%;margin:0">검색</button></div>
						<div class="col-md-9" style="padding:5px"><input type="text" name="addr" class="shipAddr" readonly/></div>
					</div>
				</div>
				<!-- xs에서 보이기 -->
				<div class="col-md-8 d-block d-sm-none">
					<div class="row">
						<div class="col-4" style="padding:5px"><input type="text" name="zipcode" class="shipZipcode" readonly/></div>
						<div class="col-2" style="padding:5px"><button type="button" class="btn btn-outline-light btn-sm" style="width:100%;margin:0">검색</button></div	>			
					</div>
					<div class="row">
						<div class="col-12 d-block d-sm-none" style="padding:5px"><input type="text" name="addr" class="shipAddr" readonly/></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">상세주소</div>
				<div class="col-md-8"><input type="text" name="addrDetail" id="shipAddrDetail"/></div>
			</div>
			<div class="row">
				<div class="col-md-4">배송메세지</div>
				<div class="col-md-8"><textarea name="orderMsg" id="orderMsg"></textarea></div>
			</div>
		</div>
		<label>결제정보</label>
		<hr style="background:#000"/>
		<div id="orderSheetPay">
			<div class="row">
				<div class="col-md-4">결제수단</div>
				<div class="col-md-8"><input type="radio" name="creditCard" value="신용카드" style="width:10px" checked/><label>신용카드</label></div>
			</div>
			<div class="row">
				<div class="col-md-4">적립금사용</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-6"><input type="text" id="mileageLbl" value="0" style="border:none;outline:none" readonly/></div>
						<div class="col-md-1">원</div>
					</div>
					<div class="row">
						<div class="col-md-6"><input type="text" name="mileage" id="mileageInput" placeholder="현재 마일리지 1,000p"/></div>
						<div class="col-md-2"><button type="button" class="btn btn-outline-light btn-sm" id="mileageBtn">적용</button></div>
					</div>
				</div>
			</div>
		</div>
		<label>결제금액</label>
		<hr style="background:#000"/>
		</div>
	<div id="orderSheetBtm">
		<div><b>합계</b> 720000원</div>	
		<div><b>배송비 무료</b></div>
		<div><b>마일리지</b> -0원</div>
		<hr class="userHr"/>
		<div style="font-size:1.2em"><b>총 금액</b> 720000원</div>
		<label><input type="checkbox" name="orderAgree"/>구매진행에 동의합니다.</label>
		<button type="button" class="btn btn-outline-light" id="orderSheetBtn" onclick="requestpay()">결제하기</button>
		<button type="button" class="btn btn-outline-light" id="orderSheetBtn" onclick="location.href='/gachi/userCart'">취소</button>
	</div>
</div>