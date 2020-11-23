<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#cre_video_addArea{
		height:300px;
		margin-top:10px;
	}
	#cre_video_addList{
		border:1px solid gray;
		border-radius:10px;
		margin-top:10px;
		height:200px;
	}
	#cre_video_addList li:first-child{
		width:100%;
	}
	#cre_video_etc{
		overflow: auto;
		margin-top:20px;
	}
	.card{
		border-radius:10px;
	}
	img{
		width:200px; 
		height:200px;
		margin:auto;
	}
</style>
<script type="text/javascript">
	$(()=>{
		CKEDITOR.replace("content");
	});
</script>
<div class="container">
	<h1>영상등록요청</h1>
	<div class="card" id="cre_video_addArea">
		<img src="/gachi/img/add.png">
	</div>
	<ul id="cre_video_addList" style="height:200px">
		<li>&nbsp;&nbsp;영상등록목록</li>
	</ul>
	<div style="height:50px;margin-top:20px;" class="text-center">
		<form method="post"  action="">
		<select name="">
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
		<!-- 
		<div id="cre_video_etc" style="overflow:auto">
			*강좌 동영상 등록 시 참고할 사항을 기입해주세요.
			<textarea name="content"></textarea>
		</div>
		 -->
		<input type="submit" class="btn" value="등록요청"/>
		</form> 
	</div>
</div>