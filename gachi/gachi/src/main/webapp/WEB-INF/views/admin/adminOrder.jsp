<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<div class="container">
<h1>주문 관리</h1>
<div>
	<ul id="ad_order_info">
		<li>●판매중 : 99개</li>
		<li>●판매완료 : 99개</li>
		<li>●판매취소 : 0개</li>
	</ul>
</div>
<div class="ad_right_align">
	<form action="">
		<select name="#">
			<option>전체</option>
			<option>클래스명</option>
			<option>상품명</option>
			<option>구매자명</option>
			<option>연락처</option>
		</select>
		<select name="#">
			<option>전체</option>
			<option>스토어</option>
			<option>클래스</option>
			
		</select>
		<input type="text" id="" name=""/>
		<input type="submit" value="검색" />
		</form>
</div>
<ul id="ad_order_lst" class="text-center">
	<li>주문번호</li>
	<li>카테고리</li>
	<li>클래스명</li>
	<li>상품명</li>
	<li>구매자</li>
	<li>가격</li>
	<li>적립금액</li>
	<li>결제일</li>
	
	<li><a href="/gachi/adminOrderView">1234567891234</a></li>
	<li>미술</li>
	<li>드로잉기초</li>
	<li>해당사항없음</li>
	<li>김구매</li>
	<li>15,000원</li>
	<li>150원</li>
	<li>2020-11-16</li>
	
	<li>1234567891234</li>
	<li>라이프 스타일</li>
	<li>해당사항없음</li>
	<li>요가 매트</li>
	<li>박구매</li>
	<li>9,900원</li>
	<li>99원</li>
	<li>2020-11-14</li>
</ul>	
<div id="paging">
	<ul>
		<li>prev</li>
		<li>1</li>
		<li>2</li>
		<li>3</li>
		<li>4</li>
		<li>5</li>
		<li>next</li>
	</ul>
</div>
</div>