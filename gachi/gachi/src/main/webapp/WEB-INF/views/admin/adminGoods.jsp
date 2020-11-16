<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<div class="container text-center">
<h1>스토어 관리</h1>
	<div class="ad_right_align">
	<form action="">
		<select name="category">
			<option>공예/창작</option>
			<option>요리</option>
			<option>미술</option>
			<option>음악</option>
			<option>라이프스타일</option>
			<option>운동</option>
			<option>사진영상</option>
		</select>
		<select name="state">
			<option>판매대기</option>
			<option>판매중</option>
			<option>판매종료</option>
		</select>
		<input type="text" id="" name=""/>
		<input type="submit" value="검색" />
		</form>
	</div>
	<ul id="ad_goods_lst">
		<li>상품코드</li>
		<li>카테고리</li>
		<li>상품명</li>
		<li>원가</li>
		<li>판매가</li>
		<li>재고</li>
		<li>등록일</li>
		<li>상태</li>
		
		<li>goods1</li>
		<li>공예/창작</li>
		<li><a href="/gachi/adminGoodsView">곰돌이 인형 div</a></li>
		<li>10000</li>
		<li>15000 </li>
		<li>1000</li>
		<li>2020-08-12</li>
		<li>판매중</li>
	</ul>
<button onclick="location.href='/gachi/adminGoodsWrite'">상품등록</button>
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