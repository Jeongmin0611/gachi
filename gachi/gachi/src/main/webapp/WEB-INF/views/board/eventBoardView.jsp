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
	padding:0;
}
#eventDetailReplyDiv li{
	float:left;
	min-height: 50px;
	border-bottom: 1px solid #e5e5e5;
	margin-bottom: 10px;
}
#eventDetailReplyDiv li:nth-child(4n+1){
	padding-left:5px;
	width: 10%;
}
#eventDetailReplyDiv li:nth-child(4n+2){
	width: 70%;
}
#eventDetailReplyDiv li:nth-child(4n+3){
	width: 15%;
}
#eventDetailReplyDiv li:nth-child(4n+4){
	width: 5%;
}

</style>
<div class="container cfont">
	<div >
		<h3 id="eventTitle">이벤트</h3>
		<div id="eventDetailDiv">
			<div id="eventDetailSubject">
				<p style="color:red; margin: 20px 0px;">${vo.event_category }</p>
				<h3>${vo.subject }</h3>
				<div id="eventDetailDateDiv"><span>작성일 | ${vo.writedate }</span> &nbsp; <span>이벤트기간 | ${vo.startdate }~${vo.enddate }</span></div>
			</div>
			<!-- 이벤트 내용 -->
			<div id="eventDetailContent">
				${vo.content }
			</div>
		</div>
		
	</div>
	<!-- 버튼 -->
	<div id="eventDetailBtnDiv">
		<button type="button" class="btn btn-light">목록</button>
	</div>
	<!-- 댓글 -->
	<form id="eventReplyForm"  method="post" action="/gachi/eventReplyFormOk">
		댓글<br/> <textarea rows="3" cols="90%" name="content"></textarea>
		<div><input type="submit" class="btn btn-outline-primary" value="등록"></div>
	</form>
	<!-- 댓글 리스트 -->
	<div>
		<ul id="eventDetailReplyDiv">
			<c:forEach var="list" items="${list }">
				<li>${list.nickname }</li>
				<li>${list.content }</li>
				<li>${list.sysdate }</li>
				<li><a href="#">삭제</a></li>
			</c:forEach>
		</ul>
	</div>
</div>