<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

h3{
	margin-top:50px;
	text-align: center;
}
/* 진행중 , 완료 이벤트 버튼*/
#CEventBtnDiv {
	text-align: right;
	width: 100%;
	margin-bottom: 10px;
}
button:focus, button:active{
	outline: none;
}
#ingEvent {
	text-align: center;
	border: 2px solid lightblue;
	background-color: white;
	height: 30px;
	border-radius:5px;
	line-height: 20px;
	width: 150px;
	margin: 0 10px;

}
#endEvent {
	text-align: center;
	border: 2px solid lightblue;
	background-color: lightblue;
	color:white;
	height: 30px;
	border-radius:5px;
	line-height: 20px;
	width: 150px;
	margin: 0 10px;
}
/* 진행중 , 완료 이벤트 끝*/
/* 이벤트 리스트 */
#eventThumbnail>img {/*이미지 사이즈 조절*/
	width: 100%;
	margin: 10px auto;
	height: 250px;
}

.homeClassListTxt {
	text-align: center;
	overflow: auto;
	margin-bottom: 10px;
	padding: 0;
}
#eventdate{/*이벤트 날짜*/
	font-weight: bold;
}

.homeClassListTxt p {
	margin: 0;
}

#eventNew { /* new 스타일 지정 */
	background-color: lightblue;
	color: white;
}
.col-sm-4 a { /*a태그 설정*/
	text-decoration: none;
	color: black;
}
/* 이벤트 리스트 끝*/

/*버튼 오버 효과*/
#CEventBtnDiv input {
	max-width: 100%;
	position: relative;
	opacity: 1;
}

#CEventBtnDiv input:hover {
	-webkit-transform: scale(1.05);
	transform: scale(1.05);
}

#CEventBtnDiv * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all ease-in-out;
	transition: all ease-in-out;
}
/*버튼 오버 효과 끝 */

/* 이미지 오버 효과 */
.row img {
	max-width: 100%;
	position: relative;
	opacity: 1;
}

.row img:hover {
	-webkit-transform: scale(1.05);
	transform: scale(1.05);
}

.row * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.45s ease-in-out;
	transition: all 0.45s ease-in-out;
}

/* 이미지 오버 효과 끝 */

.pagination{
	margin:50px 0;
}
</style>
<script>
	$(function(){
		$('#ingEvent').click(function(){
			location.href="<%=request.getContextPath()%>/eventBoard";
		});
		$('#endEvent').click(function(){
			location.href="<%=request.getContextPath()%>/eventBoardEnd";
		});
	});
	
	$(".hover").mouseleave(
		function () {
			$(this).removeClass("hover");
		}
	);
</script>
<div class="container cfont">

	<!-- 내용 표시 -->
	<div>
		<h3>이벤트</h3>
		<div id="CEventBtnDiv">
			<button id="ingEvent">진행 이벤트</button>
			<button id="endEvent">종료 이벤트</button>
		</div>
	</div>

	<!-- 이벤트 리스트 -->
	<div class="row">
		<c:forEach var="vo" items="${list }">
		<div class="col-sm-4">
			<a href="/gachi/eventBoardView?event_num=${vo.event_num }&event_category=종료이벤트&nowPage=${pvo.nowPage}" id="eventThumbnail">
			<img src="/gachi/img/board/${vo.event_img}"/></a><br/>
			<div class="homeClassListTxt">
				<!-- <span class="badge " id="eventNew">new</span>&nbsp; -->
				<p> <span id="eventdate">${vo.startdate }~${vo.enddate }</span></p>
				<a href="/gachi/eventBoardView?event_num=${vo.event_num }&event_category=종료이벤트&nowPage=${pvo.nowPage}">${vo.subject }</a>
			</div>				
		</div>
		</c:forEach>
	</div>	
	<!-- paging -->
		<ul class="pagination justify-content-center">
			<c:if test="${pvo.nowPage>1}">
				<li class="page-item">
					<a class="page-link" href="/gachi/eventBoardEnd?nowPage=${pvo.nowPage-1 }">Prev</a>
				</li>
			</c:if>
			<c:forEach var="p" begin="${pvo.startPageNum }" end="${pvo.startPageNum+pvo.onePageRecord-1 }">
				<c:if test="${p<=pvo.totalPage }">
					<li class="page-item"><a class="page-link" href="/gachi/eventBoardEnd?nowPage=${p }"<c:if test="${p==pvo.nowPage }">style="background-color:lightblue; color:white"</c:if>>${p }</a></li>
				</c:if>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="/gachi/eventBoardEnd?nowPage=${pvo.nowPage+1 }">Next</a></li>
		</ul>
</div>