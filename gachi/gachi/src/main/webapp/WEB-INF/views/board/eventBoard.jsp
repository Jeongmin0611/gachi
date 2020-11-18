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
	width:350px;
	height:250px; 
}
#CEventList .imgtxt {
	font-weight: bold;
}

#CEventList span {
	font-weight: normal;
	font-size: 15px;
}

/* 이미지 오버 효과 */

#CEventList img{
max-width: 100%;
  position: relative;
  opacity: 1;
}


#CEventList li:hover img, #CEventList li.hover img{
  -webkit-transform: scale(1.05);
  transform: scale(1.05);
}
#CEventList *{
 -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.45s ease-in-out;
  transition: all 0.45s ease-in-out;
  }

/* 이미지 오버 효과 끝 */

.pagination{
	margin-bottom:50px;
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
			<input type="button" id="ingEvent" value="진행중인 이벤트" /> 
			<input type="button" id="endEvent" value="종료된 이벤트"/>
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