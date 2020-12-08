<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>

<script>
$(function(){
	
	$("#startDate").val("${startDate}");
	$("#endDate").val("${endDate}");
	$('.ad_goods_searchForm').css("text-align","right").css("margin","5px 0px");
	
	$("#GoodsSelectAll").click(function(){
		if($("#GoodsSelectAll").prop("checked")){
			$("input:checkbox").prop("checked",true);
		}else{
			$("input:checkbox").prop("checked",false);
		}
	});
});
	
</script>
<style>
	#ad_goods_searchForm{
		overflow: auto;
		margin-bottom: 15px;
	}
	
</style>
<div class="container text-center ad_font">
	<div class="container ad_font text-center">
	<h1>스토어 관리</h1>
	<form action="adminGoods" method="post" id="frm">
			<div class="ad_goods_searchForm">	
			<input type="date" name="startDate" id="startDate" value=""/>~<input type="date" name="endDate" id="endDate" value=""/>
			</div>
				<div class="ad_goods_searchForm">	
					<select name="category">
						<option>전체</option>
						<option>공예/창작</option>
						<option>요리</option>
						<option>미술</option>
						<option>음악</option>
						<option>라이프스타일</option>
						<option>운동</option>
						<option>사진영상</option>
					</select>
					<select name="state">
						<option>전체</option>
						<option>판매대기</option>
						<option>판매중</option>
						<option>판매종료</option>
					</select>
					<input type="text" id="" name=""/>
					<input type="submit" class="btn" value="검색" />
				</div>
			</form>
		</div>	
	<div style="margin:5px 5px;text-align:right">
	<!-- <button class="btn" id="settleDel">선택정산</button> -->
	<button class="btn">상태변경</button>
</div>
	<ul id="ad_goods_lst">
		
		<li><input type="checkbox" id="GoodsSelectAll"/></li>
		<li>상품코드</li>
		<li>카테고리</li>
		<li>상품명</li>
		<li>원가</li>
		<li>판매가</li>
		<li>재고</li>
		<li>등록일</li>
		<li>상태</li>
		
		<c:forEach items="${data }" var="data">
		<li><input type="checkbox"/></li>
		<li>${data.code }</li>
		<li>${data.category }</li>
		<li><a href="/gachi/adminGoodsView">${data.goods_name }</a></li>
		<li>${data.prime_cost }</li>
		<li>${data.real_price } </li>
		<li>${data.stock }</li>
		<li>${data.writedate }</li>
		<li><c:if test="${data.sale_state eq '판매대기'}">판매대기</c:if><c:if test="${data.sale_state eq '판매중'}">판매중</c:if>
		<c:if test="${data.sale_state eq '판매종료'}">판매종료</c:if></li>
		</c:forEach>
	</ul>
	<div style="height:50px;">
		<button class="btn" onclick="location.href='/gachi/adminGoodsWrite'">상품등록</button>	
	</div>
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