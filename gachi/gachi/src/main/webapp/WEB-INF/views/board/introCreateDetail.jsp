<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

/* 크리에이터 사진, sns계정 ul*/
#createDetailDiv{	
	min-height: 500px;
}
#createDetailSub1 {
	background: #FCE8E6;
	float: left;
	height: 100vh;
	
}
#createDetailSub1>li>img{
 	width: 100%;
}
#createDetailSub1+div {
	background-color: #F2F2F2;
	height: 100vh;
}
#createDetailSub1>li>a{
	text-decoration: none;
	color:black;
}
#createDetailSub1>li>a:hover, #createDetailSub1>li>a:active, #createDetailSub1>li>a:focus{
	font-weight: bold;
}

/* 크리에이터 소개 ul 끝*/
#CcreateMent{/*크리에이터 소개글*/
	padding: 20px;
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
	width: 100%;
	height: 150px;
}
</style>
<div class="container cfont">
	<div id="createDetailDiv" class="row">
		<ul id="createDetailSub1" class="col-sm-4">
			<li><img src="/gachi/img/business-woman.png" /></li>
			<li style="text-align: center; border-bottom: 1px solid gray">크리에이트 명</li>
			<li><img src="/gachi/img/business-woman.png" /></li>
			<li><a href="#">create@instagram</a></li>
			<li><a href="#">create@facebook</a></li>
		</ul>
		
		<!-- 크리에이터 소개글 -->
		<div id="CcreateMent" class="col-sm-8">크리에이터 소개글</div>
		
	</div>
	<!-- 개설한 클래스 -->
	<div id="createClass" >
		<h4>개설한 클래스</h4>
		<ul class="col-sm">
			<li>&nbsp;</li>
			<li>클래스명</li>
			<li>가격</li>
			
			<li><a href="#"><img src="/gachi/img/art1.jpg"/></a></li>
			<li><a href="#">곰인형 만들기</a></li>
			<li>100,000원</li>
		</ul>
	</div>
</div>