<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#eventTitle{
	margin-top:50px;
}

/* 이벤트 상단 제목, 날짜 */
#eventDetailDiv{
	border-top:2px solid black;
	border-bottom:1px solid #E5E5E5;
}
#eventDetailSubject{
	border-bottom:1px solid #E5E5E5;
}
#eventDetailDateDiv{
	margin: 10px 0;
}
/* 이벤트 상단 제목, 날짜 끝*/

/* 이벤트 상세 내용*/
#eventDetailContent{
	min-height: 500px;
	overflow:auto;
	text-align:center;
	padding: 20px;
	width: 100%;
}
#eventDetailContent img{
	width: 100%;

}
/* 이벤트 상세 내용 끝*/
/* 댓글 입력 폼*/
#eventReplyForm{
	width:100%;
	margin: 20px 0; 
	float: left;
}
#eventReplyForm>textarea{
	width:100%;
	resize:none;
}
#eventReplyForm>div{
	float:right;
}
/* 댓글 입력 폼 끝*/
/*버튼*/
#eventDetailBtnDiv{
	clear: both;
	margin: 20px 0;
	background-color: oragin;
}
/*댓글 리스트*/
#eventDetailReplyDiv{
	clear: both;
	overflow: auto;
	margin-bottom: 50px;
}
#eventDetailReplyDiv li{
	float:left;
	min-height: 50px;
	border-bottom: 1px solid #e5e5e5;
	margin-bottom: 10px;
}
#eventDetailReplyDiv li:nth-child(4n+1){
	padding-left:5px;
	width: 13%;
}
#eventDetailReplyDiv li:nth-child(4n+3){
	width: 10%;
}
#eventDetailReplyDiv li:nth-child(4n+4){
	width: 7%;
}
#eventDetailReplyDiv li:nth-child(4n+2){
	width: 70%;
}
</style>
<div class="container cfont">
	<div >
		<h3 id="eventTitle">이벤트</h3>
		<div id="eventDetailDiv">
			<div id="eventDetailSubject">
				<p style="color:red; margin: 20px 0px;">진행 중 이벤트</p>
				<h3>이벤트 제목입니다.</h3>
				<div id="eventDetailDateDiv"><span>작성자</span> <span>2020-10-30</span></div>
			</div>
			<!-- 이벤트 내용 -->
			<div id="eventDetailContent">
				<img src="/gachi/img/event_sample.png"/><br/>
			</div>
		</div>
		
	</div>
	<!-- 버튼 -->
	<div id="eventDetailBtnDiv">
		<button type="button" class="btn btn-light">이전</button>
		<button type="button" class="btn btn-light">다음</button>
		<button type="button" class="btn btn-light">목록</button>
	</div>
	<!-- 댓글 -->
	<form id="eventReplyForm">
		댓글<br/> <textarea rows="3" cols="90%"></textarea>
		<div><button class="btn btn-outline-primary">등록</button></div>
	</form>
	<!-- 댓글 리스트 -->
	<div>
		<ul id="eventDetailReplyDiv">
			<li>홍길동</li>
			<li>댓글 내용 이벤트 댓글</li>
			<li>2020-10-11</li>
			<li><a href="#">수정</a> <a href="#">삭제</a></li>
			
			
			<li>홍길동</li>
			<li>댓글 내용 이벤트 댓글</li>
			<li>2020-10-11</li>
			<li><a href="#">수정</a> <a href="#">삭제</a></li>
			<li>홍길동</li>
			<li>댓글 내용 이벤트 댓글</li>
			<li>2020-10-11</li>
			<li><a href="#">수정</a> <a href="#">삭제</a></li>
			<li>홍길동</li>
			<li>댓글 내용 이벤트 댓글</li>
			<li>2020-10-11</li>
			<li><a href="#">수정</a> <a href="#">삭제</a></li>
			
			
		</ul>
	</div>
</div>