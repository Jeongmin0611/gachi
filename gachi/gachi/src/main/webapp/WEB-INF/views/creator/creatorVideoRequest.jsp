<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	input[type=submit],input[type=reset]{
		background-color: #437299;
	  	text-align: center;
    	text-decoration: none;
    	display: inline-block;
		border-radius: 5px;
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
	<ul >
		<li>제목</li>
		<li><input type="text" id="" name=""/></li>
		<li>내용</li>
		<li><textarea name="content"></textarea></li>
	</ul>
	<div style="text-align:center">
		<input type="submit" value="변경사항요청"/>
		<input type="reset" value="다시쓰기"/>
	</div>
	</form>
</div>