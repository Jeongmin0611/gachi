<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		box-shadow: 0px 0px 10px 1px #eee;
		padding: 20px;
		margin-bottom: 50px;
		overflow: hidden;
	}
	.userHr{
		background-color: #000;
	}
	.mypageContent{	
		margin: 10px auto 50px;	 	
	}
	
	
	.mypageContent div{
		text-align: center;
	}
	.mypageContent>label{
		margin-top:20px;
	}
	.mypageContent input[type="text"],
	.mypageContent textarea{
		width: 100%;
	}
	.mypageContent button{
		background-color: #abcee3;
	}
	#orderAgree{
		margin: 50px 0 20px;
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
				$("#shipTel1").val($("#orderTel1").val());
				$("#shipTel2").val($("#orderTel2").val());
				$("#shipTel3").val($("#orderTel3").val());
				$("#shipZipcode").val($("#orderZipcode").val());
				$("#shipAddr").val($("#orderAddr").val());
				$("#shipAddrDetail").val($("#orderAddrDetail").val());
			}else{
				$("#shipUsername").val("");
				$("#shipUserid").val("");
				$("#shipTel1").val("");
				$("#shipTel2").val($("").val());
				$("#shipTel3").val($("").val());
				$("#shipZipcode").val("");
				$("#shipAddr").val("");
				$("#shipAddrDetail").val("");
			}
		});
		$("#mileageBtn").click(function(){
			if($("#mileageInput").val()>1000){
				alert("보유한 마일리지를 초과하였습니다. 다시 입력해주세요.");
			}else{
				$("#mileageLbl").val($("#mileageInput").val());
				$("#mileageUse").val($("#mileageInput").val()*-1);
				$("#finalPrice").val($("#sumPrice").val()*1+$("#mileageUse").val()*1);
			}
		});
	});
</script>
<div class="container userMainDiv cfont">
	<div class="mypageContent col-lg-8 col-md-10">
		<label style="color:gray">장바구니 ></label>
		<label style="font-size:1.1em"><b>주문/결제</b></label>
		<label style="color:gray">> 주문완료</label>
		<hr class="userHr"/>
		<div class="row">
			<div class="col-4"></div>
			<div class="col-5">클래스/상품명</div>
		</div>
		<hr/>
		<c:set var="sum" value="0"/>
		<c:set var="ship" value="2500"/>
		<c:set var="mileage" value="0"/>
		<c:set var="price" value="0"/>
		<c:set var="cnt" value="0"/>
		<c:forEach var="cvo" items="${orderVOList }">
			<div class="row">
				<c:set var="key" value="${cvo.code }"/>
				<input type="hidden" value="${key }"/>
				<c:if test="${fn:contains(key,'c')}">
					<div class="col-md-4" style="overflow:hidden"><img src="/gachi/img/${cvo.class_img1 }" style="width:100%;height:100px;object-fit: cover"/></div>
				</c:if>
				<c:if test="${fn:contains(key,'g')}">
					<div class="col-md-4" style="overflow:hidden"><img src="/gachi/img/${cvo.goods_img1 }" style="width:100%;height:100px;object-fit: cover"/></div>
				</c:if>
				<c:if test="${fn:contains(key,'c')}">
					<div class="col-md-5">${cvo.class_name }<br/>${cvo.username }</div>
				</c:if>
				<c:if test="${fn:contains(key,'g')}">
					<div class="col-md-5">${cvo.goods_name }</div>
				</c:if>
				<div class="col-md-1">${cvo.amount }개</div>
				<div class="col-md-1">${cvo.stack }p</div>
				<div class="col-md-1">${cvo.real_price }원</div>
			</div>
			<hr/>
			<c:set var="sum" value="${sum+cvo.real_price*cvo.amount }"/>
			<c:if test="${sum ge 50000}">
				<c:set var="ship" value="0"/>
			</c:if>
			<c:set var="price" value="${sum+ship }"/>
			<c:set var="cnt" value="${cnt+1 }"/>
		</c:forEach>
		<label>주문자 정보</label>
		<hr class="userHr"/>
		<div class="row">
			<div class="col-md-4">이름</div>
			<div class="col-md-8"><input type="text" name="username" id="orderUsername" style="border:none;outline:none" value="홍길동" readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-md-4">E-mail</div>
			<div class="col-md-8"><input type="text" name="userid" id="orderUserid" style="border:none;outline:none" value="userid@bitcamp.com" readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-md-4">연락처</div>
			<div class="col-md-8">
				<input type="text" name="tel1" id="orderTel1" value="010" style="width:25%;border:none;outline:none" readonly/>-
				<input type="text" name="tel2" id="orderTel2" value="1111" style="width:25%;border:none;outline:none" readonly/>-
				<input type="text" name="tel3" id="orderTel3" value="2222" style="width:25%;border:none;outline:none" readonly/>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-md-4">주소</div>
			<div class="col-md-8">
				<input type="text" name="zipcode" id="orderZipcode" value="01234" style="width:15%;outline:none" readonly/>
				<button type="button" class="btn btn-outline-light btn-sm" style="width:15%">검색</button>
				<input type="text" name="addr" id="orderAddr" value="서울시 마포구 백범로" style="width:67%;outline:none" readonly/>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-md-4">상세주소</div>
			<div class="col-md-8"><input type="text" name="addrDetail" id="orderAddrDetail" value="11111222222"/></div>
		</div>
		<label>배송지 정보</label>
		<label style="float:right"><input type="checkbox" id="sameUserInfo"/>주문자 정보와 동일</label>
		<hr class="userHr"/>
		<div class="row">
			<div class="col-md-4">이름</div>
			<div class="col-md-8"><input type="text" name="username" id="shipUsername" readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-md-4">E-mail</div>
			<div class="col-md-8"><input type="text" name="userid" id="shipUserid" readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-md-4">연락처</div>
			<div class="col-md-8">
				<input type="text" name="tel1" id="shipTel1" style="width:25%"/>-
				<input type="text" name="tel2" id="shipTel2" style="width:25%"/>-
				<input type="text" name="tel3" id="shipTel3" style="width:25%"/>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-md-4">주소</div>
			<div class="col-md-8">
				<input type="text" name="zipcode" id="shipZipcode" style="width:15%;outline:none" readonly/>
				<button type="button" class="btn btn-outline-light btn-sm" style="width:15%">검색</button>
				<input type="text" name="addr" id="shipAddr" style="width:67%;outline:none" readonly/>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-md-4">상세주소</div>
			<div class="col-md-8"><input type="text" name="addrDetail" id="shipAddrDetail"/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-md-4">배송메세지</div>
			<div class="col-md-8"><textarea name="orderMsg" id="orderMsg"></textarea></div>
		</div>
		<label>결제정보</label>
		<hr class="userHr"/>
		<div class="row">
			<div class="col-md-4">결제수단</div>
			<div class="col-md-8"><input type="radio" name="creditCard" value="신용카드" checked/><label>신용카드</label></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-md-4">마일리지사용</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-8"><input type="text" id="mileageLbl" value="0" style="border:none;outline:none" readonly/></div>
					<div class="col-md-2">원</div>
				</div>
				<div class="row">
					<div class="col-md-8"><input type="text" name="mileage" id="mileageInput" placeholder="현재 마일리지 1,000p"/></div>
					<div class="col-md-3"><button type="button" class="btn btn-outline-light btn-sm" id="mileageBtn">적용</button></div>
				</div>
			</div>
		</div>
		<label>결제금액</label>
		<hr class="userHr"/>
		<div><b>합계</b><input type="text" value="${price }" id="sumPrice" style="border:none;outline:none;width:15%" readonly/>원</div>	
		<c:if test="${ship eq 0}">
			<div><b>배송비 무료</b></div>
		</c:if>	
		<c:if test="${ship ne 0}">
			<div><b>배송비</b> +${ship }원</div>
		</c:if>	
		<div><b>마일리지</b><input type="text" id="mileageUse" value="0" style="border:none;outline:none;width:10%" readonly/>원</div>
		<hr class="userHr"/>
		<div style="font-size:1.2em"><b>총 금액</b><input type="text" value="${price }" id="finalPrice" style="border:none;outline:none;width:15%" readonly/>원</div>
		<div>
			<div><input type="checkbox" id="orderAgree"/>구매진행에 동의합니다.</div>
			<button type="button" class="btn btn-outline-light" id="orderSheetBtn" onclick="requestpay()">결제하기</button>
			<button type="button" class="btn btn-outline-light" id="orderSheetBtn" onclick="location.href='/gachi/userCart'">취소</button>
		</div>
	</div>
</div>