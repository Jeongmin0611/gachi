<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	/*내학습표 상단*/
	#myclassMain{overflow:auto;margin-bottom:200px;}
	#myclassTop{margin:10px;overflow:auto;}
	#myclassTop>li{float:left;margin:0 5px;}
	#myclassTop>li:last-child{float:right;}
	
	#myclassLst{overflow:auto;margin-bottom:40px;}
	#myclassLst>li{margin:0 50px;line-height:25px;}
	#myclassLst>li:first-child{margin-top:20px;float:left;}
	#myclassLst>li:nth-child(2){margin-top:30px;}
	#myclassLst>li:nth-child(5){float:left;margin-left:0;}
	#myclassLst>li:nth-child(6){float:left;margin-left:0;}
	
	/*클래스썸네일*/
	#myclassLst img{width:200px;height:150px;object-fit:cover;}
	
</style>
<div class="container" id="myclassMain">
	<%@ include file="../inc/userProfile.jspf" %>
	<ul id="myclassTop">
		<li>
			<select name="sortKey1">
				<option value="최근순">최근순</option>
				<option value="제목순">제목순</option>
			</select>
		</li>
		<li>
			<select name="sortKey2">
				<option value="전체">전체</option>
				<option value="수강중" selected>수강중</option>
				<option value="수강완료">수강완료</option>
			</select>
		</li>
		<li>
			<input type="text" name="searchWord"/>
			<button type="button" class="btn btn-outline-primary btn-sm">검색</button>
		</li>
	</ul>
	<hr/>
	<ul id="myclassLst">
		<li><a href="/gachi/myclassView"><img src="/gachi/img/test_image.jpg"/></a></li>
		<li><span class="badge badge-info">공예/창작</span></li>
		<li>클래스명 <a href="/gachi/myclassView">카모마일 프랑스 자수</a></li>
		<li>크리에이터명 <a href="#">홍길동</a></li>
		<li>진도율 : 0.00%</li>
		<li>기한 : 20.11.01 ~ 21.01.31</li>
		<li id="mypageMainBtn1"><button type="button" class="btn btn-primary btn-sm">▶</button></li>
	</ul>
	<hr/>
</div>