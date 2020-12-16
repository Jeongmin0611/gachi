<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#ad_video_lstArea li{
		float:left;
		width:10%;
		height:40px;
		line-height:40px;
		border-bottom:1px solid gray;
		text-align:center;
	}
	#ad_video_lstArea li:nth-child(8n+4),#ad_video_lstArea li:nth-child(8n+5){
		width:20%;
	}
</style>

<script>
$(function(){
	
	$("#startDate").val("${startDate}");
	$("#endDate").val("${endDate}");
	$("#search").val("${search}");
	$("#category").val("${state}").attr("selected", "selected");
	
	
	$("#frm_submit").click(function(){
		var url = "/adminAnswer";
		var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&category=" + $("#category").val() + "&search=" + $("#search").val().trim(); + "&now=" + now +1;
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
	var url = "/adminAnswer";
	var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&category=" + $("#category").val() +"&search=" + $("#search").val().trim(); + "&now=" + now;
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
	<h1>질문/답변관리</h1>
	<div id="ad_video_searchArea">
		<form method="post" id="frm" action="adminAnswer">
		<ul id="ad_video_searchList">
			<li>
				카테고리
			</li>
			<li>
				<select name ="category" id="category">
					<option value="" selected>전체</option>
					<option value="공예/창작">공예/창작</option>
					<option value="요리">요리</option>
					<option value="미술">미술</option>
					<option value="음악">음악</option>
					<option value="라이프스타일">라이프스타일</option>
					<option value="운동">운동</option>
					<option value="사진/영상">사진/영상</option>
				</select>	
			</li>
			<li>
				등록일
			</li>
			<li> 
			  <input type="date" name="startDate" id="startDate" value=""/>~<input type="date" name="endDate" id="endDate" value=""/>
			</li>
			<li>검색</li>
			<li>
				<input type="text" size="40" name ="search" id="search" placeholder="글제목,작성자 검색"/>
				<input type="submit" class="btn" id="frm_submit" value="검색" />
			</li>
		</ul>
		</form>
	</div>
	<ul id="ad_video_lstArea">
		<li>문의번호</li>
		<li>카테고리</li>
		<li>상품코드</li>
		<li>상품명</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>답변일</li>
		
		<c:forEach items="${list }" var="list">
		<li>${list.num }</li>
		<li>${list.category }</li>
		<li>${list.code }</li>
		<li class="wordCut">${list.goods_name }</li>
		<li class="wordCut"><a href="/gachi/adminAnswerView?num=${list.num}">${list.subject }</a></li>
		<li>${list.username }</li>
		<li>${list.writedate }</li>
		<li>${list.answer_writedate }</li>
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
						<a class="btn" href="/gachi/adminMember?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${startPage+i <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminMember?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminMember?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${method eq 'post' }">
				<c:if test="${startPage ne 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminMember?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${startPage+i <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminMember?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminMember?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			
	</ul>
</div>
</div>