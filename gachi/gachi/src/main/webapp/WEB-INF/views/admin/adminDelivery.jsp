<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$(function(){
	
	$('.container>div:nth-of-type(2)').css("margin-bottom","10px");

	console.log('${method}');
	if('${state}' != '') {
		$("#state").val("${state}");
	} else{
		$("#state").val('');
	}
	if('${search}' != '') {
		$("#search").val("${search}");
	}
	$("#frm_submit").click(function(){
		var url = "/adminDelivery";
		var data = "state=" + $("#state").val() + "&search=" + $("#search").val().trim(); + "&now=" + 1;
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
	var url = "/adminDelivery";
	var data = "state=" + $("#state").val() + "&search=" + $("#search").val().trim(); + "&now=" + now;
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
<h1>배송관리</h1>
	<div id="ad_search_header">
		<div>

		</div>
		<div>
		<form form action="adminDelivery" method="post" id="frm">
			<ul id="ad_delivery_info">
				<li>●결제완료 : ${countdeposit } 건</li>
				<li>●배송준비 : ${countWaitDelivery } 건</li>
				<li>●배송중 : ${countDelivery } 건</li>
				<li>●배송완료 : ${countEndDelivery } 건</li>
			</ul>
		<!--  <input type="date" name="startDate" id="startDate" value=""/>~<input type="date" name="endDate" id="endDate" value=""/> <br/> -->
			<select name="state">
				<option value="">전체</option>
				<option value="결제완료">결제완료</option>
				<option value="배송준비">배송준비</option>
				<option value="배송중">배송중</option>
				<option value="배송완료">배송완료</option>
				
			</select>
			<input type="text" id="search" name="search"/>
			<input type="submit" class="btn" id="frm_submit" value="검색" />
			</form>
		</div>
	</div>
	
			<ul id="ad_delivery_lst" class="text-center">
				
				<li>번호</li>
				<li>카테고리</li>
				<li>상품번호</li>
				<li>상품명</li>
				<li>구매자</li>
				<li>운송장번호</li>
				<li>구매일</li>
				<li>배송상태</li>
				
			<c:forEach var="deliveryList" items="${deliveryList }">
				<li>${deliveryList.rownum }</li>
				<li>${deliveryList.category }</li>
				<li><a href="/gachi/adminDeliveryView?code=${deliveryList.code}">${deliveryList.code }</a></li>
				<li class="wordCut">${deliveryList.goods_name }</li>
				<li>${deliveryList.username }</li>
				<li>${deliveryList.delivery }</li>
				<li>${deliveryList.orderdate }</li>
				<li><c:if test="${deliveryList.state eq '결제완료'}">결제완료</c:if>
				<c:if test="${deliveryList.state eq '배송중'}">배송중</c:if>
				<c:if test="${deliveryList.state eq '배송준비'}">배송준비</c:if>
				<c:if test="${deliveryList.state eq '배송완료'}">배송완료</c:if>
				</li>
			</c:forEach>
				
			</ul>
				
	<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<c:if test="${method eq 'get' }">
				<c:if test="${nowPage > 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminDelivery?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="1" end="${lastPage}">
					<li class="btn">
						<a class="btn" href="/gachi/adminDelivery?now=${i }">${i }</a>
					</li>
				</c:forEach>
				<c:if test="${nowPage < lastPage}">
					<li class="btn">
						<a class="btn" href="/gachi/adminDelivery?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${method eq 'post' }">
				<c:if test="${nowPage > 1}">
					<li class="btn">
						<a class="btn" href="javascript:void(0);" onClick="postPageMove(${nowPage+1});">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="1" end="${lastPage}">
					<li class="btn">
						<a class="btn" href="javascript:void(0);" onClick="postPageMove(${i });">${i }</a>
					</li>
				</c:forEach>
				<c:if test="${nowPage < lastPage}">
					<li class="btn">
						<a class="btn" href="javascript:void(0);" onClick="postPageMove(${nowPage}-1);">Next</a>
					</li>
				</c:if>
			</c:if>
			
	</ul>
</div>
</div>