<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#ad_settle_board_ul>li {
	float: left;
	width: 20%;
	text-align: center;
	margin-left: 100px;
}

.ad_settle_board {
	border: 2px solid #437299;
	border-radius: 10px;
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
		$(".ad_settle_searchForm").css("text-align","right").css("margin","5px 0px");
	
		//전체체크
		$("#settleSelectAll").click(function(){
			if($("#settleSelectAll").prop("checked")){
				$("input:checkbox").prop("checked",true);
			}else{
				$("input:checkbox").prop("checked",false);
			}
		});
		
		$("#cntSalesAll").text("￦ " + numberWithCommas("${cntAllSales}"));
		$("#cntSalesN").text("￦ " + numberWithCommas("${cntSalesN}"));
		$("#cntSalesY").text("￦ " + numberWithCommas("${cntSalesY}"));
		
		$("#frm").click(function(){
			var url = "/adminSettle";
			var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&category=" + $('#category').val() + "&username=" + $('#username').val().trim();
			$.ajax({
				url : url,
				data : data,
				success: function(data){
				/* 	$("#startMonth").append("${startMonth}");
					$("#endMonth").append("${endMonth}"); */
					
				},error:function(){
					console.log("ajax에러발생");
				}
			});
		});
/* 		$("#settle_btn").click(function(){
			if(confirm("정산 하시겠습니까?")){
				$("#settlement").val('정산완료');
			}else{
				return false;	
		});	 */
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function postPageMove(now) {
		console.log(now);
		return false;
		var url = "/adminSettle";
		var data = "category=" + $("#category").val() + "&username=" + $("#username").val().trim(); + "&now=" + now;
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
		<h1>크리에이터 정산관리</h1>
		<form action="adminSettle" method="post" id="frm">
			<div class="ad_settle_searchForm">

				<input type="date" name="startDate" id="startDate" value="" />~<input
					type="date" name="endDate" id="endDate" value="" />
			</div>
			<div class="ad_settle_searchForm">
				<select id="category" name="category">
					<option value="">전체</option>
					<option value="공예/창작">공예/창작</option>
					<option value="요리">요리</option>
					<option value="미술">미술</option>
					<option value="음악">음악</option>
					<option value="라이프스타일">라이프스타일</option>
					<option value="운동">운동</option>
					<option value="사진/영상">사진/영상</option>
				</select> <input type="text" name="username" id="username"
					placeholder="크리에이터명" size="40" /> <input type="submit" class="btn"
					value="검색" />
			</div>

			<!-- 		<div class="text-center textSize">
			<input type="radio" name="" checked/>전체
			<input type="radio" name=""/>스토어
			<input type="radio" name=""/>크리에이터<br/>
		</div> -->
			<ul id="ad_settle_board_ul">
				<li><div class="ad_settle_board">
						<b>총 매출 금액</b><br /> <span
							style="font-size: 50px; line-height: 100px" id="cntSalesAll"></span>
					</div></li>
				<li><div class="ad_settle_board">
						<b>미정산 금액</b><br /> <span
							style="font-size: 50px; line-height: 100px" id="cntSalesN"></span>
					</div></li>
				<li><div class="ad_settle_board">
						<b>정산 금액</b><br /> <span
							style="font-size: 50px; line-height: 120px" id="cntSalesY"></span>
					</div></li>
			</ul>
		</form>
	</div>

	<form id="settle" action="adminSettleEditOk" method="post">
		<div style="margin: 5px 5px; text-align: right">
			<button class="btn" id="settle_btn" type="submit">정산</button>
		</div>
		<div>
			<ul id="ad_settle_lst">

				<li><input type="checkbox" id="settleSelectAll" /></li>
				<li>주문코드</li>
				<li>카테고리</li>
				<li>클래스명</li>
				<li>크리에이터아이디</li>
				<li>크리에이터명</li>
				<li>정산예정금액</li>
				<!-- <li>지급금액</li> -->
				<li>지급일</li>
				<li>정산상태</li>

				<c:forEach items="${data }" var="data">
					<li><c:if
							test="${data.settlement eq 'n' or data.settlement eq 'N'}">
							<input type="checkbox" name="chk_${data.class_order_code }" />
						</c:if></li>
					<li>${data.order_code}</li>
					<li>${data.category }</li>
					<li class="wordCut">${data.class_name }</li>
					<li>${data.userid}</li>
					<li>${data.username}</li>
					<li>${data.real_price }</li>
					<!-- <li>0</li> -->
					<li><c:if test="${data.payday eq null}"></c:if>
						<c:if test="${data.payday ne null }">${data.payday }</c:if></li>
					<li id="settlement"><c:if
							test="${data.settlement eq 'n' or data.settlement eq 'N'}">정산대기</c:if>
						<c:if test="${data.settlement eq 'y' or data.settlement eq 'Y'}">정산완료</c:if></li>
					<input type="hidden" name="code_${data.class_order_code }"
						value="${data.class_order_code }" />
					<input type="hidden" name="userid_${data.class_order_code }"
						value="${data.userid }" />
					<input type="hidden" name="price_${data.class_order_code }"
						value="${data.real_price }" />
				</c:forEach>
			</ul>
	</form>
</div>
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
						<a class="btn" href="/gachi/adminSettle?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${startPage+i <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminSettle?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminSettle?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${method eq 'post' }">
				<c:if test="${startPage ne 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminSettle?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${startPage+i <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminSettle?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminSettle?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			
	</ul>
</div>
</div>