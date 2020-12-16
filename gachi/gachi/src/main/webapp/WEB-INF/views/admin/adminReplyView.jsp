<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#eventTitle{
	margin-top:50px;
}

/* 1:1문의 상단 제목, 날짜 */
#adminReplyView_Div{
	border-top:2px solid black;
	border-bottom:1px solid #E5E5E5;
}
#adminReplyView_Subject{
	border-bottom:1px solid #E5E5E5;
	margin-top : 30px;
}
#adminReplyViewDateDiv{
	margin: 10px 0;
	float : right;
}

#adminReplyView_Content{
	min-height: 500px;
	overflow:auto;
	text-align:center;
	padding: 50px;
	border: 3px solid #437299;
	border-radius: 10px;
	margin-top:70px;
}
</style>
<div class="container ad_font">
	<div >
		<h3>상품리뷰</h3>
		<div id="adminReplyView_Div">
			<div id="adminReplyView_Subject">
				<h3>리뷰명 : ${list.subject}</h3>
				<div id="adminReplyViewDateDiv"><span>작성자 : ${list.username}</span> <br/><span> 작성일 : ${list.writedate}</span></div>
			</div>
			<!-- 1:1문의 내용 -->
			<div id="adminReplyView_Content">
				리뷰내용
				${list.content}
			</div>
		</div>
		
	</div>

	<div style="text-align: right;width:50%;float:right; margin-top:10px;">
		<a href="/gachi/adminReply"><button type="button" class="btn">목록</button></a>
		<button type="button" class="btn">삭제</button>
	</div>

<!-- 	<form id="replyFrm">
		답<br/> <textarea rows="3" cols="90%" id=""></textarea>
		<div><button class="btn" id="frm_submit">등록</button></div>
	</form> -->
</div>