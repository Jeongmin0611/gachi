<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		$("#ad_event_writeForm>li:lt(2)").css("width","50%");
		$("#ad_event_writeForm>li").slice(3).css("width","100%");
		CKEDITOR.replace("content");
	});
</script>
<div class="container text-center">
<h1>이벤트 등록</h1>
<form method="post" action="" enctype="multipart/form-data">
	<ul id="ad_event_writeForm">
		<li><span class="content_center">제목 <input type="text" name="no" value=""/></span></li>
		<li>
			썸네일<br/>
			<img src="<%=request.getContextPath()%>/img/147.jpg">
			<input type="file" name="no"/>
		</li>
		<li>내용 <textarea name="content"></textarea></li>
		<li>시작일 <input type="date" name="no"/></li>
		<li>종료일 <input type="date" name="no"/></li>
		<li>첨부파일 <input type="file" name="no"/> </li>
	</ul>
<div id="ad_buttonArea">
	<input type="submit" value="등록"/>
	<input type="reset" value="다시쓰기"/>
</div>
</form>
</div>