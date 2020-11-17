<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

h3{
	margin-top:50px;
	text-align: center;
}

#CEventBtnDiv {
	float: right;
}

#CEventBtnDiv input[type=button] {
	text-align: center;
	border: 0;
	height: 30px;
	line-height: 20px;
	width: 150px;
	margin: 0 10px;
}

.boardDiv{
}

#CEventList {
	margin: 50px auto;
	clear: right;
	overflow: auto;
	text-align: center;
}

#CEventList li{
	float:left;
	width:33%;
	margin: 10px auto;
}
#CEventList li>a>img{
	width:300px;
	height:250px; 
}
#CEventList .imgtxt {
	font-weight: bold;
}

#CEventList span {
	font-weight: normal;
	font-size: 8px;
}
.pagination{
	margin-bottom:50px;
}
</style>
<script>
	$(function(){
		$('#noticeBtn').click(function(){
			location.href="<%=request.getContextPath()%>/noticeBoard";
		});
		$('#eventBtn').click(function(){
			location.href="<%=request.getContextPath()%>/eventBoard";
		});

	});
</script>
<div class="container cfont">

	<!-- 내용 표시 -->
	<div>
		<h3>이벤트</h3>
		<div id="CEventBtnDiv">
			<input type="button" id="ingEvent" value="진행중인 이벤트" /> <input
				type="button" id="endEvent" value="종료된 이벤트" />
		</div>

		<!-- 이벤트 리스트 -->
		<ul id="CEventList">
			<li><a href="/gachi/eventBoardDetail"><img src="/gachi/img/art1.jpg" /></a><br />
				<div class="imgtxt">
					2020-10-01~2020-10-31<br /> <span>신규회원 이벤트 3만원 지원!</span>
				</div></li>
			<li><a href="/gachi/eventBoardDetail"><img src="/gachi/img/art1.jpg" /></a><br />
				<div class="imgtxt">
					2020-10-01~2020-10-31<br /> <span>신규회원 이벤트 3만원 지원!</span>
				</div></li>
			<li><a href="/gachi/eventBoardDetail"><img src="/gachi/img/art1.jpg" /></a><br />
				<div class="imgtxt">
					2020-10-01~2020-10-31<br /> <span>신규회원 이벤트 3만원 지원!</span>
				</div></li>
			
			
			<li><a href="/gachi/eventBoardDetail"><img src="/gachi/img/art1.jpg" /></a><br />
				<div class="imgtxt">
					2020-10-01~2020-10-31<br /> <span>신규회원 이벤트 3만원 지원!</span>
				</div></li>
			<li><a href="/gachi/eventBoardDetail"><img src="/gachi/img/art1.jpg" /></a><br />
				<div class="imgtxt">
					2020-10-01~2020-10-31<br /> <span>신규회원 이벤트 3만원 지원!</span>
				</div></li>
			<li><a href="/gachi/eventBoardDetail"><img src="/gachi/img/art1.jpg" /></a><br />
				<div class="imgtxt">
					2020-10-01~2020-10-31<br /> <span>신규회원 이벤트 3만원 지원!</span>
				</div></li>
		</ul>		
	</div>
	<!-- paging -->
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">Prev</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
</div>