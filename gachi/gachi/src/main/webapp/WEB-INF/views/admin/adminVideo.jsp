<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container ad_font">
	<h1>동영상 관리</h1>
	<div id="ad_video_searchArea">
		<form method="post" action="">
		<ul id="ad_video_searchList">
			<li>
				카테고리
			</li>
			<li>
				<select>
					<option selected>전체</option>
					<option>공예/창작</option>
					<option>요리</option>
					<option>미술</option>
					<option>음악</option>
					<option>라이프스타일</option>
					<option>운동</option>
					<option>사진/영상</option>
				</select>	
			</li>
			<li>
				등록일
			</li>
			<li> 
			   <input type="date"/>&nbsp;~
			   <input type="date"/>
			</li>
			<li>영상검색</li>
			<li>
				<select>
					<option>동영상코드</option>
					<option>강좌명</option>
					<option>동영상파일명</option>
					<option>클래스코드</option>
					<option>클래스명</option>
					<option>크리에이터닉네임</option>
				</select>
				<input type="text" size="40"/>
				<input type="submit" class="btn" value="검색" />
			</li>
		</ul>
		</form>
	</div>
	<div id="ad_video_lstArea">
		<ul id="ad_video_Lst">
			<li>&nbsp;</li>
			<li>동영상코드</li>
			<li>강좌명</li>
			<li>목차명</li>
			<li>목차순서</li>
			<li>영상명</li>
			<li>파일명</li>
			<li>크리에이터</li>
			<li>영상길이</li>
			<li>등록일</li>
			
			<c:forEach var="vo" items="${vlist}">
				<li><input type="checkbox"/></li>
				<li>${vo.video_code}</li>
				<li>${vo.class_name}</li>
				<li>${vo.unit_content}</li>
				<li>${vo.section_index}</li>
				<li>${vo.video_name}</li>
				<li>${vo.video_filename}</li>
				<li>${vo.nickname}</li>
				<li>${vo.video_length}</li>
				<li>${vo.enroll_date}</li>
			</c:forEach>
		</ul>
	</div>
	<div class="ad_list_menu">
		<button class="btn" onclick="location.href='/gachi/adminVideoWrite'">등록</button>
		<button class="btn">삭제</button>
		<button class="btn">수정</button>
	</div>
</div>