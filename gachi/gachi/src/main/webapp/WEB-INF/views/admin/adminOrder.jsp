<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<script>
$(function(){
	
	$("#startDate").val("${startDate}");
	$("#endDate").val("${endDate}");
	$("#search").val("${search}");
	$("#state").val("${state}").attr("selected", "selected");
	$("#payment_type").val("${payment_type}").attr("selected", "selected");
	
	
	$('input:radio[name=payment_type]').is(':checked');
	
	$('.ad_goods_searchForm').css("text-align","right").css("margin","5px 0px");
	
	$("#frm_submit").click(function(){
		var url = "/adminOrder";
		var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&state=" + $("#state").val() + "&payment_type=" + $("#payment_type").val()+ "&search=" + $("#search").val().trim(); + "&now=" + now +1;
		$.ajax({
			url : url,
			data : data,
			type : "POST",
			dataType : "json",
			success: function(data){
				var result = data.result;
				console.log(result);
			},error:function(){
				var result = data.result;
				console.log(result);
			}
		});
		
	});
	
});
	function postPageMove(now) {
	console.log(now);
	return false;
	var url = "/adminOrder";
	var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&state=" + $("#state").val() + "&payment_type=" + $("#payment_type").val()+"&search=" + $("#search").val().trim(); + "&now=" + now;
	$.ajax({
		url : url,
		data : data,
		type : "POST",
		dataType : "json",
		success: function(data){
			var result = data.result;
			console.log(result);
		},error:function(){
			var result = data.result;
			console.log(result);
		}
	});
}
</script>

<div class="container ad_font">
<h1>주문조회</h1>
<div id="ad_order_Area">
<form method="post" action="adminOrder">
	<ul id="ad_order_searchForm">
		<li>주문검색</li>
		<li>
			<select name="state" >
				<option value="">전체</option>
				<option value="결제완료">결제완료</option>
				<option value="배송준비">배송준비</option>
				<option value="배송중">배송중</option>
				<option value="배송완료">배송완료</option>
			</select>
			<input type="text" name="search" id="search" size="40" value="" placeholder ="주문번호,구매자명,구매자아이디 검색"/>		
		</li>
		<li>주문기간</li>
		<li>
		<input type="date" name="startDate" id="startDate" value=""/>~<input type="date" name="endDate" id="endDate" value=""/>
		</li>
		<li>결제수단</li>
		<li>
			<input type="radio" name="payment_type" value="" checked/>전체
			<input type="radio" name="payment_type" value="무통장입금"/>무통장입금
			<input type="radio" name="payment_type" value="카드"/>카드
			<input type="radio" name="payment_type" value="네이버페이"/>네이버페이
			<input type="radio" name="payment_type" value="카카오페이"/>카카오페이
			<input type="radio" name="payment_type" value="페이코"/>페이코
			<input type="radio" name="payment_type" value="삼성페이"/>삼성페이
		</li>
		<!-- <li>주문상태</li>
		<li>
			<input type="radio" name="stateRadio" value="" checked/>전체
			<input type="radio" name="stateRadio" value="입금대기"/>입금대기
			<input type="radio" name="stateRadio" value="결제완료"/>결제완료
			<input type="radio" name="stateRadio" value="배송준비"/>배송준비
			<input type="radio" name="stateRadio" value="배송중"/>배송중
			<input type="radio" name="stateRadio" value="배송완료"/>배송완료
			<input type="radio" name="stateRadio" value="구매확정"/>구매확정
		</li> -->
	</ul>
	<div style="text-align:center">
		<input type="submit" class="btn" id= "frm_submit" value="검색">
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
	
	<c:forEach items="${result }" var="result">
	<li>${result.order_code }</li>
	<li>${result.userid }</li>
	<li>${result.username }</li>
	<li><fmt:formatNumber value="${result.price }" pattern="#,###"/>원</li>
	<li>${result.payment_type }</li>
	<li>${result.card_type }</li>
	<li>${result.orderdate }</li>
	<li>${result.state }</li>
	<li><c:if test="${result.fix_state eq 'n' or result.fix_state eq 'N'}">미확정</c:if><c:if test="${result.fix_state eq 'y' or result.fix_state eq 'Y'}">구매확정</c:if></li>
	</c:forEach>
</ul>	
	<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<c:if test="${nowPage % 5 eq 0}">
				<c:set var="startPage" value="${nowPage-4 }"/>
			</c:if>
			<c:if test="${nowPage % 5 ne 0}">
				<fmt:parseNumber var="startPage" integerOnly="true" value="${(nowPage/5)*5}"/>
			</c:if>
			
			<c:if test="${method eq 'get' }">
				<c:if test="${startPage ne 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminOrder?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${startPage+i <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminOrder?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminOrder?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${method eq 'post' }">
				<c:if test="${startPage ne 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminOrder?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${startPage+i <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminOrder?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminOrder?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			
	</ul>
</div>
</div>