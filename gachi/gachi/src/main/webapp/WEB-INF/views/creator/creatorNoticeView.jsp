<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#eventTitle{
	margin-top:50px;
}

/* 1:1문의 상단 제목, 날짜 */
#cr_NoticeView_Div{
	border-top:2px solid black;
	border-bottom:1px solid #E5E5E5;
}
#cr_NoticeView_Subject{
	border-bottom:1px solid #E5E5E5;
}
#cr_NoticeView_DateDiv{
	margin: 10px 0;
}
/* 1:1문의 상단 제목, 날짜 끝*/

/* 1:1문의 상세 내용*/
#cr_NoticeView_Content{
	min-height: 500px;
	overflow:auto;
	text-align:center;
	padding: 50px;
	border: 2px solid gray;
	
}
/* 1:1문의 상세 내용 끝*/
/* 댓글 입력 폼*/
#cr_NoticeView_ReplyForm{
	width:100%;
	margin: 20px 0; 
	float: left;
}
#cr_NoticeView_ReplyForm>textarea{
	width:100%;
	resize:none;
}
#cr_NoticeView_ReplyForm>div{
	float:right;
}
/* 댓글 입력 폼 끝*/
/*버튼*/
#cr_NoticeView_BtnDiv{
	clear: both;
	margin: 20px 0;
	background-color: oragin;
}
/*댓글 리스트*/
#cr_NoticeView_ReplyDiv{
	clear: both;
	overflow: auto;
	margin-bottom: 50px;
}
#cr_NoticeView_ReplyDiv li{
	float:left;
	min-height: 50px;
	border-bottom: 1px solid #e5e5e5;
	margin-bottom: 10px;
}
#cr_NoticeView_ReplyDiv li:nth-child(4n+1){
	padding-left:5px;
	width: 13%;
}
#cr_NoticeView_ReplyDiv li:nth-child(4n+3){
	width: 10%;
}
#cr_NoticeView_ReplyDiv li:nth-child(4n+4){
	width: 7%;
}
#cr_NoticeView_ReplyDiv li:nth-child(4n+2){
	width: 70%;
}
</style>
<div class="container cfont">
	<div >
		<h3>공지사항</h3>
		<div id="cr_NoticeView_Div">
			<div id="cr_NoticeView_Subject">
				<h3>[동영상] 소리만 나오고 동영상 화면이 나오지 않아요.</h3>
				<div id="cr_NoticeView_DateDiv"><span>작성자</span> <span>2020-10-30</span></div>
			</div>
			<!-- 1:1문의 내용 -->
			<div id="cr_NoticeView_Content">
				<!-- <img src="/gachi/img/event_sample.png"/> -->
			<p>	
				<b>1. 영상출력방식이 맞지 않아 발생할 수 있습니다.</b><br/>
				재생화면에 마우스를 올려 놓으시고 마우스 오른쪽 버튼을 누르면 메뉴가 나옵니다.<br/>
				메뉴중 [비디오]->[출력방식]->[VMR9] 순으로 변경해 보시기 바랍니다.<br/><br/>
				
				<b>2. 그래픽카드 드라이브 문제일 수 있습니다.</b><br/>
				3DP 프로그램을 통해 그래픽카드를 검색하여 설치하시기 바랍니다.<br/>
				3DP는여기를 통해 다운받아 설치하시고 프로그램을 실행하면 이용하는<br/>
				PC의 그래픽카드에 맞춰 드라이브를 찾아 다운 받을 수 있습니다.<br/><br/>
				
				잘 안되시거나 어려우시면 고객센터(1500-0000)으로 연락주세요.<br/>
				원격지원을 통해 도움 드리도록 하겠습니다. 감사합니다. </p>
			</div>
		</div>
		
	</div>
	<!-- 버튼 -->
	<div id="cr_NoticeView_BtnDiv">
		<button type="button" class="btn btn-light">이전</button>
		<button type="button" class="btn btn-light">다음</button>
		<button type="button" class="btn btn-light">목록</button>
	</div>
	<!-- 댓글 -->
	<form id="cr_NoticeView_ReplyForm">
		댓글<br/> <textarea rows="3" cols="90%"></textarea>
		<div><button class="btn btn-outline-primary">등록</button></div>
	</form>
	<!-- 댓글 리스트 -->
	<div>
		<ul id="cr_NoticeView_ReplyDiv">
			<li>홍길동</li>
			<li>댓글 내용 </li>
			<li>2020-10-11</li>
			<li><a href="#">수정</a> <a href="#">삭제</a></li>
			
			
			<li>홍길동</li>
			<li>댓글 내용 </li>
			<li>2020-10-11</li>
			<li><a href="#">수정</a> <a href="#">삭제</a></li>
			<li>홍길동</li>
			<li>댓글 내용</li>
			<li>2020-10-15</li>
			<li><a href="#">수정</a> <a href="#">삭제</a></li>
			<li>홍길동</li>
			<li>댓글 내용</li>
			<li>2020-10-19</li>
			<li><a href="#">수정</a> <a href="#">삭제</a></li>
			
			
		</ul>
	</div>
</div>