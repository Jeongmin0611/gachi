<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#cre_video_lst{
		border:3px solid #437299;
		border-radius: 10px;
		overflow: auto;
	}
	#cre_video_lst li{
		width:8%;
		float:left;
		height:50px;
		line-height:50px;
		text-align:center;
		border-bottom:1px solid gray;
	}
	#cre_video_lst li:nth-child(8n+3){
		width:20%;
	}
	#cre_video_lst li:nth-child(8n+5){
		width:32%;
	}
	#cre_video_searchForm{
		margin:30px 0px;
		text-align: center;
	}
	#cre_video_info{
		border:1px solid #437299;
		margin:20px 0px;
		height:300px;
		font-size:1.2em;
		display: none;
	}
	#cre_video_info ul{
		margin:15px 0px;
		float:left;
		height:300px;
	}
	#cre_video_info ul:first-child{
		text-align: center;
	}
	#cre_video_info ul:last-child>li{
		float:left;
		height:50px;
		line-height:50px;
	}
	#cre_video_info ul:last-child>li:nth-child(2n+1){
		width:20%;
	}
	#cre_video_info ul:last-child>li:nth-child(2n){
		width:80%;
	}
	button{
		background-color: #437299;
		 -webkit-appearance: none;
  		 -webkit-border-radius: 0;
	}
	.container{
		font-family: 'NanumBarunpen';
	}
</style>
<script>
	$(()=>{
		$(function(){
			
			$("#startDate").val("${startDate}");
			$("#endDate").val("${endDate}");
			$("#searchWord").val("${searchWord}");
			$("#category").val("${category}").attr("selected", "selected");
			$("#payment_type").val("${payment_type}").attr("selected", "selected");	
			$('.ad_goods_searchForm').css("text-align","right").css("margin","5px 0px");
			
			$("#searchBtn").click(function(){
				var url = "/creatorVideo";
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
			function postPageMove(now) {
				console.log(now);
				return false;
				var url = "/creatorVideo";
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
		});
	});
</script>
<div class="container ad_font">
	<h1>동영상등록현황</h1>
	<div id="ad_video_searchArea">
		<form method="post" action="creatorVideo">
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
	<b style="color:red;">*동영상은 클래스 승인 처리시 일괄적으로 홈페이지에 개시됩니다.</b>
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
				<li><a href="/gachi/creatorVideoView?code=${vlist.code}&video_filename=${vlist.video_filename}">${vlist.video_name}</a></li>
				<li class="wordCut">${vlist.video_filename}</li>
				<li class="wordCut">${vlist.nickname}</li>
				<li class="wordCut">${vlist.lengthStr}</li>
				<li class="wordCut">${vlist.enroll_date}</li>
			</c:forEach>
		</ul>
	</div>
	<div style="margin:10px 0px; text-align:center">
			<button class="btn" onclick="location.href='/gachi/creatorVideoWrite'">클래스영상등록</button>
			<button class="btn" onclick="location.href='/gachi/creatorVideoRequest'">영상변경사항요청</button>
		</div>
<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<li class="btn"><a class="btn" href="#">Prev</a></li>
			<li><a href="#" class="paging_num">1</a></li>
			<li><a href="#" class="paging_num">2</a></li>
			<li><a href="#" class="paging_num">3</a></li>
			<li><a href="#" class="paging_num">4</a></li>
			<li><a href="#" class="paging_num">5</a></li>
			<li class="btn"><a class="btn" href="#">Next</a></li>
	</ul>
</div>
</div>