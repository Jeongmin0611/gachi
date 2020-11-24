<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<script type="text/javascript">
	$(function(){
		$("#ad_1on1_write>li:lt(4)").css("width","50%");
		$("#ad_1on1_write>li").slice(5).css("width","100%");
		$("#ad_1on1_write>li input:lt(5)").css("width","40%");
		$("#ad_1on1_writeForm>li").css("width","100%");
		CKEDITOR.replace("content");
	});
</script>
<div class="container text-center ad_font">
	<h1>1:1문의</h1>
	<div style="margin:30px">
		<ul id="ad_1on1_write">
			<li> &nbsp;&nbsp;문의구분 &nbsp;
				<select>
					<option>스토어</option>
					<option>클래스/강의</option>
					<option>기타</option>
				</select>
			</li>
			<li> &nbsp;&nbsp;작성자 &nbsp;&nbsp; <input type="text" name="no" value="" readonly/></li>
		</ul>
	<form method="post" action="" enctype="mutipart/form-data">
		<input type="hidden" name="no" value="no"/>	
		<ul id="ad_1on1_writeForm">
			<li> &nbsp;&nbsp;제목 &nbsp;&nbsp; &nbsp;&nbsp;<input type="text" name="no" style="text-align:center; width:400px;"/></li>
			<li> <textarea name="content"></textarea></li>
			<li> &nbsp;&nbsp;첨부파일 <input type="file" name="inputFile"/> </li>
		</ul>
	</form>
	</div>
	<div id="ad_buttonArea">
		<input type="submit" class="btn" value="등록"/>
		<input type="reset" class="btn" value="다시쓰기"/>
	</div>
</div>