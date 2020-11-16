<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>

 <style>
 #cr_MyClass_area{margin-bottom:20px;}
 #cr_MyClass_lst li{vertical-align:middle;}
 #cr_MyClass_header li{vertical-align:middle;line-height:50px;}
 select{height:30px;}
 </style> 
 
 <div class="container text-center cfont">
<h1 style="margin:50px 0;"> 내 클래스 </h1>
	<div id="cr_MyClass_area">
		<form method="get" action="">
			<ul class="cr_Classlist_menu">
	
				<li>
					<select>
						<option>전체</option>
						<option>카테고리</option>
						<option>최근순</option>
					</select>
					<select>
						<option>전체</option>
						<option>개설중</option>
						<option>종료</option>
					</select>
					<input type="text" id="searchWord" name="searchWord"/>
					<input type="submit" value="검색"/>
				</li>
			</ul>
		</form>
	</div>
	<ul class="cr_MyClass_header">
	<li>선택</li>
		<li>번호</li>
		<li>이미지</li>
		<li>카테고리</li>
		<li>클래스명</li>
		<li>등록일</li>
		<li>상태</li>
	</ul>
	<ul class="cr_MyClass_lst">
		<li><input type="checkbox" id="" name=""/></li>
		<li>10</li>
		<li><img src="<%=request.getContextPath()%>/img/147.jpg"></li>
		<li>미술</li>
		<li>초보자도 하기 쉬운 미술</li>
		<li>2020-10-29</li>
		<li>개설중</li>
		
		<li><input type="checkbox" id="" name=""/></li>
		<li>9</li>
		<li><img src="<%=request.getContextPath()%>/img/147.jpg"></li>
		<li>미술</li>
		<li>초보자는 하기 어려운 미술</li>
		<li>2020-10-15</li>
		<li>종료</li>
	</ul>
	<div class="cr_MyClass_list_menu">
		<button class="btn btn-info">종료신청</button>
	</div>
	<div id="paging">
		<ul>
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