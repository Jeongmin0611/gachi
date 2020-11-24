<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container ad_font">
<h1>주문조회</h1>
<form method="post" action="#">
<ul id="ad_order_View">
	<li>주문번호</li><li>1234567891234</li>
	<li>카테고리</li><li>미술</li>
	<li>클래스명</li><li>밥선생님의 낙서 참쉽죠? 클래스</li>
	<li>상품명</li><li>미술 div키트</li>
	<li>구매자아이디</li><li>honggildong@naver.com</li>
	<li>가격</li><li>15000원</li>
	<li>수량</li><li>1개</li>
	<li>사용 마일리지</li><li>150원</li>
	<li>반품사유</li><li style="height:100px"><textarea style="width:100%;height:100px">잘못주문함</textarea></li>
	<li>구매일</li><li>2020-08-01</li>
	<li>반품신청일</li><li>2020-08-04</li>
	<li>상태</li>
	<li>
		<select>
			<option>반품대기</option>
			<option>반품완료</option>
		</select>
	</li>
</ul>
<div style="margin-top:20px" class="content_center">
<input type="submit" class="btn" value="저장하기">
</div>
</form>
</div>