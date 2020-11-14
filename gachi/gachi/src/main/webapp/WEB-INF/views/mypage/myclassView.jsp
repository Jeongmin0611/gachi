<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	ol>li{list-style-type:decimal;}
	
	#myclassView{overflow:auto;margin:10px 50px 40px;}
	#myclassView>li{height:30px;overflow:hidden;margin:20px 10px;line-height:25px;}
	#myclassView>li:first-child{height:300px;float:left;}
	#myclassView>li:nth-child(2){float:left;}
	#myclassView>li:nth-child(3){font-size:2em;margin-left:0;}
	#myclassView>li:nth-child(4){float:clear;}
	#myclassView>li:nth-child(4){float:clear;}
	#myclassView>li:nth-child(7){height:50px;}
	#myclassView>li:last-child{height:50px;}
	#myclassView>li:last-child>button{width:50%;margin:0;}
	#myclassView>li:last-child>button:first-child{float:left;}

	/*클래스썸네일*/
	#myclassView img{width:400px;height:300px;object-fit:cover;}
	
	/*클래스 목차*/
	#myclassVideoLst label{font-size:1.5em;}
	
	#myclassVideoLst>ul>li>label{padding:0 20px;color:gray;width:100%;background-color:#F4BFA9;}
	#myclassVideoLst ol>li{line-height:20px;margin:20px 0;}
	#myclassVideoLst ol>li:last-child{margin-bottom:40px;}
	#myclassVideoLst ol label{float:right;color:gray;font-size:1em;margin-right:20px;}
	
	
</style>
<div class="container">
	<%@ include file="../inc/userProfile.jspf" %>
	<hr/>
	<ul id="myclassView">
		<li><img src="/gachi/img/test_image.jpg"/></li>
		<li><label class="badge badge-info">공예/창작</label></li>
		<li><label>카모마일 프랑스 자수</label></li>
		<li>크리에이터명 <a href="#">홍길동</a></li>
		<li><label>진도율 : 0.00%</label></li>
		<li><label>기한 : 20.11.01 ~ 21.01.31</label></li>
		<li><button type="button" class="btn btn-primary btn-block">수강하기</button></li>
		<li>
			<button type="button" class="btn btn-outline-primary btn-block">수강후기</button>
			<button type="button" class="btn btn-outline-primary btn-block">질문게시판</button>
		</li>
	</ul>
	<hr/>
	<div id="myclassVideoLst">
		<label>클래스 목차</label>
		<hr/>
		<ul>
			<li>
				<label>프랑스 자수 클래스 소개</label>
				<ol>
					<li><a href="/gachi/myclassVideo">프랑스 자수 클래스를 소개합니다!<label>02:00</label></a></li>
					<li><a href="/gachi/myclassVideo">클래스 준비물과 주의사항에 대해 알아볼까요?<label>04:00</label></a></li>
				</ol>
			</li>
			<li>
				<label>01 프랑스 자수의 기초</label>
				<ol>
					<li><a href="#">실을 다루는 방법과 매듭짓는 방법</a></li>
					<li><a href="#">작품에 사용될 5가지 스티치 연습하기</a></li>
				</ol>
			</li>
			<li>
				<label>02 베개 커버에 수놓기</label>
				<ol>
					<li><a href="#">곰돌이 수놓기1</a></li>
					<li><a href="#">곰돌이 수놓기2</a></li>
				</ol>
			</li>
			<li>
				<label>03 자수 블랭킷 만들기</label>
				<ol>
					<li><a href="#">블랭킷 도안선 그리고 위치잡기</a></li>
					<li><a href="#">달모양 수놓기</a></li>
					<li><a href="#">가글 보틀 수놓기</a></li>
					<li><a href="#">잠옷입은 곰돌이 수놓기</a></li>
					<li><a href="#">탁상조명 수놓기</a></li>
				</ol>
			</li>
			<li>
				<label>04 완성</label>
				<ol>
					<li><a href="#">세탁방법 알아보기</a></li>
					<li><a href="#">상쾌한 아침을 기다려요!</a></li>
				</ol>
			</li>
		</ul>
	</div>
	<hr/>
</div>