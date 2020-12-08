<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container ad_font">
<script type="text/javascript">
	$(function(){
		CKEDITOR.replace("content");
		CKEDITOR.config.height=500;
		$("#ad_goods_writeForm>li").slice(2).css("width","100%");
		$("#ad_goods_writeForm>li:first-child li").css("margin","7px 0px");
		$("#ad_goods_write li").css("margin-top","10px");
		$("textarea").css("height","800px");
	});
</script>
<div class="container">
<h1>상품수정</h1>
<form method="post" action="">
<ul id="ad_goods_writeForm">
	<li>
		<ul>
			<li class="content_center">상품코드</li>
			<li>cla001</li>
			<li class="content_center">카테고리</li>
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
			<li class="content_center">상품명</li>
			<li><input type="text" id="" name="" size="40"/></li>
			<li class="content_center">난이도</li>
			<li>
				<select>
					<option>초급</option>
					<option>중급</option>
					<option>고급</option>
					<option>마스터</option>
				</select>
			</li>
			<li class="content_center">재고</li>
			<li><input type="text" id="" name=""/></li>
			<li class="content_center">가격</li>
			<li><input type="text" id="" name=""/></li>
		</ul>
	</li>
	<li class="text-center">
		대표이미지<br/>
		<img src="/gachi/img/147.jpg"/>
	</li>
</ul>
<ul id="ad_goods_write">
	<li>상품설명</li>
	<li><textarea name="content"></textarea></li>
	<li>첨부파일 <input type="file" name="no"/> </li>
	<li class="content_center">
		<input type="submit" class="btn" value="수정"/>
		<input type="reset" class="btn" value="다시쓰기"/>
	</li>
</ul>
</form>
</div>
</div>