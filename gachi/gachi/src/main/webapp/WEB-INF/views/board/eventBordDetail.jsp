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
	height:500px;
}
form{
	margin: 20px 0; 
	float: left;
}
form [type=button]{
	border: 0px;
	background-color: #f2f2f2;
}
/*버튼*/
#eventDetailBtnDiv{
	clear: both;
	margin: 20px 0;
	background-color: oragin;
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
	<form>
		댓글 <textarea rows="3" cols="120"></textarea>
		<input type="button" value="등록" style="height: 50px; text-align: center;"/>
	</form>
</div>