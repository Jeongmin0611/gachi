<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<style>
 .btn{
	background-color: #437299;
	color:white;
	}
  #cr_1on1_write li{
  	margin-bottom:10px;
  }	
  #cr_1on1_writeForm li{
  	margin-bottom:10px;
  }
  .container{
	font-family: 'NanumBarunpen';
}
</style>
<script type="text/javascript">
	$(function(){
		$("#cr_1on1_write>li:lt(4)").css("width","50%");
		$("#cr_1on1_write>li").slice(5).css("width","100%");
		$("#cr_1on1_write>li input:lt(5)").css("width","40%");
		$("#cr_1on1_writeForm>li").css("width","100%");
		CKEDITOR.replace("content");
	});
</script>
<div class="container text-center">
	<h1>1:1문의</h1>
	<div style="margin:20px">
		<ul id="cr_1on1_write">
			<li> &nbsp;&nbsp;문의구분 &nbsp;<input type="text" name="no" value="" readonly/></li>
			<li> &nbsp;&nbsp;작성자 &nbsp;&nbsp; <input type="text" name="no" value="" readonly/></li>	
		</ul>
	<form method="post" action="" enctype="mutipart/form-data">
		<input type="hidden" name="no" value="no"/>
	<ul id="cr_1on1_writeForm">
		<li> &nbsp;&nbsp;제목 &nbsp;&nbsp; &nbsp;&nbsp;<input type="text" name="no" style="text-align:center; width:400px;"/></li>
		<li> 내용<br/><textarea name="content"></textarea></li>
		<li> &nbsp;&nbsp;첨부파일 <input type="file" name="inputFile"/> </li>
	</ul>
	</form>
	</div>
<div id="cr_buttonArea">
	<input type="submit" class="btn" value="등록"/>
	<input type="reset" class="btn" value="다시쓰기"/>
</div>
</div>