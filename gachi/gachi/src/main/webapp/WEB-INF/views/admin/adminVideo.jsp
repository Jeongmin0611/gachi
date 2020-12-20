<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$(function(){
	$("#startDate").val("${startDate}");
	$("#endDate").val("${endDate}");
	$("#searchWord").val("${searchWord}");
	$("#category").val("${category}").attr("selected", "selected");
	$("#payment_type").val("${payment_type}").attr("selected", "selected");	
	$('.ad_goods_searchForm').css("text-align","right").css("margin","5px 0px");
	var now=${nowPage};
	$("#searchBtn").click(function(){
		if($('#startDate').val()>=$('#endDate').val()){
			alert("시작일보다 종료일이 더 빠릅니다.\n다시입력해주세요.");
			return false;
		}
		var url = "/adminVideo";
		var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&category=" + $("#category").val() + "&searchWord=" + $("#searchWord").val().trim(); + "&now=" + now +1;
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
		var url = "/adminVideo";
		var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&category=" + $("#category").val() + "&searchWord=" + $("#searchWord").val().trim(); + "&now=" + now ;
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
	<h1>동영상 관리</h1>
	<div id="ad_video_searchArea">
		<form method="post" action="adminVideo">
		<ul id="ad_video_searchList">
			<li>
				카테고리
			</li>
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
			<li>
				등록일
			</li>
			<li> 
			   <input type="date" id="startDate" name="startDate" />&nbsp;~
			   <input type="date" id="endDate" name="endDate" />
			</li>
			<li>영상검색</li>
			<li>
				<input type="text"  id="searchWord" name="searchWord" size="40" placeholder="검색어를 입력하세요."/>
				<input type="submit" id="searchBtn" class="btn" value="검색" />
			</li>
		</ul>
		</form>
	</div>
	<div id="ad_video_lstArea">
		<ul id="ad_video_Lst">
			<li>동영상코드</li>
			<li>클래스명</li>
			<li>목차명</li>
			<li>목차순서</li>
			<li>강좌명</li>
			<li>파일명</li>
			<li>크리에이터</li>
			<li>영상길이</li>
			<li>등록일</li>
			
			<c:forEach var="vlist" items="${vlist}">
				<li class="wordCut">${vlist.video_code}</li>
				<li class="wordCut">${vlist.class_name}</li>
				<li class="wordCut">${vlist.unit_content}</li>
				<li class="wordCut">${vlist.section_index}</li>
				<li class="wordCut"><a href="/gachi/adminVideoView?code=${vlist.code}&video_filename=${vlist.video_filename}">${vlist.video_name}</a></li>
				<li class="wordCut">${vlist.video_filename}</li>
				<li class="wordCut">${vlist.nickname}</li>
				<li class="wordCut">${vlist.lengthStr}</li>
				<li class="wordCut">${vlist.enroll_date}</li>
			</c:forEach>
		</ul>
	</div>
	<div class="ad_list_menu">
		<button class="btn" onclick="location.href='/gachi/adminVideoWrite'">등록</button>
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
					<li>
						<a class="btn" href="/gachi/adminVideo?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>

				<c:forEach var="i" begin="${startPageNum}" end="${startPageNum +10-1 }">
					<c:if test="${i <= lastPage }">
					<li>
						<a class="btn" href="/gachi/adminVideo?now=${i}">${i}</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${nowPage<lastPage}">
					<li>
						<a class="btn" href="/gachi/adminVideo?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${method eq 'post' }">
				<c:if test="${startPage ne 1}">
					<li>
						<a class="btn" href="/gachi/adminVideo?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>

				<c:forEach var="i" begin="${startPageNum}" end="${startPageNum +10-1 }">
					<c:if test="${i <= lastPage }">
					<li>
						<a class="btn" href="/gachi/adminVideo?now=${i}">${i}</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${nowPage<lastPage}">
					<li>
						<a class="btn" href="/gachi/adminVideo?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
	</ul>
</div>
</div>