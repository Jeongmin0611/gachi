<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<div class="container text-center ad_font">
<h1>스토어 관리</h1>
	<div id="ad_goods_writeForm">
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
		<input type="submit" class="btn" value="검색" />
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
	<div style="height:50px;">
		<button class="btn" onclick="location.href='/gachi/adminGoodsWrite'">상품등록</button>	
	</div>
<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<li class="btn"><a class="btn" href="#">Prev</a></li>
			<li><a href="#" class="paging_num">1</a></li>
			<li><a href="#" class="paging_num">2</a></li>
			<li><a href="#" class="paging_num">3</a></li>
			<li><a href="#" class="paging_num">4</a></li>
			<li><a href="#" class="paging_num">5</a></li>
			<li class="btn"><a class="btn" href="#">Next</a></li>
	</ul>
</div>
</div>