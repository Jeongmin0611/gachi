<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	h3{
		margin:20px 0px;
	}
	#ad_member_View input[type="text"]{
		line-height:0px;
	}
</style>
<script>
function onlyNumber(){

    if((event.keyCode<48)||(event.keyCode>57))

       event.returnValue=false;
}
</script>
<div class="container ad_font">
	<h1>배송조회</h1>
<form action="adminDeliveryEditOk" method="post">	
	<ul id="ad_member_View" style="overflow:hidden;">
		<li>상품번호</li><li><input type="text" name="order_code" value="${list.order_code }" readonly/></li>
		<li>상품번호</li><li><input type="text" name="code" value="${list.code }" readonly/></li>
		<li>카테고리</li><li><input type="text" name="category" value="${list.category }" readonly/></li>
		<li class="wordCut">상품명</li><li><input type="text" name="goods_name" value="${list.goods_name }" size="60" readonly /></li>
		<li>구매자</li><li><input type="text" name="username" value="${list.username }"readonly/></li>
		<li>연락처</li><li><input type="text" name="tel" value="${list.tel }"readonly/></li>
		<li>구매일</li><li><input type="text" name="orderdate" value="${list.orderdate }"readonly/></li>
		<li>운송장번호</li><li><input type="text" name="delivery" value="${list.delivery }" onkeypress="onlyNumber();" placeholder="번호만 입력하세요"/></li>
		<li>배송상태</li>
			<li>
				<select id="state" name="state">
					<option value="결제완료" 
						<c:if test="${list.state eq '결제완료'}"> selected</c:if>>결제완료</option>
					<option value="배송준비" 
						<c:if test="${list.state eq '배송준비'}"> selected</c:if>>배송준비</option>
					<option value="배송중" 
						<c:if test="${list.state eq '배송중'}"> selected</c:if>>배송중</option>
					<option value="배송완료" 
						<c:if test="${list.state eq '배송완료'}"> selected</c:if>>배송완료</option>
				</select>
			</li> 
	</ul>
		<div style="margin:10px 0px; float : right;">
		<button type="button" class="btn" onclick="location.href='/gachi/adminDelivery'">목록</button>
			<input type="submit" class="btn" value="배송정보수정"/>		
		</div>s
	</form>	
</div>