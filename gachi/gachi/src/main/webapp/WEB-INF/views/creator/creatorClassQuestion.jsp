<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
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
	<div style="text-align:center">
		<input type="submit" value="검색">
		<input type="reset" value="초기화">
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
		<li><button>답변하기</button></li>
	</ul>
</div>