<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		$("#ad_1on1_view>li:lt(4)").css("width","50%");
		$("#ad_1on1_view>li").slice(5).css("width","100%");
		$("#ad_1on1_view>li input:lt(5)").css("width","40%");
		$("#ad_1on1_writeForm>li").css("width","100%");
		CKEDITOR.replace("content");
	});
</script>
<div class="container text-center">
<h1>1:1문의</h1>
<ul id="ad_1on1_view">
	<li>글번호 <input type="text" name="no" value="" readonly/></li>
	<li>작성자 <input type="text" name="no" value="" readonly/></li>
	<li>문의구분 <input type="text" name="no" value="" readonly/></li>
	<li>등록일 <input type="text" name="no" value="" readonly/></li>
	<li><span class="content_center">제목 <input type="text" name="no" value="" size="200" readonly/></span></li>
	<li>내용 <textarea readonly></textarea></li>
	<li>첨부파일 <input type="text" name="no" value="" readonly/> </li>
</ul>
<h1>1:1문의</h1>
<form method="post" action="" enctype="mutipart/form-data">
<ul id="ad_1on1_writeForm">
	<input type="hidden"/>
	<li>문의구분 <input type="text" name="no" /></li>
	<li>제목 <input type="text" name="no" /></li>
	<li>내용 <textarea name="content"></textarea></li>
	<li>첨부파일 <input type="file" name="inputFile"/> </li>
</ul>
<div id="ad_buttonArea">
	<input type="submit" value="등록"/>
	<input type="reset" value="다시쓰기"/>
</div>
</form>
</div>