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
	
	$("#frm_submit").click(function(){
		var url = "/adminGoods";
		var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&category=" + $("#category").val() + "&sale_State=" + $("#sale_State").val()+ "&search=" + $("#search").val().trim(); + "&now=" + now +1;
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
	var url = "/adminGoods";
	var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&category=" + $("#category").val() + "&sale_State=" + $("#sale_State").val()+ "&search=" + $("#search").val().trim(); + "&now=" + now;
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
						<option value="전체">전체</option>
						<option value="공예/창작">공예/창작</option>
						<option value="요리">요리</option>
						<option value="미술">미술</option>
						<option value="음악">음악</option>
						<option value="라이프스타일">라이프스타일</option>
						<option value="운동">운동</option>
						<option value="사진영상">사진영상</option>
					</select>
					<select name="sale_State">
						<option value="전체">전체</option>
						<option value="판매대기">판매대기</option>
						<option value="판매중">판매중</option>
						<option value="판매종료">판매종료</option>
					</select>
					<input type="text" id="search" name="search"/>
					<input type="hidden" id="now" value="${nowPage }"/>
					<input type="submit" id="frm_submit" class="btn" value="검색" />
				</div>
			</form>
		</div>	

	<ul id="ad_goods_lst">
		
		<li>상품코드</li>
		<li>카테고리</li>
		<li>상품명</li>
		<li>원가</li>
		<li>판매가</li>
		<li>재고</li>
		<li>등록일</li>
		<li>상태</li>
		
		<c:forEach items="${list }" var="list">
		<li>${list.code }</li>
		<li>${list.category }</li>
		<li class="wordCut"><a href="/gachi/adminGoodsEdit?code=${list.code}">${list.goods_name }</a></li>
		<li>${list.prime_cost }</li>
		<li>${list.real_price } </li>
		<li>${list.stock }</li>
		<li>${list.writedate }</li>
		<li><c:if test="${list.sale_state eq '판매대기'}">판매대기</c:if><c:if test="${list.sale_state eq '판매중'}">판매중</c:if>
		<c:if test="${list.sale_state eq '판매종료'}">판매종료</c:if></li>
		</c:forEach>
	</ul>
	<div style="height:50px;">
		<button class="btn" onclick="location.href='/gachi/adminGoodsWrite'">상품등록</button>	
	</div>
</div>	
	<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<c:if test="${method eq 'get' }">
				<c:if test="${nowPage > 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminGoods?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="1" end="${lastPage}">
					<li class="btn">
						<a class="btn" href="/gachi/adminGoods?now=${i }">${i }</a>
					</li>
				</c:forEach>
				<c:if test="${nowPage < lastPage}">
					<li class="btn">
						<a class="btn" href="/gachi/adminGoods?now=${nowPage+1}">Next</a>
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