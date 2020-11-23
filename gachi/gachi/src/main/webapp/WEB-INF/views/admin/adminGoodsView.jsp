<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<script type="text/javascript">
	$(function(){
		$("#ad_goods_inquiry>li:lt(7)").css("border","1px solid #F4BFA9");
		$("#ad_goods_review>li:lt(8)").css("border","1px solid #F4BFA9");
	});
	function goodsInquiryDel(){
		if(confirm("해당 문의를 삭제하시겠습니까?")){
			
		}
	}
	function goodsDel(){
		if(confirm("해당 상품을 삭제하시겠습니까?")){
			
		}
	}
</script>
<div class="container cfont">
<h1>상품조회</h1>
<ul id="ad_goods_viewForm">
	<li class="text-center">
		<ul>
			<li>번호 001</li>
			<li>카테고리 공예창작</li>
			<li>상품명 곰돌이 인형div</li>
			<li>원가 10000원</li>
			<li>판매가 10000원</li>
			<li>재고 1000개</li>
			<li>누적판매수 50개</li>
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
<h3>상품상세정보</h3>
<div id="ad_goods_info">

</div>
<h3>상품문의</h3>
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
		<li>재입고는 언제쯤인가요?</li>
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