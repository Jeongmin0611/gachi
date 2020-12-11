<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<script type="text/javascript">
	$(()=>{
		$("h3").css("margin","20px 0px");
		$("#ad_goods_viewForm>li").css("height","370px");
		$("#ad_goods_viewForm>li:last-child").css("padding","20px 0px");
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
<div class="container ad_font">
<h1>상품조회</h1>
	<ul id="ad_goods_viewForm">
		<li class="text-center">
			<ul>
				<li>상품번호</li><li><input type="text" name="code" value="${vo.code }" readonly/></li>
				<li>카테고리</li><li><input type="text" name="category" value="${vo.category }" readonly/></li>
				<li>상품명</li><li><input type="text" name="goods_name" size="50" value="${vo.goods_name }" readonly/></li>
				<li>원가</li><li><input type="text" name="prime_cost" value="${vo.prime_cost }" readonly/></li>
				<li>판매가</li><li><input type="text" name="real_price" value="${vo.real_price }" readonly/></li>
				<li>재고</li><li><input type="text" name="stock" value="${vo.stock }" readonly/></li>
				<li>누적판매수 </li><li><input type="text" name="sale_count" value="${vo.sale_count }" readonly/></li>
				<li>등록일</li><li><input type="text" name="writedate" value="${vo.writedate }" readonly/></li>
				<li>상태</li><li><input type="text" name="sale_state" value="${vo.sale_state }" readonly/></li>
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
<div class="text-center">
		<button class="btn" onclick="location.href='/gachi/adminGoodsEdit'">수정</button>
		<button  class="btn" onclick="goodsDel()">삭제</button>
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
		<li><a href="#">답변하기</a></li>
	</ul>	
</div>
<div style="text-align:right">
	<button class="btn" onclick="goodsInquiryDel()">삭제</button>
</div>
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
		<li><a href="#">답변하기</a></li>
	</ul>
<div style="text-align:right">
	<button class="btn" onclick="goodsInquiryDel()">삭제</button>
</div>	
</div>