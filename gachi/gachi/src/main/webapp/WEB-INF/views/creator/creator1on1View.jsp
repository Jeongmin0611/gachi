<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
/* 1:1문의 상단 제목, 날짜 */
#cr_1on1View_Div{
	border-top:2px solid black;
	border-bottom:1px solid #E5E5E5;
}
#cr_1on1View_Subject{
	border-bottom:1px solid #E5E5E5;
}
#cr_1on1View_DateDiv{
	margin: 10px 0;
}
/* 1:1문의 상단 제목, 날짜 끝*/

/* 1:1문의 상세 내용*/
#cr_1on1View_Content{
	min-height: 500px;
	overflow:auto;
	text-align:center;
	padding: 50px;
	border: 2px solid gray;
	
}
/* 1:1문의 상세 내용 끝*/
/* 댓글 입력 폼*/
#cr_1on1View_ReplyForm{
	width:100%;
	margin: 20px 0; 
	float: left;
}
#cr_1on1View_ReplyForm>textarea{
	width:100%;
	resize:none;
}
#cr_1on1View_ReplyForm>div{
	float:right;
}
/* 댓글 입력 폼 끝*/
/*버튼*/
#cr_1on1View_BtnDiv{
	clear: both;
	margin: 20px 0;
	background-color: oragin;
}
/*댓글 리스트*/
#cr_1on1View_ReplyDiv{
	clear: both;
	overflow: auto;
	margin-bottom: 50px;
}
#cr_1on1View_ReplyDiv li{
	float:left;
	min-height: 50px;
	border-bottom: 1px solid #e5e5e5;
	margin-bottom: 10px;
}
#cr_1on1View_ReplyDiv li:nth-child(4n+1){
	padding-left:5px;
	width: 13%;
}
#cr_1on1View_ReplyDiv li:nth-child(4n+3){
	width: 10%;
}
#cr_1on1View_ReplyDiv li:nth-child(4n+4){
	width: 7%;
}
#cr_1on1View_ReplyDiv li:nth-child(4n+2){
	width: 70%;
}
</style>
<div class="container ad_font">
	<div >
		<h3>1:1문의내역</h3>
		<div id="cr_1on1View_Div">
			<div id=cr_1on1View_Subject">
				<h3> 배송문의입니다. </h3>
				<div id="cr_1on1View_DateDiv"><span>작성자</span> <span>2020-10-30</span></div>
			</div>
			<!-- 1:1문의 내용 -->
			<div id="cr_1on1View_Content">
			 <img src="/gachi/img/delivery.PNG"/>
			</div>
		</div>
		
	</div>
	<!-- 버튼 -->
	<div id="cr_1on1View_BtnDiv">
		<button type="button" class="btn">이전</button>
		<button type="button" class="btn">다음</button>
		<button type="button" class="btn">목록</button>
	</div>
	<!-- 댓글 -->
	<form id="cr_1on1View_ReplyForm">
		댓글<br/> <textarea rows="3" cols="90%"></textarea>
		<div><button class="btn">등록</button></div>
	</form>
	<!-- 댓글 리스트 -->
	<div>
		<ul id="cr_1on1View_ReplyDiv">
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