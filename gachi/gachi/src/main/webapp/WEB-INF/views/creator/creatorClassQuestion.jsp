<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.btn{
		background-color: #437299;
		color:white;
	}
	#cre_classQuestion_lst li{
		border:1px solid gray;
		text-align: center;
		height:50px;
		line-height: 50px;
	}
</style>
<div class="container ad_font">
<h1>클래스 문의</h1>
<form method="post" action="">
<ul id="ad_order_searchForm">
		<li>카테고리</li>
		<li>
			<select>
				<option>미술</option>
				<option>공예/창작</option>
				<option>라이프스타일</option>
			</select>	
		</li>
		<li>클래스명</li>
		<li>
			<select>
				<option>이불에 지도그리기</option>
				<option>a4용지에 지도그리기</option>
				<option>철조망에 지도그리기</option>
			</select>
			<input type="text"/>		
		</li>
	</ul>
	<div style="text-align:center;margin:10px 0px;">
		<input type="submit" class="btn" value="검색">
		<input type="reset" class="btn" value="초기화">
	</div>
</form>
	<ul id="cre_classQuestion_lst" class="table">
		<li>글번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		<li>답변여부</li>
		
		<li>123</li>
		<li>이불에 지도를 진하게 어떻게 그리나요?</li>
		<li>홍길동</li>
		<li>2020-07-21</li>
		<li>122</li>
		<li><a href="#">답변하기</a></li>
	</ul>
	<div id="paging">
	<ul style="margin-top:50px">
		<li>prev</li>
		<li>1</li>
		<li>2</li>
		<li>3</li>
		<li>4</li>
		<li>5</li>
		<li>next</li>
	</ul>
</div>
</div>