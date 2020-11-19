<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<script type="text/javascript">
	$(function(){
		$("#cr_1on1_view>li:lt(4)").css("width","50%");
		$("#cr_1on1_view>li").slice(5).css("width","100%");
		$("#cr_1on1_view>li input:lt(5)").css("width","40%");
		$("#cr_1on1_writeForm>li").css("width","100%");
		CKEDITOR.replace("content");
	});
</script>
<div class="container text-center">
	<div style="border:1px solid gray; margin:50px">
	<h1>1:1문의</h1>
		<ul id="cr_1on1_view">
			<li> &nbsp;&nbsp;글번호 &nbsp;&nbsp; <input type="text" name="no" value="" readonly/></li>
			<li> &nbsp;&nbsp;문의구분 &nbsp;<input type="text" name="no" value="" readonly/></li>
			<li> &nbsp;&nbsp;작성자 &nbsp;&nbsp; <input type="text" name="no" value="" readonly/></li>
			<li> &nbsp;&nbsp;등록일 &nbsp;&nbsp; <input type="text" name="no" value="" readonly/></li>
		
		</ul>
	<form method="post" action="" enctype="mutipart/form-data">
	<ul id="cr_1on1_writeForm">
		<input type="hidden" name="no" value="no"/>
		<li> &nbsp;&nbsp;제목 &nbsp;&nbsp; &nbsp;&nbsp;<input type="text" name="no" style="text-align:center; width:400px;"/></li>
		<li> &nbsp;&nbsp;내용 <textarea name="content"></textarea></li>
		<li> &nbsp;&nbsp;첨부파일 <input type="file" name="inputFile"/> </li>
	</ul>
	</form>
	</div>
<div id="cr_buttonArea">
	<input type="submit" value="등록"/>
	<input type="reset" value="다시쓰기"/>
</div>
</form>
</div>