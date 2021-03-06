<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
#ad_paymentStore_board_ul>li {
	float: left;
	width: 20%;
	text-align: center;
	margin-left: 100px;
}

.ad_paymentStore_board {
	border: 2px solid #437299;
	border-radius:10px;
	width: 300px;
	height: 150px;
	padding: 10px;
	margin-top: 50px;
}
</style>

<script type="text/javascript">
	$(function(){
		
		$("#startDate").val("${startDate}");
		$("#endDate").val("${endDate}");
		if('${category}' != '') {
			$("#category").val("${category}");
		} else{
			$("#category").val('');
		}
		if('${username}' != '') {
			$("#username").val("${username}");
		}
		$(".ad_payment_searchForm").css("text-align","right").css("margin","5px 0px");
	
		//전체체크
		$("#paymentStoreSelectAll").click(function(){
			if($("#paymentStoreSelectAll").prop("checked")){
				$("input:checkbox").prop("checked",true);
			}else{
				$("input:checkbox").prop("checked",false);
			}
		});
		
		$("#cntAllPayment").text("￦ " + numberWithCommas("${cntAllPayment}"));
		$("#cntPaymentN").text("￦ " + numberWithCommas("${cntPaymentN}"));
		$("#cntPaymentY").text(numberWithCommas("${cntPaymentY}"));
		
	/* 	//선택상품삭제
		$("#settleDel").click(function(){
			
		}); */
		$("#frm_submit").click(function(){
			var url = "/adminPaymentStore";
			var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&category=" + $('#category').val() + "&username=" + $('#username').val().trim(); + "&now=" + 1;
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
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function postPageMove(now) {
		console.log(now);
		return false;
		var url = "/adminPaymentStore";
		var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&category=" + $('#category').val() + "&username=" + $('#username').val().trim(); + "&now=" + now;
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
	<div class="container ad_font">
	<h1>스토어 결제 상세관리</h1>
		<form action="adminPaymentStore" method="post" id="frm">
		<div class="ad_payment_searchForm">
			
			<input type="date" name="startDate" id="startDate" value=""/>~<input type="date" name="endDate" id="endDate" value=""/>
		</div>
		<div class="ad_payment_searchForm">
			<select id="category" name="category">
				<option value="">전체</option>
				<option value="공예/창작">공예/창작</option>
				<option value="요리">요리</option>
				<option value="미술">미술</option>
				<option value="음악">음악</option>
				<option value="라이프스타일">라이프스타일</option>
				<option value="운동">운동</option>
				<option value="사진/영상">사진/영상</option>
			</select>
			<input type="text" name="username" id="username" placeholder="회원명" size="40"/>
			<input type="hidden" id="now" value="${nowPage }"/>
			<input type="submit" id="frm_submit" class="btn" value="검색"/> 
		</div>
		
<!-- 		<div class="text-center textSize">
			<input type="radio" name="" checked/>전체
			<input type="radio" name=""/>스토어
			<input type="radio" name=""/>크리에이터<br/>
		</div> -->
			<ul id="ad_paymentStore_board_ul">
				<li><div class="ad_paymentStore_board">
							<b>총 매출 금액</b><br/>
							<span style="font-size:50px;line-height:100px" id="cntAllPayment"></span>
						</div></li>
				<li><div class="ad_paymentStore_board">
							<b>미확정 금액</b><br/>
							<span style="font-size:50px;line-height:100px" id="cntPaymentN"></span>
						</div></li>
				<li><div class="ad_paymentStore_board">
							<b>구매 횟수</b><br/>
							<span style="font-size:50px;line-height:120px" id="cntPaymentY"></span>
					</div></li>							
			</ul>
		</form>
</div>
	<form id="storeEdit" action="adminStoreEditOk" method="post">
		<div style="margin:5px 0px;text-align:right">
			<!-- <button class="btn" id="settleDel">선택정산</button> -->
			<button type="submit" class="btn">구매확정</button>
		</div>
<div>
	<ul id="ad_paymentStore_lst">
		
		<li><input type="checkbox" id="paymentStoreSelectAll"/></li>
		<li>주문코드</li>
		<li>카테고리</li>
		<li>상품명</li>
		<li>구매자아이디</li>
		<li>구매자이름</li>
		<li>구매금액</li>
		<!-- <li>지급금액</li> -->
		<li>구매일</li>
		<li>결제상태</li>
		
		<c:forEach items="${data }" var="data">
		<li><c:if test="${data.finished eq '미확정' }"><input type="checkbox" name="chk_${data.goods_order_code }"/></c:if></li>
		<li>${data.order_code}</li>
		<li>${data.category } </li>
		<li class="wordCut">${data.goods_name}</li>
		<li>${data.userid}</li>
		<li>${data.username}</li>
		<li><fmt:formatNumber value="${data.real_price }" pattern="#,###"/>원</li>
		<!-- <li>0</li> -->
		<li>${data.orderdate}</li>
		<li><c:if test="${data.finished eq '미확정'}">미확정</c:if><c:if test="${data.finished eq '확정'}">구매확정</c:if></li>
		<input type="hidden" name="code_${data.goods_order_code }" value="${data.goods_order_code }" />
		</c:forEach>
	</ul>
	</form>
</div>
	<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">

			<c:if test="${(nowPage % 5) eq 0}">
				<c:set var="startPage" value="${nowPage-4 }"/>
			</c:if>
			<c:if test="${(nowPage % 5) ne 0}">
				<fmt:parseNumber var="tmp" integerOnly="true" value="${nowPage/5}"/>
				<fmt:parseNumber var="startPage" integerOnly="true" value="${tmp*5+1}"/>
			</c:if>
			
			<c:if test="${method eq 'get' }">
				<c:if test="${startPage ne 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminPaymentStore?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(startPage+i) <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminPaymentStore?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminPaymentStore?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${method eq 'post' }">
				<c:if test="${startPage ne 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminPaymentStore?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(startPage+i) <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminPaymentStore?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminPaymentStore?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
	</ul>
</div>
</div>