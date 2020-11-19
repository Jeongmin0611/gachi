<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#cre_video_lst li{
		width:8%;
		float:left;
		height:50px;
		text-align:center;
		border:1px solid gray;
	}
	#cre_video_lst li:nth-child(7n+2),#cre_video_lst li:nth-child(7n+4){
		width:14%;
	}
	#cre_video_lst li:nth-child(7n+3),#cre_video_lst li:nth-child(7n+5){
		width:21%;
	}
</style>
<div class="container">
	<h1>동영상 관리</h1>
	<div>
		<select name="">
			<option>전체</option>
			<option>공예/창작</option>
			<option>요리</option>
			<option>미술</option>
			<option>음악</option>
			<option>라이프스타일</option>
			<option>운동</option>
			<option>사진/영상</option>
		</select>
		<select name="">
			<option>이불에 지도그리기</option>
			<option>a4용지에 지도그리기</option>
			<option>벽에 지도그리기</option>
		</select>
		<input type="submit" value="검색"/>
	</div>
	<div>
		<ul id="cre_video_lst">
			<li>동영상코드</li>
			<li>카테고리</li>
			<li>클래스명</li>
			<li>차시명</li>
			<li>동영상명</li>
			<li>영상길이</li>
			<li>등록일</li>
			
			<li>vid1234</li>
			<li>미술</li>
			<li>이불에 지도그리기</li>
			<li>기본편</li>
			<li>영등포시장에 가서 이불을 구입해보자!</li>
			<li>15:46</li>
			<li>2020-11-16</li>
			
			<li>vid1234</li>
			<li>미술</li>
			<li>이불에 지도그리기</li>
			<li>기본편</li>
			<li>영등포시장에 가서 이불을 구입해보자!</li>
			<li>15:46</li>
			<li>2020-11-16</li>
			
			<li>vid1234</li>
			<li>미술</li>
			<li>이불에 지도그리기</li>
			<li>기본편</li>
			<li>영등포시장에 가서 이불을 구입해보자!</li>
			<li>15:46</li>
			<li>2020-11-16</li>
		</ul>	
	</div>
</div>