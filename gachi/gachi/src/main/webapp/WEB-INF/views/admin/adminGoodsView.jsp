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
	<div class="text-center">
			<button class="btn" onclick="location.href='/gachi/adminGoodsEdit'">수정</button>
			<button  class="btn" onclick="goodsDel()">삭제</button>
	</div>
</div>