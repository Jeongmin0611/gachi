<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		$("#ad_event_writeForm>li:lt(2)").css("width","50%");
		$("#ad_event_writeForm>li").slice(2).css("width","100%");
		$("#ad_event_writeForm>li>ul").css("width","100%");
		$("#ad_event_writeForm>li>ul li").css("float","none");
		$("textarea").css("width","100%");
		CKEDITOR.replace("content");
	});
</script>
<div class="container">
<h1 class="content_center">이벤트 등록</h1>
<form method="post" action="" enctype="multipart/form-data">
	<ul id="ad_event_writeForm">
		<li>
			<ul>
				<li>제목 <input type="text" name="no" value=""/></li>
				<li>시작일 <input type="date" name="no"/></li>
				<li>종료일 <input type="date" name="no"/></li>
			</ul>
		</li>
		<li>
			<ul class="content_center">
			<li>썸네일</li>
			<li><img src="<%=request.getContextPath()%>/img/147.jpg"></li>
			<li><input type="file" name="no"/></li>
			</ul>
		</li>
		<li>내용 <textarea name="content"></textarea></li>
		<li>첨부파일 <input type="file" name="no"/> </li>
		<li class="content_center">
			<input type="submit" value="등록"/>
			<input type="reset" value="다시쓰기"/>
		</li>
	</ul>
</form>
</div>