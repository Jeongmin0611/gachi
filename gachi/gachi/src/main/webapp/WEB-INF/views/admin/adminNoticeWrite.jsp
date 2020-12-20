<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
$(function(){
	var editor=CKEDITOR.replace("content",{
		imageUploadUrl:'/gachi/imageUpload',
		extraPlugins:'uploadimage'
	});
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
	CKEDITOR.config.height=500;
});
</script>
<div class="container text-center ad_font">
<h1>공지사항 글쓰기</h1>
<form method="post" action="/gachi/adminNoticeWriteOk" enctype="multipart/form-data">
	<ul id="ad_notice_WriteForm">
		<li>
			분류
			<select name="target">
				<option value="전체">전체</option>
				<option value="사용자">사용자</option>
				<option value="크리에이터">크리에이터</option>
			</select>  
		</li>
		<li>
			제목 <input type="text" id="subject" name="subject" placeholder="제목입력" size="70"/> 
		</li>
		<li>
			<textarea name="content" id="content" style="width:70%; height:300px"></textarea> 
		</li>
	</ul>
	<div class="content_center">
		<input type="submit" class="btn" value="등록">
	</div>
</form>
	
	
</div>