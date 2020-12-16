<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#search_area{
		margin-top:20px;
		margin-bottom:20px;
		border:3px solid #437299;
		border-radius:10px;
		overflow: auto;
	}
	#search_area{
		padding-left:0px;
		overflow: auto;
	}
	#search_area h3{
		margin-top:20px;
		text-align:center;
	}
	#search_area li{
		margin:5px 0px;
		float:left;
	}
	#search_area>li:nth-child(2n+1){
		width:20%;
		text-align:center;
	}
	#search_area>li:nth-child(2n){
		width:80%;
		text-align:left;
	}
	@media all and (min-width:320px) and (max-width:600px){
		h3{
			margin-top:5px;
		}
		#search_area li{
			font-size: 0.5em;
		}
	}
</style>
<script>
	$(function(){
		$("#startDate").val("${startDate}");
		$("#endDate").val("${endDate}");
		$("#class_state").val("${class_state}").attr("selected", "selected");
		$("#dateOption").val("${dateOption}").attr("selected", "selected");
		$("#category").val("${category}").attr("selected", "selected");
		$("#search").val("${search}");
		
		$("#searchBtn").click(function(){
			var url = "/adminClass";
			var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&class_state=" + $("#class_state").val() + "&category=" + $("#category").val()+ "&dateOption=" + $("#dateOption").val()+ "&search=" + $("#search").val().trim(); + "&now=" + now +1;
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
		var url = "/adminClass";
		var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&class_state=" + $("#class_state").val() + "&category=" + $("#category").val()+ "&dateOption=" + $("#dateOption").val()+ "&search=" + $("#search").val().trim(); + "&now=" + now +1;
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
</script>
<div class="container ad_font">
	<h1>클래스관리</h1>
	<form method="post" action="adminClass">
	<h3>검색옵션</h3>
			<ul id="search_area">
				<li>날짜옵션</li>
				<li>	
					<select id="dateOption" name="dateOption">
						<option value="">전체</option>
						<option value="allow">등록일</option>
						<option value="signup">등록신청일</option>
					</select>	
					<input type="date" id="startDate" name="startDate">&nbsp;~&nbsp;<input type="date" name="endDate">
				</li>
				<li>카테고리</li>
				<li>
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
				</li>
				<li>클래스상태</li>
				<li>
					<select id="class_state" name="class_state">
						<option value="">전체</option>
						<option value="등록대기">등록대기</option>
						<option value="판매중">판매중</option>
						<option value="종료">종료</option>
					</select>
				</li>
				<li>검색</li>
				<li><input type="text" id="search" name="search"/></li>
				<li style="width:100%;text-align:center">
					<input type="submit" id="searchBtn" class="btn" value="조회"/>
				</li>	
			</ul>	
</form>
	<ul id="ad_class_lst">
		<li>클래스코드</li>
		<li>카테고리</li>
		<li>클래스명</li>
		<li>크리에이터명</li>
		<li>누적수강생</li>
		<li>등록신청일</li>
		<li>등록일</li>
		<li>상태</li>
		
		<c:forEach var="vo" items="${result}">
		<li>${vo.code }</li>
		<li>${vo.category }</li>
		<li class="wordCut"><a href="/gachi/adminClassView?code=${vo.code}">${vo.class_name}</a></li>
		<li class="wordCut">${vo.nickname }</li>
		<li>${vo.total_student }</li>
		<li>${vo.signup }</li>
		<li>${vo.allow }</li>
		<li>${vo.class_state }</li>
		</c:forEach>	
	</ul>
	<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<c:if test="${method eq 'get' }">
				<c:if test="${nowPage > 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminClass?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="1" end="${lastPage}">
					<li>
						<a class="btn" href="/gachi/adminClass?now=${i }">${i }</a>
					</li>
				</c:forEach>
				<c:if test="${nowPage < lastPage}">
					<li class="btn">
						<a class="btn" href="/gachi/adminClass?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${method eq 'post' }">
				<c:if test="${nowPage > 1}">
					<li>
						<a class="btn" href="javascript:void(0);" onClick="postPageMove(${nowPage+1});">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="1" end="${lastPage}">
					<li>
						<a href="javascript:void(0);" onClick="postPageMove(${i });">${i }</a>
					</li>
				</c:forEach>
				<c:if test="${nowPage < lastPage}">
					<li>
						<a class="btn" href="javascript:void(0);" onClick="postPageMove(${nowPage}-1);">Next</a>
					</li>
				</c:if>
			</c:if>	
	</ul>
</div>
	
</div>
