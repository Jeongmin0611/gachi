<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#cre_video_addArea,#cre_video_addList,#cre_video_etc{
		width:80%;
		margin:0 auto;
	}
	#cre_video_addArea{
		height:300px;
		margin-top:10px;
	}
	#cre_video_addList{
		margin-top:10px;
		height:200px;
	}
	.form-control{
		width:80%;
		margin:0 auto;
	}
	#cre_video_etc{
		overflow: auto;
		margin-top:20px;
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
		<img src="">
	</div>
	<div id="cre_video_addList" class="card" style="height:200px">
		영상등록목록
	</div>
	<div class="text-center">
		<form method="post"  action="">
		<select name="" class="form-control">
			<option>공예/창작</option>
			<option>요리</option>
			<option>미술</option>
			<option>음악</option>
			<option>라이프스타일</option>
			<option>운동</option>
			<option>사진/영상</option>
		</select>
		<select name="" class="form-control">
			<option>이불에 지도그리기</option>
			<option>a4용지에 지도그리기</option>
			<option>벽에 지도그리기</option>
		</select>
		<div id="cre_video_etc" style="overflow:auto">
			*강좌 동영상 등록 시 참고할 사항을 기입해주세요.
			<textarea name="content"></textarea>
		</div>
		<input class="form-control"type="submit" value="등록요청"/>
		</form> 
	</div>
</div>