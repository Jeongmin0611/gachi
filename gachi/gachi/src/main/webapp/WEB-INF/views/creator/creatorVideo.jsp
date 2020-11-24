<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#cre_video_lst li{
		width:8%;
		float:left;
		height:50px;
		line-height:50px;
		text-align:center;
		border:1px solid gray;
	}
	#cre_video_lst li:nth-child(8n+3){
		width:20%;
	}
	#cre_video_lst li:nth-child(8n+5){
		width:32%;
	}
	#cre_video_searchForm{
		margin:30px 0px;
		text-align: center;
	}
	#cre_video_info{
		border:1px solid #437299;
		margin:20px 0px;
		height:300px;
		font-size:1.2em;
		display: none;
	}
	#cre_video_info ul{
		margin:15px 0px;
		float:left;
		height:300px;
	}
	#cre_video_info ul:first-child{
		text-align: center;
	}
	#cre_video_info ul:last-child>li{
		float:left;
		height:50px;
		line-height:50px;
	}
	#cre_video_info ul:last-child>li:nth-child(2n+1){
		width:20%;
	}
	#cre_video_info ul:last-child>li:nth-child(2n){
		width:80%;
	}
	button{
		background-color: #437299;
		 -webkit-appearance: none;
  		 -webkit-border-radius: 0;
	}
	.container{
		font-family: 'NanumBarunpen';
	}
</style>
<script>
	$(()=>{
		$("#cre_video_lst a").click(()=>{
			$("#cre_video_info").css("display","block");
		});
	});
</script>
<div class="container ad_font">
	<h1>동영상등록현황</h1>
	<div id="cre_video_info">
		<ul style="width:40%;">
			<li style="margin-bottom:10px;">동영상 썸네일</li>
			<li><img src="/gachi/img/147.jpg"/></li>
		</ul>
			<ul style="width:60%">
				<li>클래스 명:</li>
				<li>이불에 지도그리기</li>
				<li>차시명:</li>
				<li>기본편</li>
				<li>영상제목 : </li>
				<li>영등포시장에 가서 이불을 구입해보자.mp4</li>
				<li>영상길이 :</li>
				<li>총 15분 46초</li>
				<li>등록일 :</li>
				<li>2020년 11월 16일</li>
			</ul>
	</div>
	<div id="cre_video_searchForm">
		<h3>크리에이터 '밥아저씨'님의 영상강좌</h3><br/>
		<form method="post" action="" class="form-horizontal">
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
			<input type="submit" class="btn" value="검색" />
		</form>
		<div style="margin:10px 0px;">
			<button class="btn" onclick="location.href='/gachi/creatorVideoWrite'">클래스영상등록</button>
			<button class="btn" onclick="location.href='/gachi/creatorVideoRequest'">영상변경사항요청</button>
		</div>
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
			<li>영상정보</li>
			
			<li>vid1234</li>
			<li>미술</li>
			<li>이불에 지도그리기</li>
			<li>기본편</li>
			<li>영등포시장에 가서 이불을 구입해보자!</li>
			<li>15:46</li>
			<li>2020-11-16</li>
			<li><a href="#">영상정보</a></li>
			
			<li>vid1234</li>
			<li>미술</li>
			<li>이불에 지도그리기</li>
			<li>기본편</li>
			<li>영등포시장에 가서 이불을 구입해보자!</li>
			<li>15:46</li>
			<li>2020-11-16</li>
			<li>영상정보</li>
			
			<li>vid1234</li>
			<li>미술</li>
			<li>이불에 지도그리기</li>
			<li>기본편</li>
			<li>영등포시장에 가서 이불을 구입해보자!</li>
			<li>15:46</li>
			<li>2020-11-16</li>
			<li>영상정보</li>
		</ul>	
	</div>
</div>