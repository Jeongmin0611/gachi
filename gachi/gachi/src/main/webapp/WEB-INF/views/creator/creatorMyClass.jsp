<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
 <style>
	 #cr_MyClass_area{
	 	margin-bottom:20px;
	 	border:1px solid gray;
	 	border-radius:10px;
	 	padding:5px;
	 	overflow:auto;
	 }
	 .cr_MyClass_header{
	 	margin-top:20px;
	 	border-top:3px solid #437299;
	 	border-left:3px solid #437299;
	 	border-right:3px solid #437299;
	 	border-radius:10px;
 		line-height:50px;
 		overflow: auto;
	 }
	 .cr_Classlist_menu{
		border:3px solid #437299;	
		border-radius: 10px; 
		margin:20px 0px;
	 }
	 .cr_Classlist_menu li{
		margin-top:5px;
		margin-bottom:5px;	 	
	 }
	 .cr_MyClass_list_menu{
	 	height:50px;
	 	margin-top:15px;
		margin-bottom:5px;
	 }
	 #paging{
	 	overflow: auto;
	 }
	 select{
	 	height:30px;
	 }
 </style> 
 <script>
 	$(()=>{
 		$(".cr_MyClass_lst li:nth-child(3)").css("padding","0");
 		$(".cr_MyClass_lst li:lt(8)").css("height","55px").css("lineHeight","50px");
 		
 	});
 </script>
 <div class="container text-center ad_font">
 	<h1>클래스 관리</h1>
		<form method="get" action="">
			<ul class="cr_Classlist_menu">
				<li>클래스검색</li>
				<li>
					<select>
						<option>클래스코드</option>
						<option>카테고리</option>
						<option>클래스명</option>
					</select>
					<input type="text" />		
				</li>
				<li>등록기간</li>
				<li>
					<select>
						<option>등록일</option>
						<option>신청일</option>
					</select>
					 <button class="btn">오늘</button>
					 <button class="btn">어제</button>
					 <button class="btn">3일</button>
					 <button class="btn">1주일</button>
					 <button class="btn">15일</button>
					 <button class="btn">1개월</button>
					 <button class="btn">3개월</button>
					 <button class="btn">6개월</button>
					 <input type="date"/>~
					 <input type="date"/>
				</li>
				<li>클래스상태</li>
				<li>
					<input type="radio" name="" checked/>전체
					<input type="radio" name=""/>승인대기
					<input type="radio" name=""/>승인검토
					<input type="radio" name=""/>개설완료
					<input type="radio" name=""/>강의종료
				</li>
				<li>
					<input type="submit" class="btn" value="검색">
					<input type="reset" class="btn" value="초기화">
				</li>
			</ul>
			<div style="text-align:center">
				
			</div>
		</form>
	<ul class="cr_MyClass_lst">
		<li>선택</li>
		<li>클레스코드</li>
		<li>이미지</li>
		<li>카테고리</li>
		<li>클래스명</li>
		<li>신청일</li>
		<li>등록일</li>
		<li>상태</li>
	
	
	
	
		<li><input type="checkbox" id="" name=""/></li>
		<li>cla1546484</li>
		<li><img src="img/artEx/artEx03.PNG"></li>
		<li>미술</li>
		<li>초보자도 하기 쉬운 미술</li>
		<li>2020-10-22</li>
		<li>2020-10-29</li>
		<li>승인대기</li>
		
		<li><input type="checkbox" id="" name=""/></li>
		<li>cla1546484</li>
		<li><img src="img/artEx/artEx04.PNG"></li>
		<li>미술</li>
		<li>초보자는 하기 어려운 미술</li>
		<li>2020-10-08</li>
		<li>2020-10-15</li>
		<li>개설완료</li>
	</ul>
	<div class="cr_MyClass_list_menu">
		<button onclick="location.href='/gachi/creatorMyClassWrite'" class="btn">강좌개설신청</button>
		<button class="btn">종료신청</button>
	</div>
<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<li class="btn"><a class="btn" href="#">Prev</a></li>
			<li><a href="#" class="paging_num">1</a></li>
			<li><a href="#" class="paging_num">2</a></li>
			<li><a href="#" class="paging_num">3</a></li>
			<li><a href="#" class="paging_num">4</a></li>
			<li><a href="#" class="paging_num">5</a></li>
			<li class="btn"><a class="btn" href="#">Next</a></li>
	</ul>
</div>
</div>