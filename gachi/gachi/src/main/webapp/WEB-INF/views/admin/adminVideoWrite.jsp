<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#ad_videoFile_list>li{
		width:50%;
		float:left;
		text-align:center;
	}
	#ad_videoFile_list>li:last-child{
		height:100%;
	}
	#ad_videoFile_list>li:last-child li{
		font-size:2em;
		float:left;
		width:50%;
		border-bottom:1px solid gray;
		height:69px;
		line-height:69px;
		text-align:left;
	}
	#ad_video_addList li{
		text-align:center;
		font-size:1.3em;
		float:left;
		width:10%;
		height:40px;
		border-bottom:1px solid gray;
	}
	#ad_video_addList li:nth-child(7n+1){
		width:5%;
	}
	#ad_video_addList li:nth-child(7n+4){
		width:15%;
	}
	#ad_video_addList li:nth-child(7n+2),#ad_video_addList li:nth-child(7n+3){
		width:25%;
	}
	#ad_video_addList li>input[type=text]{
		width:95%;
	}
</style>
<script type="text/javascript">
	$(function(){
		 $("#add_mov").on("dragenter dragover", function(event){
		        event.preventDefault();
		    }); 
		 
		let count=0;
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
				url:"/gachi/videoUpload",
				//ajax로 넘길경우 form-data 형식
				processData: false,
				contentType: false,
				//////////////////////////
				data: formData,
				success:function(result){
					addVideoList(result);
				}
			});
		});
		function addVideoList(result){
			let date=new Date();
			let year=date.getFullYear();
			let month=date.getMonth()+1;
			let day=date.getDate();
			if(day<10){
				day="0"+day;
			}
			var filename=result.slice(result.lastIndexOf("/")+1);
			console.log(filename);
			let tagTxt='<li><select name="videoVOList['+ count +'].unit">';
			for (var i = 1; i <=10; i++) {
				tagTxt+='<option value="'+i+'">'+i+'</option>';
			}
			tagTxt+='</select></li>';
			tagTxt+='<li><input type="text" name="videoVOList['+ count +'].unit_content"/></li>';
			tagTxt+='<li><input type="text" name="videoVOList['+ count +'].video_name"/></li>';
			tagTxt+='<li><input type="hidden" name="videoVOList['+ count +'].video_filename"/>';
			tagTxt+=filename+'</li>';
			tagTxt+='<li><input type="hidden" name="videoVOList['+ count +'].video_length"/>20:56</li>';
			tagTxt+='<li><input type="hidden" name="videoVOList['+ count +'].enroll_date"/>';
			tagTxt+=year+'-'+month+'-'+day+'</li>'
			tagTxt+='<li><b>x</b></li>'
			count++;
			$("#ad_video_addList").append(tagTxt);
		}
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
<div class="container ad_font">
<h1>영상등록</h1>
<form action="/gachi/adminClass">
<div class="text-center">
	카테고리:
		<select id="category" name="category">
			<option value="전체">전체</option>
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
	<input id="code" type="hidden" value=""/>
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
<div class="ad_box" id="add_mov" style="height:300px; text-align:center; "> 
	<h3 style="line-height: 280px;">영상을 여기에 끌어주세요.</h3>
</div>
<h3>영상등록정보</h3>
<ul class="text_center ad_box" id="ad_video_addList">
	<li>차시</li>
	<li>차시명</li>
	<li>영상제목</li>	
	<li>파일명</li>
	<li>영상길이</li>
	<li>등록일</li>
	<li>취소</li>
</ul>

<!--<c:forEach var="imgList" items="${vo.imgList}" varStatus="status">	
</c:forEach>-->
<ul>
	<li class="content_center">
		<input type="submit" class="btn" value="수정"/>
		<input type="reset" class="btn" value="다시쓰기"/>
	</li>
</ul>
</form>
</div>