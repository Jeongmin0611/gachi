<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#eventTitle{
	margin-top:50px;
}

/* 1:1문의 상단 제목, 날짜 */
#adminAnswerView_Div{
	border-top:2px solid black;
	border-bottom:1px solid #E5E5E5;
}
#adminAnswerView_Subject{
	border-bottom:1px solid #E5E5E5;
	margin-top : 30px;
}
#adminAnswerViewDateDiv{
	margin: 10px 0;
	float : right;
}

#adminAnswerView_Content{
	min-height: 500px;
	overflow:auto;
	text-align:center;
	padding: 50px;
	border: 3px solid #437299;
	border-radius: 10px;
	margin-top:70px;
}
#reply_Div{
	border: 3px solid #437299;
	border-radius: 10px;
}
</style>
<script>
/* function classDel(){
	if(confirm("해당 클래스를 삭제하시겠습니까?")){
		location.href='/gachi/adminClassDel?code=${vo.code}';	
	}
} */
var answer = $("#answer").text();
$(function(){
	$("#frm_submit").click(function(){
	$("#answer").text();
	console.log($("#answer").text());
	});
});
</script>
<div class="container ad_font">
	<div >
		<h3>질문&답변</h3>
		<div id="adminAnswerView_Div">
			<div id="adminAnswerView_Subject">
				<h3>제목 : ${list.subject}</h3>
				<div id="adminAnswerViewDateDiv"><span>작성자 : ${list.username}</span> <br/><span> 작성일 : ${list.writedate}</span></div>
			</div>
			<!-- 1:1문의 내용 -->
			<div id="adminAnswerView_Content">
				내용
				${list.content}
			</div>
		</div>
		
	</div>
	답글달기
 	<div id="reply_Div">
 	<form id="replyFrm" method="post" action="">
		<textarea rows="5" cols="100%" id="answer"></textarea>
		<div style="text-align: right;float:right; margin-top:10px;">
			<a href="/gachi/adminAnswer"><button type="button" class="btn">목록</button></a>
			<button type="button" class="btn">삭제</button>
			<button class="btn" id="frm_submit">등록</button>
		</div>
	</form> 
	</div>
	
</div>