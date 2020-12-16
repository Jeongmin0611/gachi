<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>

 <style>
#search_area {
	margin:20px 0px;
}
#ad_event_lst{
	overflow: auto;
	border:3px solid #437299;
	border-radius: 10px;
	over-flow:hidden;
}
#ad_event_lst li {
	vertical-align: middle;
	border-bottom:1px solid gray;
	over-flow:hidden;
}
#ad_event_header{
	overflow:auto;
}
select {
	height: 30px;
}
</style> 
<script type="text/javascript">
/* 	$(()=>{
		$("#ad_event_lst li:lt(5)").css("height","40px").css("line-height","40px").css("overflow","visible");
	}); */
	$(function(){
		
		$("#startDate").val("${startDate}");
		$("#endDate").val("${endDate}");
		$("#search").val("${search}");
		$('.ad_event_searchForm').css("text-align","right").css("margin","5px 0px");
		
		$("#frm_submit").click(function(){
			var url = "/adminEvent";
			var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&search=" + $("#search").val().trim(); + "&now=" + now +1;
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
		var url = "/adminEvent";
		var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&search=" + $("#search").val().trim(); + "&now=" + now;
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
<div class="container text-center ad_font">
<h1>이벤트관리</h1>
<div id="search_area">
	<form method="post" action="adminEvent">
		<ul class="ad_list_menu">
			<li>
			<input type="date" name="startDate" id="startDate" value=""/>~<input type="date" name="endDate" id="endDate" value=""/>
			</li>
			<li>
				<input type="text" id="search" name="search" size="30"/>
				<input type="submit" class="btn" id="frm_submit" value="검색"/>
			</li>
			
		</ul>
	</form>
</div>
<ul id="ad_event_lst">
	<li>번호</li>
	<li>제목</li>
	<li>작성일</li>
	<li>시작일</li>
	<li>종료일</li>
	<c:forEach var="list" items="${list }">
	<li>${list.event_num }</li>
	<li class="wordCut"><a href="/gachi/adminEventView?event_num=${list.event_num }">${list.subject }</a></li>
	<li>${list.writedate }</li>
	<li>${list.startdate }</li>
	<li>${list.enddate }</li>
	</c:forEach>
</ul>
<div class="ad_list_menu">
	<button class="btn" onclick="location.href='/gachi/adminEventWrite'">글쓰기</button>
	<button class="btn">삭제</button> 
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
						<a class="btn" href="/gachi/adminEvent?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${startPage+i <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminEvent?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminEvent?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${method eq 'post' }">
				<c:if test="${startPage ne 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminEvent?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${startPage+i <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminEvent?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminEvent?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>		
	</ul>
</div>
</div>