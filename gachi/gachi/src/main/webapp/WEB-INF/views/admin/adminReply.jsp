<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<h1>상품리뷰관리</h1>
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
			<li>리뷰검색</li>
			<li>
				<select>
					<option>상품코드</option>
					<option>상품명</option>
				</select>
				<input type="text" size="40"/>
				<input type="submit" class="btn" value="검색" />
			</li>
		</ul>
		</form>
	</div>
	<ul>
		<li></li>
	</ul>
</div>