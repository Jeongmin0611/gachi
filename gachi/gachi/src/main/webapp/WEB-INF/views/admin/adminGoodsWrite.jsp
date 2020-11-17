<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		CKEDITOR.replace("content");
		$("#ad_goods_writeForm>li").slice(2).css("width","100%");
		
	});
</script>
<div class="container cfont">
<form method="post" action="">
<ul id="ad_goods_writeForm">
	<li class="text-center">
		<ul>
			<li>클래스코드</li>
			<li>cla001</li>
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
			<li>상품명</li>
			<li><input type="text" id="" name=""/></li>
			<li>난이도</li>
			<li>
				<select>
					<option>초급</option>
					<option>중급</option>
					<option>고급</option>
					<option>마스터</option>
				</select>
			</li>
			<li>수업차시</li>
			<li><input type="text" id="" name=""/></li>
			<li>가격</li>
			<li><input type="text" id="" name=""/></li>
		</ul>
	</li>
	<li class="text-center">
		대표이미지<br/>
		<img src="/gachi/img/147.jpg"/>
	</li>
	<li>상품설명 <textarea name="content"></textarea></li>
		<li>첨부파일 <input type="file" name="no"/> </li>
		<li class="content_center">
			<input type="submit" value="등록"/>
			<input type="reset" value="다시쓰기"/>
		</li>
</ul>
</form>
</div>