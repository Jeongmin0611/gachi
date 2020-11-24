<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#ad_video_lstArea li{
		float:left;
		width:10%;
		height:40px;
		line-height:40px;
		border-bottom:1px solid gray;
		text-align:center;
	}
	#ad_video_lstArea li:nth-child(8n+4),#ad_video_lstArea li:nth-child(8n+5){
		width:20%;
	}
</style>
<div class="container ad_font">
	<h1>수강평 관리</h1>
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
			<li>평점</li>
			<li>
				<select>
					<option>5</option>
					<option>4.5</option>
					<option>4</option>
					<option>3.5</option>
					<option>3</option>
					<option>2.5</option>
					<option>2</option>
					<option>2.5</option>
					<option>2</option>
					<option>1.5</option>
					<option>1</option>
				</select>
			</li>
			<li>수강평검색</li>
			<li>
				<select>
					<option>클래스코드</option>
					<option>클래스명</option>
					<option>제목</option>
					<option>내용</option>
				</select>
				<input type="text" size="40"/>
				<input type="submit" class="btn" value="검색" />
			</li>
		</ul>
		</form>
	</div>
	<ul id="ad_video_lstArea">
		<li>번호</li>
		<li>상품코드</li>
		<li>상품명</li>
		<li>제목</li>
		<li>내용</li>
		<li>평점</li>
		<li>작성자</li>
		<li>작성일</li>
		
		<li>번호</li>
		<li>상품코드</li>
		<li>상품명</li>
		<li class="wordCut">제목</li>
		<li class="wordCut">내용</li>
		<li>평점</li>
		<li>작성자</li>
		<li>작성일</li>
	</ul>
</div>