<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#ad_videoFile_list>li{
		font-size:2em;
		width:50%;
		float:left;
	}
	#ad_videoFile_list>li:last-child li{
		float:left;
		width:50%;
		border-bottom:1px solid gray;
	}
	
</style>
<div class="container ad_font">
<script type="text/javascript">
	$(function(){
		 $("#add_mov").on("dragenter dragover", function(event){
		        event.preventDefault();
		    }); 
		$(document).on("drop","#add_mov",(event)=>{
			event.preventDefault();
			var files =event.originalEvent.dataTransfer.files;
			var file=files[0];
			console.log(file);
			let code=$("#code").val();
			var formData= new FormData();
			formData.append("file",file);
			formData.append("code",code);
			$.ajax({
				type:"post",
				enctype: 'multipart/form-data',
				url:"/gachi/imgThumbnail",
				//ajax로 넘길경우 form-data 형식
				processData: false,
				contentType: false,
				//////////////////////////
				data: formData,
				success:function(result){					
					var filename=result.slice(result.lastIndexOf("/")+1);
					console.log(filename);
					let tagTxt='<div style="margin:0px 15px;width:230px;height:100%;float:left">';
					tagTxt+='<div style="text-align:center;height:24px;">이미지'+ imgCount++ +'</div>';
					tagTxt+='<div style="text-align:center">';
					tagTxt+='<img src="'+result+'" width=200 height=200 /></div>';
					tagTxt+='<div style="padding:0 auto;">';
					tagTxt+='<input type="hidden" name="imgList" value="'+filename+'"/>'+filename+'<b>x</b></div>';
					$(".ad_box").append(tagTxt);
				}
			});
		});
			$(document).on('click','b',(event)=>{
				let imageName=$(event.target).prev().text();
				let code=$("#code").val();
				$.ajax({
					url:'/gachi/imageDelete?imageName='+imageName+"&code="+code,
					type:'get',
					success:(result)=>{
						$(event.target).parent().parent().remove();
					},error:(e)=>{
						alert("이미지파일 삭제를 실패하였습니다.");
					}
				});
			});	
	});
</script>
<div class="container">
<h1>영상등록</h1>
<div class="text-center">
	카테고리:
		<select id="category" name="category">
			<option value="공예/창작">공예/창작</option>
			<option value="요리">요리</option>
			<option value="미술">미술</option>
			<option value="음악">음악</option>
			<option value="라이프스타일">라이프스타일</option>
			<option value="운동">운동</option>
			<option value="사진/영상">사진/영상</option>
		</select>
	등록할 클래스 :
	<select name="option">
		<option value="오늘부터 댄스뚱!">오늘부터 댄스뚱!</option>
	</select>
</div>
<h3>영상등록정보</h3>
<ul class="text_center ad_box" id="ad_videoFile_list">
	<li>
		<ul>
			<li>영상썸네일</li>
			<li><img src="<%=request.getContextPath()%>/upload/classImg/147.jpg"/></li>
		</ul>
	</li>
	<li>
		<ul>
			<li>파일명</li>
			<li>147.mp4</li>
			<li>영상길이</li>
			<li>20:56</li>
			<li>확장자</li>
			<li>.mp4</li>
			<li>파일용량</li>
			<li>41.8MB</li>
		</ul>
	</li>
</ul>
<div class="ad_box" id="add_mov" style="height:300px;"> 
	<h3>영상을 여기에 끌어주세요.</h3>
</div>

<!--<c:forEach var="imgList" items="${vo.imgList}" varStatus="status">	
</c:forEach>-->
<ul>
	<li class="content_center">
		<input type="submit" class="btn" value="수정"/>
		<input type="reset" class="btn" value="다시쓰기"/>
	</li>
</ul>
</div>
</div>