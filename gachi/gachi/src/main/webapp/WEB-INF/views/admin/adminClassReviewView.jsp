<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#eventTitle{
	margin-top:50px;
}

/* 1:1문의 상단 제목, 날짜 */
#adminClassReviewView_Div{
	border-top:2px solid black;
	border-bottom:1px solid #E5E5E5;
}
#adminClassReviewView_Subject{
	border-bottom:1px solid #E5E5E5;
}
#adminClassReviewView_DateDiv{
	margin: 10px 0;
	float : right;
}
/* 1:1문의 상단 제목, 날짜 끝*/

/* 1:1문의 상세 내용*/
#adminClassReviewView_Content{
	min-height: 500px;
	overflow:auto;
	text-align:center;
	padding: 50px;
	border: 3px solid #437299;
	border-radius: 10px;
	margin-top:70px;
}
/* 1:1문의 상세 내용 끝*/

/*버튼*/
#adminClassReviewView_BtnDiv{
	clear: both;
	margin: 10px 0;
	background-color: oragin;
}

</style>
<div class="container ad_font">
	<div >
		<h3>클래스 수강평</h3>
		<div id="adminClassReviewView_Div">
			<div id="adminClassReviewView_Subject">
				<br/>
				<h3>제목 : ${list.subject}</h3>
				<div id="adminClassReviewView_DateDiv"><span>작성자 : ${list.username}</span><br/> <span>작성일 : ${list.writedate}</span></div>
			</div>
			<!-- 1:1문의 내용 -->
			<div id="adminClassReviewView_Content">
				${list.content}
			</div>
		</div>
		
	</div>
	<!-- 버튼 -->
	<div id="adminClassReviewView_BtnDiv" style="width:50%;float:right;">
<!-- 		<button type="button" class="btn">이전</button>
		<button type="button" class="btn">다음</button> -->
		<a href="/gachi/adminClassReview"><button type="button" class="btn">목록으로</button></a>
	</div>
<%-- 	<div style="text-align: right;width:50%;float:left; margin-top:10px;">
		<a href="/gachi/adminNoticeDel?num=${list.num}"><button type="button" class="btn">삭제</button></a>
	</div> --%>
</div>