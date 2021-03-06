<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>

<style>
#cr_Approval_area {
	margin-bottom: 20px;
}

#cr_Approval_lst li {
	vertical-align: middle;
}

#cr_Approval_header li {
	vertical-align: middle;
	line-height: 50px;
}

select {
	height: 30px;
}
</style> 
<div class="container text-center ad_font">
<h3> 미승인 클래스</h3>
	<div id="cr_Approval_area">
		<form method="get" action="">
			<ul class="cr_Approval_menu">
				<li>
					<select>
						<option>전체</option>
						<option>카테고리</option>
						<option>최근순</option>
					</select>
					<select>
						<option>전체</option>
						<option>승인</option>
						<option>미승인</option>
					</select>
					<input type="text" id="searchWord" name="searchWord"/>
					<input type="submit" value="검색"/>
				</li>
			</ul>
		</form>
	</div>

	<div style="margin:50px 0;">
		<ul class="cr_Approval_header">
			<li>선택</li>
			<li>번호</li>
			<li>이미지</li>
			<li>카테고리</li>
			<li>클래스명</li>
			<li>신청일</li>
			<li>승인여부</li>
		</ul>
		<ul class="cr_Approval_lst">
			<li><input type="checkbox" id="" name=""/></li>
			<li>10</li>
			<li><img src="img/artEx/artEx01.PNG"></li>
			<li>미술</li>
			<li>초보자도 하기 쉬운 미술</li>
			<li>2020-10-29</li>
			<li>미승인</li>
			
			<li><input type="checkbox" id="" name=""/></li>
			<li>9</li>
			<li><img src="img/artEx/artEx02.PNG"></li>
			<li>미술</li>
			<li>초보자는 하기 어려운 미술</li>
			<li>2020-10-15</li>
			<li>미승인</li>
		</ul>
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