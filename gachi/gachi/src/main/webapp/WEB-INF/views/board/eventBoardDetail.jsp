<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

#eventDetailUl li{
	float: left;
	margin-top:10px;
}
#eventDetailUl li:nth-child(1),#eventDetailUl li:nth-child(3){
	width:15%;
}
#eventDetailUl li:nth-child(2), #eventDetailUl li:nth-child(4){
	width:85%;
}
#eventDetailUl li:nth-child(5){
	width:100%;
	margin-bottom: 20px;
	min-height: 500px;
	overflow:auto;
	border-bottom: 1px solid black;
}

#eventReplyForm{
	margin: 20px 0; 
	float: left;
}

#eventReplyForm [type=button]{
	border: 0px;
	background-color: #f2f2f2;
	align-items: center;
}
3eventReplyForm>textarea{
	resize:none;
}
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
}
#eventDetailReplyDiv li{
	float:left;
	min-height: 100px;
}
#eventDetailReplyDiv li:nth-child(4n+1){
	width: 15%;
}
#eventDetailReplyDiv li:nth-child(4n+3){
	width: 10%;
}
#eventDetailReplyDiv li:nth-child(4n+4){
	width: 15%;
}
#eventDetailReplyDiv li:nth-child(4n+2){
	width: 60%;
}
</style>
<div class="container">
	<div>
		<ul id="eventDetailUl">
			<li>제목</li>
			<li>이벤트 제목입니다.</li>
			<li>등록일</li>
			<li>2020-10-16</li>
			<li>이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용 
			 이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용 
			  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용 
			   이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용  이벤트 내용 내용 
			</li>
		</ul>
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
		<input type="button" value="등록"/>
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