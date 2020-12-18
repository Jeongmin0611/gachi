<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#ad_class_lstArea{
		border:3px solid #437299; 
		margin-top:20px;
		overflow: auto;
		border-radius: 10px;
	}
	#ad_class_lstArea li{
		float:left;
		width:10%;
		height:40px;
		line-height:40px;
		border-bottom:1px solid gray;
		text-align:center;
	}
	#ad_class_lstArea li:nth-child(8n+1){
		width:5%;
	}
	#ad_class_lstArea li:nth-child(8n+2){
		width:8%;
	}
	#ad_class_lstArea li:nth-child(8n+3){
		width:17%;
	}
	#ad_class_lstArea li:nth-child(8n+4){
		width:25%;
	}
	#ad_class_lstArea li:nth-child(8n+5){
		width:20%;
	}
	#ad_class_lstArea li:nth-child(8n+6){
		width:5%;
	}
	#ad_class_lstArea li:nth-child(8n+7){
		width:10%;
	}
	#ad_class_lstArea li:nth-child(8n+8){
		width:10%;
	}
</style>


<script>
$(function(){
	
	$("#startDate").val("${startDate}");
	$("#endDate").val("${endDate}");
	$("#search").val("${search}");
	$("#category").val("${state}").attr("selected", "selected");
	$("#grade").val("${grade}").attr("selected", "selected");
	
	$("#frm_submit").click(function(){
		var url = "/adminClassReview";
		var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&category=" + $("#category").val() + "&grade=" + $("#grade").val()+ "&search=" + $("#search").val().trim(); + "&now=" + now +1;
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
	var url = "/adminClassReview";
	var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() + "&category=" + $("#category").val() + "&grade=" + $("#grade").val()+"&search=" + $("#search").val().trim(); + "&now=" + now;
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
	<h1>수강평 관리</h1>
	
	<div id="ad_video_searchArea">	
		<form method="post" action="adminClassReview">
		<ul id="ad_video_searchList">
			<li>
				카테고리
			</li>
			<li>
				<select name="category">
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
			<input type="date" name="startDate" id="startDate" value=""/>~<input type="date" name="endDate" id="endDate" value=""/>

			</li>
			<li>평점</li>
			<li>
				<select name ="grade">
					<option value="">전체</option>
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</select>
			</li>
			<li>수강평검색</li>
			<li>
				<input type="text" name="search" id="search" size="40"/>
				<input type="submit" class="btn" id="frm_submit" value="검색" />
			</li>
		</ul>
	</form>
	</div>

	<ul id="ad_class_lstArea" >
		<li>번호</li>
		<li>카테고리</li>
		<li>클래스 코드</li>
		<li>상품명</li>
		<li>제목</li>
		<li>평점</li>
		<li>작성자</li>
		<li>작성일</li>
		<c:forEach items="${list }" var="list">
		<li>${list.num }</li>
		<li>${list.category }</li>
		<li>${list.code}</li>
		<li class="wordCut">${list.class_name }</li>
		<li class="wordCut"><a href="/gachi/adminClassReviewView?num=${list.num}">${list.subject }</a></li>
		<li>${list.grade }</li>
		<li>${list.username}</li>
		<li>${list.writedate }</li>
		</c:forEach>	
	</ul>
	
<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<c:if test="${method eq 'get' }">
				<c:if test="${nowPage > 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminClassReview?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="1" end="${lastPage}">
					<li class="btn">
						<a class="btn" href="/gachi/adminClassReview?now=${i }">${i }</a>
					</li>
				</c:forEach>
				<c:if test="${nowPage < lastPage}">
					<li class="btn">
						<a class="btn" href="/gachi/adminClassReview?now=${nowPage+1}">Next</a>
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