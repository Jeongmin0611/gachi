<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 장바구니 */
	
	.mypageContent div{
		text-align: center;
	}
	.mypageContent input{
		border:	none;
		outline: none;
		width: 100%;
	}
	.mypageContent button{
		background-color: ;
	}
	.mypageContent button[type=submit]{
		width: 20%;
	}
	.mypageContent>div:last-child button{
		margin-top: 100px;
	}
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
	
	/**********************/
	/* 하단 */
	
	#userCartBtm>div{
		text-align: center;
		margin: 20px 10px;
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
		
		//수량 변경
		$(".amountChange").click(function(){
			var amount = $(this).prev().val();
			var code = $(this).next().val();
			$.ajax({
				url: "/gachi/cartUpdate",
				data: "code="+code+"&amount="+amount,
				type: "GET",
				success: function(result){
					$(this).prev().val(amount);
				}, error: function(){
					console.log("카트 수량조절 에러");
				}
			});
		});
		
		//선택주문
		$("#selectOrder").click(function(){
			
			$("#cartFrm").submit();
		});
		
		//전체주문
		$("#selectOrder").click(function(){
			
			$("#cartFrm").submit();
	
		});
	});
</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div class="mypageContent col-md-10">
			<label style="font-size:1.1em"><b>장바구니</b></label>
			<label style="color:gray">> 주문/결제 ></label>
			<label style="color:gray">주문완료</label>
			<hr class="userHr"/>
			<c:if test="${result ne 0 }">
				<!-- /////////////////////////////////////////// -->
				<form method="post" id="cartFrm" action="/gachi/orderSheet">
					<div class="row">
						<div class="col-md-1"><input type="checkbox" id="cartSelectAll" checked/></div>
						<div class="col-md-2"></div>
						<div class="col-md-4">클래스/상품명</div>
					</div>
					<hr/>
					<c:set var="sum" value="0"/>
					<c:set var="cnt" value="0"/>
					<c:forEach var="cvo" items="${cList }">
						<div class="row">
							<div class="col-md-1"><input type="checkbox" name="orderClassCode[${cnt }]" value="${cvo.code }" checked/></div>
							<div class="col-md-2" style="overflow:hidden"><img src="/gachi/img/${cvo.class_img }" style="width:100%;height:100%;object-fit: cover"/></div>
							<div class="col-md-4"><input type="text" value="${cvo.class_name }" readonly/><br/>${cvo.nickname }</div>
							<div class="col-md-5"><input type="hidden" value="${cvo.amount }" style="width:15%" readonly/>
												  <input type="text" value="${cvo.stack }" style="width:30%;text-align:right" readonly/>p
										          <input type="text" value="${cvo.real_price }" style="width:30%;text-align:right" readonly/>원
												  <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/gachi/userCartDelete?code=${cvo.code}'" style="float:right">X</button></div>
						</div>
						<hr/>
						<c:set var="sum" value="${sum+cvo.real_price*cvo.amount }"/>
						<c:set var="cnt" value="${cnt+1 }"/>
					</c:forEach>
					<c:set var="cnt" value="0"/>
					<c:forEach var="gvo" items="${gList }">
						<div class="row">
							<div class="col-md-1"><input type="checkbox" name="orderGoodsCode[${cnt }]" value="${gvo.code }" checked/></div>
							<div class="col-md-2" style="overflow:hidden"><img src="/gachi/img/store/${gvo.goods_img1 }" style="width:100%;height:100%;object-fit: cover"/></div>
							<div class="col-md-4"><input type="text" value="${gvo.goods_name }" readonly/></div>
							<div class="col-md-5">		
								<input type="number" min="1" max="99" value="${gvo.amount }" style="width:15%;border:1px solid #ddd;text-align:right"/>개
								<button type="button" class="btn btn-primary btn-sm amountChange">수정</button>\
								<input type="hidden" value="${gvo.code }"/>
								<input type="text" value="${gvo.stack }" style="width:15%;text-align:right" readonly/>p
								<input type="text" value="${gvo.real_price }" style="width:30%;text-align:right" readonly/>원
								<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/gachi/userCartDelete?code=${gvo.code}'" style="float:right">X</button>
							</div>
						</div>
						<hr/>
						<c:set var="sum" value="${sum+gvo.real_price*gvo.amount }"/>
						<c:set var="cnt" value="${cnt+1 }"/>
					</c:forEach>
					<button type="button" id="selectDel" class="btn btn-info btn-sm">선택상품삭제</button>
					<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/gachi/userCartDeleteAll'">전체삭제</button>
					<label style="font-size:0.7em;margin:10px">*주문 시 상품 합계 금액이 50,000원 이상은 무료배송이며, 미만일 경우 2,500원의 배송비가 추가 됩니다.</label>
					<hr/>
					<div id="userCartBtm">
						<div><b>합계</b> ${sum }원</div>	
						<c:if test="${sum lt 50000}">
							<c:set var="ship" value="2500"/>
							<div><b>배송비</b> +${ship }원</div>
						</c:if>
						<c:if test="${sum ge 50000}">
							<c:set var="ship" value="0"/>
							<div><b>배송비 무료</b></div>
						</c:if>
						<input type="hidden" id="shipLbl" value="${ship }"/>
						<hr class="userHr"/>
						<div style="font-size:1.2em;"><b>총 금액</b> ${sum+ship }원</div>
					</div>
					<div>
						<button type="button" class="btn btn-outline-light" onclick="history.go(-2)">쇼핑계속하기</button>
						<button type="button" id="selectOrder" class="btn btn-outline-light">선택상품주문</button>
						<button type="button" id="AllOrder" class="btn btn-outline-light">전체상품주문</button>
					</div>
				</form>
				<!-- /////////////////////////////////////////// -->
			</c:if>
			<c:if test="${result eq 0 }">
				<div>장바구니가 텅 비었어요~</div>
				<div><button type="button" class="btn btn-outline-light" onclick="location.href='/gachi'">쇼핑하러가기</button></div>
			</c:if>
		</div>
	</div>
</div>