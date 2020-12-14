<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

	/* 주문완료 */
	.mypageContent div{
		text-align: center;
	}
	.mypageContent button{
		background-color: ;
	}
	.mypageContent>div:last-child button{
		margin-top: 100px;
	}
	
</style>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf"%>
	<div class="userMainDiv">
		<div class="mypageContent col-md-10">
			<label style="font-size:1.1em"><b>장바구니</b></label>
			<label style="color:gray">> 주문/결제 ></label>
			<label style="color:gray">주문완료</label>
			<hr class="userHr"/>
			<div style="margin-bottom:50px">
				<img src="/gachi/img/icon_check.png" style="width:150px;margin-bottom:30px"/>
				<h4>주문이 완료되었습니다.</h4>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">주문번호</div>
				<div class="col-md-8">${vo.order_code }</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">결제금액</div>
				<div class="col-md-8"><fmt:formatNumber value="${vo.price }" pattern="#,###" />원</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">결제수단</div>
				<div class="col-md-8">${vo.payment_type }</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-4">주문내역</div>
				<div class="col-md-8">
					<div>${class_name }<c:if test="${cnt>1 }">외 ${cnt-1 }개</c:if></div>
					<div>${goods_name }</div>
				</div>
			</div>
			<hr/>
			<div>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi/mypage'">결제내역보기</button>
				<button type="button" class="btn btn-outline-light" onclick="location.href='/gachi'">홈으로</button>
			</div>
		</div>
	</div>
</div>