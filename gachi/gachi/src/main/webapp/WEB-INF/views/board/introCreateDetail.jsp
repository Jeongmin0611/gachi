<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.container {
	margin-top: 40px;
}

#createDetailSub1 {
	width: 20%;
	background: #FCE8E6;
	padding: 0px 5%;
	float: left;
	height: 100vh;
}
#createDetailSub1>li>img{
	margin: 10px;
 	width: 100px;
}

#createDetailSub1+div {
	background-color: #F2F2F2;
	height: 100vh;
}
/* 개설한 클래스 */
#createClass{
	clear:left;
	margin:30px 0;
	overflow: auto;
}
#createClass li{
	float:left;
	border-top: 2px solid #eee;
	width: 15%;
	padding:5px;
}
#createClass li:nth-child(3n+2){
	width: 70%;
}
#createClass li img{
	width: 150px;
	height: 150px;
}
</style>
<div class="container cfont">
	<div id="createDetailDiv">
		<ul id="createDetailSub1">
			<li><img src="/gachi/img/client.png" /></li>
			<li>크리에이트 명</li>
			<li><a href="#">create@instagram</a></li>
			<li><a href="#">create@facebook</a></li>
		</ul>
		<!-- 크리에이터 소개글 -->
		<div id="CcreateMent">크리에이터 소개글</div>
		
	</div>
	<!-- 개설한 클래스 -->
	<div id="createClass">
		<h4>개설한 클래스</h4>
		<ul>
			<li>&nbsp;</li>
			<li>클래스명</li>
			<li>가격</li>
			
			<li><a href="#"><img src="/gachi/img/art1.jpg"/></a></li>
			<li><a href="#">곰인형 만들기</a></li>
			<li>100,000원</li>
		</ul>
	</div>
</div>