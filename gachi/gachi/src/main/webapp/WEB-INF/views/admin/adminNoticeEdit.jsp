<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#ad_goods_writeForm>li{
		width:100%;
		height:150px;
	}
	#ad_goods_writeForm li:nth-child(2n+1){
		text-align: center;
	}
	#ad_goods_writeForm li:nth-child(2n){
		text-align: left;
	}
	h3{
		margin:10px;
	}
</style>
<script type="text/javascript">
	$(function(){
		var editor=CKEDITOR.replace('content',{
			imageUploadUrl:'/gachi/imageUpload',
			extraPlugins:'uploadimage'
		});
		CKEDITOR.config.height=800;
		editor.on('fileUploadRequest', function( evt ) {
		    var fileLoader = evt.data.fileLoader,
		        formData = new FormData(),
		        xhr = fileLoader.xhr;
		    xhr.open( 'POST', fileLoader.uploadUrl, true );
		    formData.append( 'upload', fileLoader.file, fileLoader.fileName );
		    formData.append('type','notice');
		    fileLoader.xhr.send( formData );
		    evt.stop();
		}, null, null, 4 ); 
	});
</script>
<div class="container">
<h1>공지사항 수정</h1>
<form method="post" action="/gachi/adminNoticeEditOk" enctype="multipart/form-data">
<ul id="ad_goods_writeForm">
	<li>
		<ul>
			<li><input type="hidden" name="nowPage" value="${nowPage}"/>공지사항 글 번호</li>
			<li><input type="hidden" name="notice_num" value="${vo.notice_num}"/>${vo.notice_num}</li>
			<li>분류</li>
			<li>
				<select id="target" name="target">
					<option  value="전체" 
						<c:if test="${vo.target eq '전체'}"> selected</c:if>>전체</option>
					<option value="사용자" 
						<c:if test="${vo.target eq '사용자'}"> selected</c:if>>사용자</option>
					<option value="크리에이터" 
						<c:if test="${vo.target eq '크리에이터'}"> selected</c:if>>크리에이터</option>
				</select>
			</li>
			<li>제목</li>
			<li><input type="text" id="" name="subject" value="${vo.subject}" size="70"/></li>
			<li>작성일</li>
			<li>${vo.writedate}</li>
		</ul>
	</li>
</ul>
<h3>내용</h3>
<ul id="ad_goods_write">
	<li><textarea name="content">${vo.content}</textarea></li>
	<li class="content_center" style="margin-top:15px;">
		<input type="submit" class="btn" value="수정"/>
		<input type="reset" class="btn" value="다시쓰기"/>
	</li>
</ul>
</form>
</div>