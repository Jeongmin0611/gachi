<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(function(){
		$("#cre_myclass_writeForm li").css("margin-bottom","10px");
		$("#cre_myclass_writeForm").css("overflow","auto");
		$("#cre_myclass_writeForm li:lt(6)").css("float","left");
		$("#cre_myclass_writeForm li:nth-child(2n+1)").css("width","10%");
		$("#cre_myclass_writeForm li:nth-child(2n)").css("width","90%");
		$("#img_area").css("height","300px");
		$("#img_area>div").css("width","25%").css("float","left");
		let ckeditor=CKEDITOR.replace("content");
	});
</script>
<div class="container cfont" style="border:2px solid black; margin-bottom:50px;">
<form method="post" action="" enctype="multipart/form-data">
<ul id="cre_myclass_writeForm" style="margin-top :50px">
	<li>카테고리</li>
	<li>
		<select>
			<option>공예/창작</option>
			<option>요리</option>
			<option>미술</option>
			<option>음악</option>
			<option>라이프스타일</option>
			<option>운동</option>
			<option>사진/영상</option>
		</select>
	</li>
	<li>클래스명</li>
	<li><input type="text"/></li>
	<li>가격</li>
	<li><input type="text"/></li>
</ul>
<div id="img_area" style="margin:10px 0px;">
	<div>
		이미지등록<br/>
		<img src="/gachi/img/cookingEx/cookingEx01.jpg"><br/>
		<input type="file"/>
	</div>
	<div>
		이미지등록<br/>
		<input type="file"/>
	</div>
	<div>
		이미지등록<br/>
		<input type="file"/>
	</div>
</div>
	<div style="margin-bottom:20px">
		클래스 상세정보 <span id="ps">*클래스 내용과 함께 강좌개설 시 반영될 의견을 기입해주세요.</span>
		<textarea name="content"></textarea>
	</div>
	<div style="text-align:center; margin-bottom:50px">
		<input type="submit" value="개설신청"/>
		<input type="reset" value="다시쓰기"/>
	</div>
</form>
</div>