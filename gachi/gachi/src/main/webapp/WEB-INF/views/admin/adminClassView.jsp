<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container cfont">
	<h1>클래스 조회</h1>
<ul id="ad_goods_viewForm">
	<li class="text-center">
		<ul>
			<li>클래스코드 cla001</li>
			<li>카테고리 공예/창작</li>
			<li>상품명 곰돌이 인형만들기</li>
			<li>난이도 초급</li>
			<li>수업차시 12강</li>
			<li>수강시간 3시간</li>
			<li>가격 100,000원</li>
			<li>좋아요 999개</li>
			<li>등록일 2020-08-12</li>
			<li>상태 판매중</li>
		</ul>
	</li>
	<li class="text-center">
		대표이미지<br/>
		<img src="/gachi/img/147.jpg"/>
	</li>
</ul>
<div>
<h3>클래스 상세정보</h3>
<div id="ad_goods_info">

</div>
<h3>질문답변</h3>
	<ul id="ad_goods_inquiry" class="text-center">
		<li>선택</li>
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		<li>답변여부</li>
		
		<li><input type="checkbox"/></li>
		<li>10</li>
		<li>난이도는 어느정도인가요?</li>
		<li>홍길동</li>
		<li>2020-10-29</li>
		<li>224</li>
		<li><button>답변</button></li>
	</ul>	
</div>
<button class="ad_right_align" onclick="goodsInquiryDel()">삭제</button>
<h3>상품리뷰</h3>
	<ul id="ad_goods_review" class="text-center">
		<li>선택</li>
		<li>번호</li>
		<li>제목</li>
		<li>평점</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		<li>답변여부</li>
		
		<li><input type="checkbox"/></li>
		<li>10</li>
		<li>재입고는 언제쯤인가요?</li>
		<li>★★★★</li>
		<li>홍길동</li>
		<li>2020-10-29</li>
		<li>224</li>
		<li><button>답변</button></li>
	
	</ul>	
<button class="ad_right_align" onclick="goodsInquiryDel()">삭제</button>
<div class="text-center">
		<button onclick="location.href='/gachi/adminGoodsEdit'">수정</button>
		<button onclick="goodsDel()">삭제</button>
</div>
</div>