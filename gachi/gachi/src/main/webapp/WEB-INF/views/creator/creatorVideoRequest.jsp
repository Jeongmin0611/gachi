<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#cre_video_requestForm li{
		margin:5px 0px;
	}
</style>
<script type="text/javascript">
	$(()=>{
		CKEDITOR.replace("content");
	});
</script>
<div class="container">
	<h1>영상 변경 사항 요청</h1>
	<form method="post" action="">
	<ul id="cre_video_requestForm">
		<li>제목</li>
		<li><input type="text" id="" name="" size="70"/></li>
		<li>내용</li>
		<li><textarea name="content"></textarea></li>
	</ul>
	<div style="margin:20px 0px; text-align:center">
		<input type="submit" class="btn" value="변경사항요청"/>
		<input type="reset" class="btn" value="다시쓰기"/>
	</div>
	</form>
</div>