<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(function(){
		CKEDITOR.replace("content");
		CKEDITOR.config.height=500;
		$("#ad_goods_writeForm>li").slice(2).css("width","100%");
		$("#ad_goods_writeForm>li:last-child").css("padding","10px");
		$("#ad_goods_li li").css("margin-bottom","10px");
	});
</script>
<div class="container ad_font">
<h1>상품등록</h1>
<form method="post" action="">
<ul id="ad_goods_writeForm">
	<li>
		<ul style="margin:15px 0px">
			<li class="content_center">클래스코드</li>
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
			<li><input type="text" id="" name=""/></li>
			<li class="content_center">난이도</li>
			<li>
				<select>
					<option>초급</option>
					<option>중급</option>
					<option>고급</option>
					<option>마스터</option>
				</select>
			</li>
			<li class="content_center">수업차시</li>
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
<ul id="ad_goods_li">
	<li>상품설명 <textarea name="content"></textarea></li>
		<li>첨부파일 <input type="file" name="no"/> </li>
		<li class="content_center">
			<input type="submit" class="btn" value="등록"/>
			<input type="reset" class="btn" value="다시쓰기"/>
		</li>
</ul>
</form>
</div>