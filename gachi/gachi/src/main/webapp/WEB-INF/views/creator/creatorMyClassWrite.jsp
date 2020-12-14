<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#img_area{
		border:3px solid #437299;
		border-radius:10px;
		margin:10px 0px;
	}
	#cre_myclass_writeForm{
		margin-top :20px;
		
	}	
	#cre_myclass_writeForm li{
		height:50px;
		padding:15px 0px;
	}
	#cre_myclass_writeForm li:nth-child(2n+1){
		text-align:center;
	}
	#img_box{
		text-align:center; 
		height:200px;
		margin:0 auto;
	}
</style>
<script>
	$(function(){
		$("#cre_myclass_writeForm li").css("margin-bottom","10px");
		$("#cre_myclass_writeForm").css("overflow","auto");
		$("#cre_myclass_writeForm li:lt(6)").css("float","left");
		$("#cre_myclass_writeForm li:nth-child(2n+1)").css("width","10%");
		$("#cre_myclass_writeForm li:nth-child(2n)").css("width","90%");
		$("#img_area").css("height","300px");
		$("#img_area>div").css("width","25%").css("float","left");
		var editor=CKEDITOR.replace('content',{
			imageUploadUrl:'/gachi/imageUpload',
			extraPlugins:'uploadimage'
		});
		CKEDITOR.config.height=600;
		editor.on('fileUploadRequest', function( evt ) {
		    var fileLoader = evt.data.fileLoader,
		        formData = new FormData(),
		        xhr = fileLoader.xhr;
		    xhr.open( 'POST', fileLoader.uploadUrl, true );
		    formData.append( 'upload', fileLoader.file, fileLoader.fileName );
		    formData.append('type','classEdit');
		    fileLoader.xhr.send( formData );
		    evt.stop();
		}, null, null, 4 ); 

	});
</script>
<div class="container ad_font" style="margin-bottom:50px;">
	<h1>클래스 신청</h1>
<form method="post" action="" enctype="multipart/form-data">
<ul id="cre_myclass_writeForm" class="ad_box">
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
	<li><input type="text" style="width:600px"/></li>
	<li>가격</li>
	<li><input type="text" /></li>
</ul>
<div style="height:24px;margin:7px 0px;">
			<h3>클래스 이미지 추가</h3>
</div>
<div id="img_box" class="content-center ad_box" style="">
	<h3 style="line-height:180px">이미지를 끌어주세요.</h3>
</div>
<div id="img_area">
	<div style="margin:20px 10px;" >
		이미지등록<br/>
		<img src="/gachi/img/cookingEx/cookingEx01.jpg"><br/>
		<input type="file"/>
	</div>
	<div class="cfont" style="margin:20px 10px;">
		이미지등록<br/>
		<input type="file"/>
	</div>
	<div class="cfont" style="margin:20px 10px;">
		이미지등록<br/>
		<input type="file"/>
	</div>
</div>
	<div class="cfont" style="margin-bottom:20px">
		클래스 상세정보 <span id="ps">*클래스 내용과 함께 강좌개설 시 반영될 의견을 기입해주세요.</span>
		<textarea name="content"></textarea>
	</div>
	<div style="text-align:center; margin-bottom:50px">
		<input type="submit" class="btn" value="개설신청"/>
		<input type="reset" class="btn" value="다시쓰기"/>
	</div>
</form>
</div>