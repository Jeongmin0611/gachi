<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<style>

/* 크리에이터 사진, sns계정 ul*/
#createDetailDiv{
	min-height: 500px;
	margin-top: 50px;
}
#createDetailSub1 {
	background: #FCE8E6;
	float: left;
	margin: 0;
	padding:20px;
}
#createDetailSub1>li>img{
 	width: 100%;
}
#createDetailSub1+div {
	background-color: #F2F2F2;
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
}
#createClass li{
	float:left;
	border-top: 2px solid #eee;
	width: 15%;	
	height: 150px;
	padding: 5px;
}
#createClass li:nth-child(3n+2){
	width: 70%;
}
#createClass li img{
	width: 100%;
	height: 160px;
}
#createClass li:nth-child(1), #createClass li:nth-child(2), #createClass li:nth-child(3){
	height: 30px;
	line-height: 30px;
	padding:0;
}
</style>
<div class="container cfont" style="height: auto;">
	<div id="createDetailDiv" class="row">
		<ul id="createDetailSub1" class="col-sm-4">
			<li><img src="/gachi/img/creator/${vo.picture }"/></li>
			<li style="text-align: center; border-bottom: 1px solid #bbb; margin:2px 0;">${vo.nickname }</li>
			<li style="word-wrap:break-word">
				<a href="${vo.sns_addr }" target="_blank">
					<c:set var="sns_addr" value="${vo.sns_addr }"></c:set>
						<c:if test="${fn:contains(sns_addr,'instagram.com') }">
							<img src="/gachi/img/instagram.png" style="height: 30px;"/>
						</c:if>
						<c:if test="${fn:contains(sns_addr,'facebook.com') }">
							<img src="/gachi/img/facebook.png" style="height: 30px;"/>
						</c:if>
					<c:set var="sns" value="${fn:substringAfter(sns_addr,'.com/') }"></c:set>
					 ${sns}
			 	</a>
			</li>
		</ul>
		
		<!-- 크리에이터 소개글 -->
		<div id="CcreateMent" class="col-sm-8">${vo.creator_info }</div>
	</div>
	<!-- 개설한 클래스 -->
	<div id="createClass" class="row" >
		<h4 class="col-sm-12">개설한 클래스</h4>
		<ul class="col-sm-12">
			<li>&nbsp;</li>
			<li>클래스명</li>
			<li>가격</li>
			<c:forEach var ="list" items="${list}">
				<li><a href="/gachi/classView?code=${list.code }"><img src="/gachi/upload/classImg/${list.class_img }"/></a></li>
				<li><a href="/gachi/classView?code=${list.code }">${list.class_name }</a></li>				
				<li><fmt:formatNumber value="${list.real_price }" pattern="#,###"/>원</li>
			</c:forEach>
		</ul>
	</div>
</div>