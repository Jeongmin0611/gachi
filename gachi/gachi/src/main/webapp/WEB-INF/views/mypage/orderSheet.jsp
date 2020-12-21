<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		background-color: ;
	}
	#orderAgree{
		margin: 50px 0 20px;
	}
	
</style>
<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp49958481');  // 가맹점 식별 코드
	var order_code;
	//결제하는 함수
	function requestPay(){
		// IMP.request_pay(param, callback) 호출
		IMP.request_pay({
		   pg : 'html5_inicis', // 결제방식
		    pay_method : 'card',	// 결제 수단
		    merchant_uid : new Date().getTime(), //주문번호 생성
		   name : '결제테스트', // order 테이블에 들어갈 주문명 혹은 주문 번호
		    amount : '100', //$("finalPrice").val(),	// 결제 금액
		    buyer_email : $("#orderUserid").val(),	
		   buyer_name : $("#orderUsername").val(),
		    buyer_tel : $("#orderTel").val(),	
		    buyer_addr : $("#orderAddr").val(),	
		    buyer_postcode : $("#orderZipcode").val(),	
		}, function(rsp) { // callback
			console.log(rsp);
			if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		      // jQuery로 HTTP 요청
		      	var order_code = rsp.merchant_uid;
	      		var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid+"\n"; 
                msg += '거래ID : ' + rsp.merchant_uid+"\n"; 
                msg += '주문번호 : ' + order_code+"\n"; 
                msg += '결제 금액 : ' + rsp.paid_amount+"\n";
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
		        jQuery.ajax({
		          url: "/gachi/orderChk", 
		          method: "POST",
		          headers: { "Content-Type": "application/json" },
		          data: JSON.stringify({
		                imp_uid: rsp.imp_uid, //거래고유번호
		                order_code: rsp.merchant_uid,
		                userid: rsp.buyer_email,
		                full_price: $("#sumPrice").val(),
		                shipping_fee: $("#shipLbl").val(),
		                discount: $("#mileageUse").val(),
		                price: $("#finalPrice").val(),
		                payment_type: rsp.pg,
		                card_type: rsp.pay_method,
		                zipcode: $("#shipZipcode").val(),
		                addr: $("#shipAddr").val(),
		                detailaddr: $("#shipDetailaddr").val(),
		                etc: $("#orderMsg").val()
		                }),
		          }).done(function(data){
		        	  alert($("#mileageUse").val());
		        	  $("#order_code").val(order_code);
				      $("#orderFrm").submit();
		          });
		        
		    } else {
		    	var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	            alert(msg);
		        document.location.href="/gachi/mypage";
		    }
		});
	}
	//3자리 콤마
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	$(function(){
		// 주문자정보와 배송지정보가 같을때
		$("#sameUserInfo").change(function(){
			if($("#sameUserInfo").is(":checked")){
				$("#shipUsername").val($("#orderUsername").val());
				$("#shipUserid").val($("#orderUserid").val());
				$("#shipTel").val($("#orderTel").val());
				$("#shipZipcode").val($("#orderZipcode").val());
				$("#shipAddr").val($("#orderAddr").val());
				$("#shipDetailaddr").val($("#orderDetailaddr").val());
			}else{
				$("#shipUsername").val("");
				$("#shipUserid").val("");
				$("#shipTel").val("");
				$("#shipZipcode").val("");
				$("#shipAddr").val("");
				$("#shipDetailaddr").val("");
			}
		});
		//마일리지 버튼 적용
		$("#mileageBtn").click(function(){
			if($("#mileageInput").val()>${mileage}){
				alert("보유한 마일리지를 초과하였습니다. 다시 입력해주세요.");
			}else{
				$("#mileageLbl").text(numberWithCommas($("#mileageInput").val()));
				$("#mileageUse").val($("#mileageInput").val()*-1);
				$("#mileageUseLbl").text(numberWithCommas($("#mileageInput").val()*-1));
				$("#finalPrice").val($("#sumPrice").val()*1+$("#shipLbl").val()*1-$("#mileageInput").val()*1);
				$("#finalPriceLbl").text(numberWithCommas($("#sumPrice").val()*1+$("#shipLbl").val()*1-$("#mileageInput").val()*1));
			}
			$("#mileageInput").val(0);
		});
		//빈칸검사
		$("#payBtn").click(function inputChk(){
			var msg = "배송지 정보를 모두 입력해주세요.";
			if($("#shipUsername").val()==""){
				alert(msg);
				return false;
			}
			if($("#shipUserid").val()==""){
				alert(msg);
				return false;
			}
			if($("#shipTel").val()==""){
				alert(msg);
				return false;
			}
			if($("#shipZipcode").val()==""){
				alert(msg);
				return false;
			}
			if($("#shipAddr").val()==""){
				alert(msg);
				return false;
			}
			if($("#shipAddrdetail").val()==""){
				alert(msg);
				return false;
			}
			if(!($("#orderAgree").is(":checked"))){
				msg = "구매진행에 동의해주세요.";
				alert(msg);
				return false;
			}
			requestPay();
		});
	});
</script>
<div class="container userMainDiv cfont">
	<div class="mypageContent col-md-10">
		<label style="color:gray">장바구니 ></label>
		<label style="font-size:1.1em"><b>주문/결제</b></label>
		<label style="color:gray">> 주문완료</label>
		<hr class="userHr"/>
		<form action="/gachi/orderConfirmed" method="post" id="orderFrm">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-5">클래스/상품명</div>
			</div>
			<hr/>
			<c:set var="sum" value="0"/>
			<c:set var="cnt" value="0"/>
			<input type="hidden" name="order_code" id="order_code"/>
			<c:forEach var="cvo" items="${cList }">
				<div class="row">
					<input type="hidden" name="orderClassCode" value="${cvo.code}"/>
						<div class="col-md-2" style="overflow:hidden"><img src="/gachi/upload/classImg/${cvo.class_img }" style="width:100%;height:100%;object-fit: cover"/></div>
						<div class="col-md-5">${cvo.class_name }<br/>${cvo.nickname }</div>
					<div class="col-md-5"><label style="width:20%">${cvo.amount }개</label><input type="hidden" name="amount" value="${cvo.amount }"/>
										  <label style="width:20%">${cvo.stack }p</label>
										  <label style="width:50%"><fmt:formatNumber value="${cvo.real_price }" pattern="#,###" />원</label></div>
				</div>
				<hr/>
				<c:set var="sum" value="${sum+cvo.real_price*cvo.amount }"/>
				<c:set var="cnt" value="${cnt+1 }"/>
			</c:forEach>
			<input type="hidden" name="classCnt" id="classCnt" value="${cnt }"/>
			<c:set var="cnt" value="0"/>
			<c:forEach var="gvo" items="${gList }">
				<div class="row">
					<input type="hidden" name="orderGoodsCode" value="${gvo.code}"/>
						<div class="col-md-2" style="overflow:hidden"><img src="/gachi/upload/storeImg/${gvo.goods_img1 }" style="width:100%;height:100%;object-fit: cover"/></div>
						<div class="col-md-5">${gvo.goods_name }</div>
					<div class="col-md-5"><label style="width:20%">${gvo.amount }개</label>
										  <label style="width:20%">${gvo.stack }p</label>
										  <label style="width:50%"><fmt:formatNumber value="${gvo.real_price }" pattern="#,###" />원</label></div>
				</div>
				<hr/>
				<c:set var="sum" value="${sum+gvo.real_price*gvo.amount }"/>
				<c:set var="cnt" value="${cnt+1 }"/>
			</c:forEach>
			<input type="hidden" name="cnt" id="cnt" value="${cnt }"/>
			<label>주문자 정보</label>
			<hr class="userHr"/>
			<div class="row">
				<div class="col-md-4">이름</div>
				<div class="col-md-8"><input type="text" name="username" id="orderUsername" style="border:none;outline:none" value="${vo.username }" readonly/></div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">E-mail</div>
				<div class="col-md-8"><input type="text" name="userid" id="orderUserid" style="border:none;outline:none" value="${vo.userid }" readonly/></div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">연락처</div>
				<div class="col-md-8">
					<input type="text" name="tel" id="orderTel" value="${vo.tel }" style="border:none;outline:none" readonly/>
				</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">주소</div>
				<div class="col-md-8">
					<input type="text" name="zipcode" id="orderZipcode" value="${vo.zipcode }" style="width:15%;outline:none" readonly/>
					<button type="button" class="btn btn-outline-light btn-sm" style="width:15%">검색</button>
					<input type="text" name="addr" id="orderAddr" value="${vo.addr }" style="width:67%;outline:none" readonly/>
				</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">상세주소</div>
				<div class="col-md-8"><input type="text" name="detailaddr" id="orderDetailaddr" value="${vo.detailaddr }"/></div>
			</div>
			<!-- ---------------------------------- -->
			<c:if test="${result eq 1 }">
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
						<input type="text" name="tel" id="shipTel"/>
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
					<div class="col-md-8"><input type="text" name="detailaddr" id="shipDetailaddr"/></div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-md-4">배송메세지</div>
					<div class="col-md-8"><textarea name="orderMsg" id="orderMsg"></textarea></div>
				</div>
			</c:if>	
			<!-- ------------------------------------------------------------------------ -->
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
						<div class="col-md-8"><label id="mileageLbl" style="margin-left:20px"><fmt:formatNumber value="0" pattern="#,###" /></label></div>
						<div class="col-md-2">원</div>
					</div>
					<div class="row">
						<div class="col-md-8"><input type="text" name="mileage" id="mileageInput" placeholder="현재 마일리지 <fmt:formatNumber value="${mileage }" pattern="#,###" />p"/></div>
						<div class="col-md-3"><button type="button" class="btn btn-outline-light btn-sm" id="mileageBtn">적용</button></div>
					</div>
				</div>
			</div>
			<label>결제금액</label>
			<hr class="userHr"/>
			<div><b>합계</b><input type="hidden" value="${sum }" id="sumPrice"/><label id="sumPriceLbl" style="margin:0 20px"><fmt:formatNumber value="${sum }" pattern="#,###" /></label>원</div>	
			<c:set var="ship" value="0"/>
			<!-- ------------------- -->
			<c:if test="${result eq 1 }">
				<c:if test="${sum lt 50000}"><!-- 50000원 미만 -->
					<c:set var="ship" value="2500"/>
					<div><b>배송비</b><label style="margin:0 20px">+<fmt:formatNumber value="${ship }" pattern="#,###" /></label>원</div>
				</c:if>
				<c:if test="${sum ge 50000}"><!-- 50000원 이상 -->
					<c:set var="ship" value="0"/>
					<div><b>배송비 무료</b></div>
				</c:if>	
			</c:if>
			<!-- ------------------ -->
			<input type="hidden" id="shipLbl" value="${ship }"/>
			<div><b>마일리지</b><input type="hidden" id="mileageUse" value="0"/><label id="mileageUseLbl" style="margin:0 20px"><fmt:formatNumber value="0" pattern="#,###" /></label>원</div>
			<hr class="userHr"/>
			<div style="font-size:1.2em"><b>총 금액</b><input type="hidden" value="${sum+ship }" id="finalPrice"/><label id="finalPriceLbl" style="margin:0 20px"><fmt:formatNumber value="${sum+ship }" pattern="#,###" /></label>원</div>
			<div>
				<div><input type="checkbox" id="orderAgree"/>구매진행에 동의합니다.</div>
				<button type="button" class="btn btn-outline-light" id="payBtn" style="width:20%">결제하기</button>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/userCart'" style="width:20%">취소</button>
			</div>
		</form>
	</div>
</div>