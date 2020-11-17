<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<div class="container">
<div id="ad_order_Area">
<form method="post" action="">
	<ul id="ad_order_searchForm">
		<li>주문검색</li>
		<li>
			<select>
				<option>주문번호</option>
				<option>상품코드</option>
				<option>구매자닉네임</option>
			</select>
			<input type="text"/>		
		</li>
		<li>주문기간</li>
		<li>
			<select>
				<option>주문일</option>
			</select>
			 <button>오늘</button>
			 <button>어제</button>
			 <button>3일</button>
			 <button>1주일</button>
			 <button>15일</button>
			 <button>1개월</button>
			 <button>3개월</button>
			 <button>6개월</button>
			 <input type="date"/>~
			 <input type="date"/>
		</li>
		<li>결제수단</li>
		<li>
			<input type="checkbox" name="" value="" checked/>전체
			<input type="checkbox" name="" value=""/>무통장입금
			<input type="checkbox" name="" value=""/>카드결제
			<input type="checkbox" name="" value=""/>네이버페이
			<input type="checkbox" name="" value=""/>카카오페이
			<input type="checkbox" name="" value=""/>페이코
			<input type="checkbox" name="" value=""/>삼성페이
		</li>
		<li>주문상태</li>
		<li>
			<input type="radio" name="" checked/>전체
			<input type="radio" name=""/>입금대기
			<input type="radio" name=""/>입금완료
			<input type="radio" name=""/>배송준비
			<input type="radio" name=""/>배송중
			<input type="radio" name=""/>배송완료
			<input type="radio" name=""/>주문확정
		</li>
	</ul>
	<div style="text-align:center">
		<input type="submit" value="검색">
		<input type="reset" value="초기화">
	</div>
</form>
</div>
<ul id="ad_order_lst" class="text-center">
	<li>주문번호</li>
	<li>상품코드</li>
	<li>상품명</li>
	<li>구매자</li>
	<li>가격</li>
	<li>적립금액</li>
	<li>미수금</li>
	<li>결제수단</li>
	<li>결제일</li>
	<li>주문상태</li>
	
	<li><a href="/gachi/adminOrderView">1234567891234</a></li>
	<li>go123</li>
	<li>해당사항없음</li>
	<li>김구매</li>
	<li>15,000원</li>
	<li>150원</li>
	<li>0원</li>
	<li>카드</li>
	<li>2020-11-16</li>
	<li>배송준비</li>
	
	<li>1234567891234</li>
	<li>go123</li>
	<li>요가 매트</li>
	<li>박구매</li>
	<li>9,900원</li>
	<li>99원</li>
	<li>0원</li>
	<li>카카오페이</li>
	<li>2020-11-14</li>
	<li>배송완료</li>
	
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