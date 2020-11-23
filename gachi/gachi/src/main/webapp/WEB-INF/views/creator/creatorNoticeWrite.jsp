<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
$(function(){
	CKEDITOR.replace("content");
});
</script>
<div class="container text-center cfont">
<h1>공지사항 글쓰기</h1>
<form method="post" action="#" enctype="multipart/form-data">
	<ul id="cr_notice_WriteForm">
		<li>
			제목 <input type="text" id="subject" name="subject" placeholder="제목입력" size="70"/> 
		</li>
		<li>
			<textarea name="content" id="content" style="width:70%; height:300px"></textarea> 
		</li>
		<li>
			첨부파일 <input type="file" name="filename" /> 
		</li>
		<li><input type="submit" value="등록"></li>
	</ul>
</form>
	
	
</div>