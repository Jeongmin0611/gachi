<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#eventContentDiv{
	text-align: center;
	overflow: auto;
}
#eventContentDiv img{
	width: 600px;
	height: 450px;
	margin: 10px auto;
}
#eventDate{
	width:100%;
	float:right;
	text-align:right;
}
#eventTxt{
	float:left;
	margin-left: 80px;
}
form{
	margin: 20px 0; 
	float: left;
}
form [type=button]{
	border: 0px;
	background-color: #f2f2f2;
}
</style>
<div class="container">
	<div id="eventContentDiv">
		<h3>이벤트 제목</h3>
		<span id="eventDate">2020-10-02</span><br/>
		<img src="/gachi/img/art1.jpg"/><br/>
		<span id="eventTxt">
			<strong>이벤트 내용</strong><br/>
			이벤트<br/>이벤트<br/>
			이벤트<br/>이벤트<br/>
		</span>
	</div>
	<!-- 댓글 -->
	<form>
		댓글 <textarea rows="3" cols="120"></textarea>
		<input type="button" value="등록" style="height: 50px; text-align: center;"/>
	</form>
</div>