<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<script>
$(function(){
	
	$("#startDate").val("${startDate}");
	$("#endDate").val("${endDate}");
	$('.ad_order_searchForm').css("text-align","right").css("margin","5px 0px");
	
	$("#OrderSelectAll").click(function(){
		if($("#OrderSelectAll").prop("checked")){
			$("input:checkbox").prop("checked",true);
		}else{
			$("input:checkbox").prop("checked",false);
		}
	});
});
	
</script>



<div class="container ad_font">
<h1>주문조회</h1>
<div id="ad_order_Area">
<form method="post" action="">
	<ul id="ad_order_searchForm">
		<li>주문검색</li>
		<li>
			<select>
				<option>주문번호</option>
				<option>상품코드</option>
				<option>구매자닉네임</option>
			</select>
			<input type="text"/>		
		</li>
		<li>주문기간</li>
		<li>
			<select>
				<option>주문일</option>
			</select>
			 <button class="btn">오늘</button>
			 <button class="btn">어제</button>
			 <button class="btn">3일</button>
			 <button class="btn">1주일</button>
			 <button class="btn">15일</button>
			 <button class="btn">1개월</button>
			 <button class="btn">3개월</button>
			 <button class="btn">6개월</button>
			 <input type="date" name="startDate" id="startDate" value=""/>~<input type="date" name="endDate" id="endDate" value=""/>
		</li>
		<li>결제수단</li>
		<li>
			<input type="checkbox" name="" value="" checked/>전체
			<input type="checkbox" name="" value=""/>무통장입금
			<input type="checkbox" name="" value=""/>카드결제
			<input type="checkbox" name="" value=""/>네이버페이
			<input type="checkbox" name="" value=""/>카카오페이
			<input type="checkbox" name="" value=""/>페이코
			<input type="checkbox" name="" value=""/>삼성페이
		</li>
		<li>주문상태</li>
		<li>
			<input type="radio" name="" checked/>전체
			<input type="radio" name=""/>입금대기
			<input type="radio" name=""/>입금완료
			<input type="radio" name=""/>배송준비
			<input type="radio" name=""/>배송중
			<input type="radio" name=""/>배송완료
			<input type="radio" name=""/>주문확정
		</li>
	</ul>
	<div style="text-align:center">
		<input type="submit" class="btn" value="검색">
		<input type="reset" class="btn" value="초기화">
	</div>
</form>
</div>
<ul id="ad_order_lst" class="text-center">
	<li>주문번호</li>
	<li>회원아이디</li>
	<li>구매자</li>
	<li>결제금액</li>
	<li>결제수단</li>
	<li>결제카드</li>
	<li>결제일</li>
	<li>주문상태</li>
	<li>구매확정여부</li>
	
	<c:forEach items="${data }" var="data">
	<li>${data.order_code }</li>
	<li>${data.userid }</li>
	<li>${data.username }</li>
	<li>${data.price }</li>
	<li>${data.payment_type }</li>
	<li>${data.card_type }</li>
	<li>${data.orderdate }</li>
	<li>${data.state }</li>
	<li><c:if test="${data.fix_state eq 'n' or data.fix_state eq 'N'}">미확정</c:if><c:if test="${data.fix_state eq 'y' or data.fix_state eq 'Y'}">구매확정</c:if></li>
	</c:forEach>
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