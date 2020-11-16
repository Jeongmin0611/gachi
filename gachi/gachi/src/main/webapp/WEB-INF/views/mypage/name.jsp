<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container" id="orderSheetContainer">
	<div id="orderSheetTop">
		<ul>
		</ul>
	</div>
	<div id="orderSheetContent">
		<label>주문내역</label>
		<hr/>
		<ul id="orderSheetTtl">
		</ul>
		<hr/>
		<ul id="orderSheetLst">
		</ul>
	</div>
	<label>주문자 정보</label>
	<hr/>
	<div id="orderSheetUserInfo">
		<ul>
			<li>배송메세지</li>
			<li><textarea name="orderMsg" id="orderMsg"></textarea></li>
		</ul>
	</div>
	<label>결제정보</label>
	<hr/>
	<div id="orderSheetPay">
		<ul>
		</ul>
	</div>
	<label>총 결제금액</label>
	<hr/>
	<ul id="orderSheetPrice">
	</ul>
	<ul id="orderSheetPriceFinal">
	</ul>
	<div id="orderSheetBtm">
		<label><input type="checkbox" name="orderAgree" id="orderSheetAgree"/>구매진행에 동의합니다.</label>
		<button type="button" class="btn btn-primary" id="orderSheetBtn" onclick="location.href='/gachi/orderConfirmed'">결제하기</button>
		<button type="button" class="btn btn-secondary" id="orderSheetBtn" onclick="location.href='/gachi/userCart'">취소</button>
	</div>
</div>