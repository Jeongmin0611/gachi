<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container ad_font">
<h1>배송관리</h1>
<div id="ad_search_header">
<div>
	<ul id="ad_delivery_info">
		<li>●배송대기 : 5개</li>
		<li>●배송중 : 10개</li>
		<li>●배송완료 : 90개</li>
	</ul>
</div>
<div>
	<form action="">
		<select name="#">
			<option>전체</option>
			<option>상품명</option>
			<option>구매자명</option>
		</select>
		<select name="#">
			<option>전체</option>
			<option>배송대기</option>
			<option>배송중</option>
			<option>배송완료</option>
			
		</select>
		<input type="text" id="" name=""/>
		<input type="submit" class="btn" value="검색" />
		</form>
</div>
</div>
<ul id="ad_delivery_lst" class="text-center">
	<li>번호</li>
	<li>카테고리</li>
	<li>상품번호</li>
	<li>상품명</li>
	<li>구매자</li>
	<li>구매상태</li>
	<li>운송장번호</li>
	<li>배송상태</li>
	
	<li>041</li>
	<li>창작/공예</li>
	<li>S5124123</li>
	<li>공예,비즈용품</li>
	<li>박구매</li>
	<li>결제완료</li>
	<li><a href="#">15-12352-1234</a></li>
	<li><a href="#">배송완료</a></li>
	
	<li>030</li>
	<li>미술</li>
	<li>S5623123</li>
	<li>드로잉용품</li>
	<li>김구매</li>
	<li>결제대기</li>
	<li><a href="#">운송장번호 입력하기</a></li>
	<li><a href="#">배송대기</a></li>
</ul>	
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