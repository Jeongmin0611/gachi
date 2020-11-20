<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#adminEvent_View_Title{
	margin-top:50px;
}

/* 이벤트 상단 제목, 날짜 */
#adminEvent_View_Div{
	border-top:2px solid black;
	border-bottom:1px solid #E5E5E5;
}
#adminEvent_View_Subject{
	border-bottom:1px solid #E5E5E5;
}
#adminEvent_View_DateDiv{
	margin: 10px 0;
}
/* 이벤트 상단 제목, 날짜 끝*/

/* 이벤트 상세 내용*/
#adminEvent_View_Content{
	min-height: 500px;
	overflow:auto;
	text-align:center;
	padding: 20px;
}
/* 이벤트 상세 내용 끝*/
/* 댓글 입력 폼*/
#adminEvent_View_ReplyForm{
	width:100%;
	margin: 20px 0; 
	float: left;
}
#adminEvent_View_ReplyForm>textarea{
	width:100%;
	resize:none;
}
#adminEvent_View_ReplyForm>div{
	float:right;
}
/* 댓글 입력 폼 끝*/
/*버튼*/
#adminEvent_View_BtnDiv{
	clear: both;
	margin: 20px 0;
	background-color: oragin;
}
/*댓글 리스트*/
#adminEvent_View_ReplyDiv{
	clear: both;
	overflow: auto;
	margin-bottom: 50px;
}
#adminEvent_View_ReplyDiv li{
	float:left;
	min-height: 50px;
	border-bottom: 1px solid #e5e5e5;
	margin-bottom: 10px;
}
#adminEvent_View_ReplyDiv li:nth-child(4n+1){
	padding-left:5px;
	width: 13%;
}
#adminEvent_View_ReplyDiv li:nth-child(4n+3){
	width: 10%;
}
#adminEvent_View_ReplyDiv li:nth-child(4n+4){
	width: 7%;
}
#adminEvent_View_ReplyDiv li:nth-child(4n+2){
	width: 70%;
}
</style>
<div class="container cfont">
	<div >
		<h3 id="adminEvent_View_Title">신규 이벤트</h3>
		<div id="adminEvent_View_Div">
			<div id="adminEvent_View_Subject">
				<p style="color:red; margin: 20px 0px;">신규 이벤트 3만원 할인 !</p>
				<h3>신규 이벤트 3만원 할인 !</h3>
				<div id="adminEvent_View_DateDiv"><span>같이가치</span> <span style="float:right;">2020-10-30</span></div>
			</div>
			<!-- 이벤트 내용 -->
			<div id="adminEvent_View_Content">
				<img src="/gachi/img/event_sample.png"/>
			</div>
		</div>
		
	</div>
	<!-- 버튼 -->
	<div id="adminEvent_View_BtnDiv">
		<button type="button" class="btn btn-light">이전</button>
		<button type="button" class="btn btn-light">다음</button>
		<button type="button" class="btn btn-light">목록</button>
	</div>
	<!-- 댓글 -->
	<form id="adminEvent_View_ReplyForm">
		댓글<br/> <textarea rows="3" cols="90%"></textarea>
		<div><button class="btn btn-outline-primary">등록</button></div>
	</form>
	<!-- 댓글 리스트 -->
	<div>
		<ul id="adminEvent_View_ReplyDiv">
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