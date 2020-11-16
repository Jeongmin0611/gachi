<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<div class="container">
<h1>반품관리</h1>
<div>
	<ul id="ad_return_info">
		<li>●반품대기 : 5개</li>
		<li>●반품완료 : 90개</li>
	</ul>
</div>
<div class="ad_right_align">
	<form action="">
		<select name="#">
			<option>전체</option>
			<option>상품명</option>
			<option>구매자명</option>
			<option>주문번호</option>
		</select>
		<select name="#">
			<option>전체</option>
			<option>반품대기</option>
			<option>배송완료</option>
			
		</select>
		<input type="text" id="" name=""/>
		<input type="submit" value="검색" />
		</form>
</div>
<ul id="ad_return_lst" class="text-center">
	<li>주문번호</li>
	<li>카테고리</li>
	<li>상품명</li>
	<li>구매자</li>
	<li>결제금액</li>
	<li>구매일</li>
	<li>반품 신청일</li>
	<li>상태</li>
	
	<li><a href="">348911231237359</a></li>
	<li>스포츠</li>
	<li>5kg 아령세트</li>
	<li>박멸치</li>
	<li>15,000원</li>
	<li>2020-11-09</li>
	<li>2020-11-10</li>
	<li>반품완료</li>
	
	<li><a href="">1453512411259</a></li>
	<li>미술</li>
	<li>드로잉세트</li>
	<li>김카소</li>
	<li>23,000원</li>
	<li>2020-11-11</li>
	<li>2020-11-13</li>
	<li>반품대기</li>
	
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