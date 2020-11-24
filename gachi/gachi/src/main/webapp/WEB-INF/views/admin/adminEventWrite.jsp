<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<script type="text/javascript">
	$(function(){
		$("#ad_event_writeForm div").css("float","left").css("height","300px");
		$("#ad_event_writeForm li").css("margin","5px 0px");
		$("#ad_event_writeForm>div:first-child").css("width","50%");
		$("#ad_event_writeForm>div:last-child").css("width","50%");
		$("#ad_event_memo li").css("margin-bottom","10px");
		$("textarea").css("width","100%");
		CKEDITOR.replace("content");
	});
</script>
<div class="container">
<h1 class="content_center">이벤트 등록</h1>
<form method="post" action="" enctype="multipart/form-data">
	<div id="ad_event_writeForm">
		<div class="content_center">
			<ul>
				<li>제목 <input type="text" name="no" value="" size="50"/></li>
				<li>시작일 <input type="date" name="no" size="50"/></li>
				<li>종료일 <input type="date" name="no" size="50"/></li>
			</ul>
		</div>
		<div class="content_center">
			<ul>
				<li>썸네일</li>
				<li><img src="<%=request.getContextPath()%>/img/147.jpg"></li>
				<li><input type="file" name="no"/></li>
			</ul>
		</div>
	</div>
	<ul id="ad_event_memo">
		<li style="font-size:1.5em">이벤트 내용</li>
		<li><textarea name="content"></textarea></li>
		<li>첨부파일 <input type="file" name="no"/> </li>
		<li class="content_center">
			<input type="submit" class="btn" value="등록"/>
			<input type="reset" class="btn" value="다시쓰기"/>
		</li>
	</ul>
</form>
</div>