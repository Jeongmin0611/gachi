<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#noticeTitle{
	margin-top:50px;
}

/* 공지사항 상단 제목, 날짜 */
#noticeDetailDiv{
	border-top:2px solid black;
	border-bottom:1px solid #E5E5E5;
}
#noticeDetailSubject{
	border-bottom:1px solid #E5E5E5;
}
#noticeDetailDateDiv{
	margin: 10px 0;
}
/* 공지사항 상단 제목, 날짜 끝*/

/* 공지사항 상세 내용*/
#noticeDetailContent{
	min-height: 500px;
	overflow:auto;
	padding: 20px;
	font-weight: 600px;
}
#noticeDetailContent img{
	width: 100%;
}
/* 공지사항 상세 내용 끝*/

/*버튼*/
#noticeDetailBtnDiv{
	clear: both;
	margin: 20px 0;
	background-color: oragin;
}

</style>
<div class="container cfont">
	<div >
		<h3 id="noticeTitle">공지사항</h3>
		<div id="noticeDetailDiv">
			<div id="noticeDetailSubject">
				<h3 style="margin-top:20px ">${vo.subject }</h3>
				<div id="noticeDetailDateDiv"><span>${vo.writer }</span> <span>${vo.writedate }</span></div>
			</div>
			<!-- 이벤트 내용 -->
			<div id="noticeDetailContent">
				${vo.content }
			</div>
		</div>
		
	</div>
	<!-- 버튼 -->
	<div id="noticeDetailBtnDiv">
		<a href="/gachi/noticeBoard"><button type="button" class="btn btn-light">목록</button></a>
	</div>	
</div>