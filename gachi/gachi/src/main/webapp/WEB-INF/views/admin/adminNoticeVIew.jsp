<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#eventTitle{
	margin-top:50px;
}

/* 1:1문의 상단 제목, 날짜 */
#adminNoticeView_Div{
	border-top:2px solid black;
	border-bottom:1px solid #E5E5E5;
}
#adminNoticeView_Subject{
	border-bottom:1px solid #E5E5E5;
}
#adminNoticeView_DateDiv{
	margin: 10px 0;
}
/* 1:1문의 상단 제목, 날짜 끝*/

/* 1:1문의 상세 내용*/
#adminNoticeView_Content{
	min-height: 500px;
	overflow:auto;
	text-align:center;
	padding: 50px;
	border: 3px solid #437299;
	border-radius: 10px;
}
/* 1:1문의 상세 내용 끝*/
/* 댓글 입력 폼*/
#adminNoticeView_ReplyForm{
	width:100%;
	margin: 20px 0; 
	float: left;
}
#adminNoticeView_ReplyForm>textarea{
	width:100%;
	resize:none;
}
#adminNoticeView_ReplyForm>div{
	float:right;
}
/* 댓글 입력 폼 끝*/
/*버튼*/
#adminNoticeView_BtnDiv{
	clear: both;
	margin: 10px 0;
	background-color: oragin;
}
/*댓글 리스트*/
#adminNoticeView_ReplyDiv{
	clear: both;
	overflow: auto;
	margin-bottom: 50px;
	border:3px solid #437299;
	border-radius: 10px;
	overflow: auto;
}
#adminNoticeView_ReplyDiv li{
	float:left;
	line-height:50px;
	border-bottom: 1px solid gray;
	margin-bottom: 10px;
}
#adminNoticeView_ReplyDiv li:nth-child(4n+1){
	padding-left:5px;
	width: 13%;
}
#adminNoticeView_ReplyDiv li:nth-child(4n+3){
	width: 10%;
}
#adminNoticeView_ReplyDiv li:nth-child(4n+4){
	width: 7%;
}
#adminNoticeView_ReplyDiv li:nth-child(4n+2){
	width: 70%;
}
</style>
<script type="text/javascript">
	$(()=>{
		$("#del").click(()=>{
			if(confirm('해당 공지사항을 정말로 삭제하시겠습니까?')){
				location.href='/gachi/adminNoticeDel?notice_num='+${vo.notice_num}+'&nowPage='+${nowPage}	
			}
		});
	});
</script>
<div class="container ad_font">
	<div >
		<h3>공지사항</h3>
		<div id="adminNoticeView_Div">
			<div id="adminNoticeView_Subject">
				<h3>${vo.subject}</h3>
				<div id="admin1on1View_DateDiv"><span>${vo.writer}</span> <span>${vo.writedate}</span></div>
			</div>
			<!-- 1:1문의 내용 -->
			<div id="adminNoticeView_Content">
				${vo.content}
			</div>
		</div>
		
	</div>
	<!-- 버튼 -->
	<div id="adminNoticeView_BtnDiv" style="width:50%;float:left;">
		<a href="/gachi/adminNotice?nowPage=${nowPage}"><button type="button" class="btn">목록</button></a>
	</div>
	<div style="text-align: right;width:50%;float:left; margin-top:10px;">
		<a href="/gachi/adminNoticeEdit?notice_num=${vo.notice_num}&nowPage=${nowPage}"><button type="button" class="btn">수정</button></a>
	<button type="button" id="del" class="btn">삭제</button>
	</div>
</div>