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
	#search_area ul{
		padding-left:0px;
		overflow: auto;
		
	}
	#search_area h3{
		margin-top:50px;
		text-align:center;
	}
	#search_area li{
		margin:5px 0px;
	}
	#search_area ul>li{
		width:50%;
		float:left;
		text-align:center;
	}
	#search_area ul>li li:nth-child(2n+1){
		width:20%;
	}
	#search_area ul>li li:nth-child(2n){
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
	$(()=>{
		$('#ad_class_search').submit(function(){
			if($('#searchWord').val()==null||$('#searchWord').val()==""){
					alert("검색어를 입력해주세요.");
					return false;
			}
			return false;
		});
	});
</script>
<div class="container ad_font">
	<h1>클래스관리</h1>
<div id="search_area">
	<ul>
		<li>
			<form method="get" id="ad_class_lookup" action="/gachi/adminClass">
			<h3>조회옵션</h3>
			<ul>
				<li>날짜옵션</li>
				<li>	
					<select id="dateOption" name="dateOption">
						<option>전체</option>
						<option value="allow">등록일</option>
						<option value="signup">등록신청일</option>
					</select>	
					<input type="date" name="date1">&nbsp;~&nbsp;<input type="date" name="date2">
				</li>
				<li>카테고리</li>
				<li>
					<select id="category" name="category">	
						<option>전체</option>
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
					<select name="class_state">
						<option>전체</option>
						<option value="등록대기">등록대기</option>
						<option value="판매중">판매중</option>
						<option value="종료">종료</option>
					</select>
				</li>
				<li style="width:100%;text-align:center">
					<input type="submit" class="btn" value="조회"/>
				</li>	
			</ul>
			</form>
	</li>
		<li>
		<form method="get" id="ad_class_search" action="/gachi/adminClass">
			<h3>검색옵션</h3>
			<ul style="margin-top:10px;height:200px;">
				<li>검색옵션</li>
				<li>
					<select id="option" name="option">
						<option value=null>전체</option>
						<option value="code">클래스코드</option>
						<option value="category">카테고리</option>
						<option value="class_name">클래스명</option>
						<option value="nickname">크리에이터닉네임</option>
					</select>
				</li>
				<li>검색</li>
				<li>
					<input type="text" id="searchWord" name="searchWord"/>
					<input type="submit" class="btn" value="검색"/>
				</li>
			</ul>
		</form>
		</li>	
	</ul>	
</div>
	<ul id="ad_class_lst">
		<li>클래스코드</li>
		<li>카테고리</li>
		<li>클래스명</li>
		<li>크리에이터명</li>
		<li>누적수강생</li>
		<li>등록신청일</li>
		<li>등록일</li>
		<li>상태</li>
		
		
		<c:forEach var="vo" items="${list}">
		<li>${vo.code }</li>
		<li>${vo.category }</li>
		<li><a href="/gachi/adminClassView?class_code=${vo.code}">${vo.class_name}</a></li>
		<li>${vo.nickname }</li>
		<li>${vo.total_student }</li>
		<li>${vo.signup }</li>
		<li>${vo.allow }</li>
		<li>${vo.class_state }</li>
		</c:forEach>
	</ul>
	<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<c:if test="${pvo.nowPage>1}">
				<li class="btn">
					<a class="btn" href="/gachi/adminClass?nowPage=${pvo.nowPage-1}">Prev</a>
				</li>
			</c:if>
			<c:forEach var="p" begin="${pvo.startPageNum}" end="${pvo.startPageNum + pvo.onePageRecord-1 }">
				<c:if test="${p<=pvo.totalPage}">
					<li <c:if test="${p==pvo.nowPage}"> style="background-color:white"</c:if>>
						<a href="/gachi/adminClass?nowPage=${p}" class="paging_num">${p}</a>
					</li>
				</c:if>
			</c:forEach>
		
			<c:if test="${pvo.nowPage<pvo.totalPage}">
				<li class="btn">
					<a class="btn" href="/gachi/adminClass?nowPage=${pvo.nowPage+1}">next</a>
				</li>
			</c:if>
	</ul>
</div>
</div>
