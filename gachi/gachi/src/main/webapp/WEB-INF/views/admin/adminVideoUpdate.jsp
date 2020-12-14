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
		float:left;
		width:50%;
		height:73px;
		line-height:73px;
	}
	#ad_video_addList li{
		text-align:center;
		font-size:1.3em;
		float:left;
		width:10%;
		height:40px;
		padding:3px 0px;
		border-bottom:1px solid gray;
	}
	#ad_video_addList li:nth-child(6n+2){
		width:5%;
	}
	#ad_video_addList li:nth-child(6n+1){
		width:20%;
	}
	#ad_video_addList li:nth-child(6n+3){
		width:40%;
	}
	#ad_video_addList li:nth-child(6n+4){
		width:15%;
	}
	#ad_video_addList li>input[type=text]{
		width:95%;
		line-height:0px;
	}
	#ad_unit_box{
		display:hidden;
	}
	#ad_unit_box li{
		float:left;
		border-right:1px solid gray;
		text-align: center;
		width:10%;
	}
	#ad_unit_box li:nth-child(4n+4){
		text-align:left;
		width:70%;
	}
	#video_sample{
		margin:0 auto;
	}
	#file_info li:nth-child(2n){
		text-align:left;
	}
	#file_info>li:last-child{
		border:none;
	}
	#ad_videoFile_list{
		height:300px;
	}
</style>
<script type="text/javascript">
	$(()=>{
		$("#file_info>li:lt(6)").css("borderBottom","1px solid gray");
		var video_sample=videojs('video_sample');
		 video_sample.on("loadedmetadata", function() {
		let fileIndex=video_sample.currentSrc().lastIndexOf("/")+1;
		let filename=video_sample.currentSrc().substring(fileIndex); 
		let duration=video_sample.duration();
		let floor=Math.floor(duration);
	    var hour = parseInt(duration/3600);
	    var min = parseInt((duration%3600)/60);
	    var sec = floor%60;
	    let durationStr=hour+":"+min+":" + sec;
	    $("#file_info li:nth-child(2)").text(filename);
	    $("#file_info li:nth-child(4)").text(durationStr);
	   	$("#file_info li:nth-child(6)").text($("#videoSrc").attr("type"));
		 });
	});
</script>
<div class="container ad_font">
<h1>영상정보조회</h1>
<div class="text-center">
		카테고리:
		<select id="category" name="category" disabled>
			<option>${category}</option>
		</select>
		등록할 클래스 :
		<select id="class_name" name="class_name" disabled>
			<option>${className}</option>
		</select>
</div>
<ul class="ad_box" id="ad_videoFile_list">
	<li>
		<ul>
			<li>해당영상</li>
			<li>
			<video  id="video_sample" class="video-js vjs-default-skin vjs-controls-enabled vjs-big-play-centered" controls preload="metadata"
	    		width="450" height="250" data-setup="{}">
	    		<source id="videoSrc" src="<%=request.getContextPath() %>/upload/class_video/${filename}" type="video/mp4" />		
			</video> 
			</li>
		</ul>
	</li>
	<li style="border-left:3px solid #437299;">
		<ul id="file_info">
			<li>파일명</li>
			<li>147.mp4</li>
			<li>영상길이</li>
			<li>20:56</li>
			<li>확장자</li>
			<li>.mp4</li>
			<li>파일용량</li>
			<li>
				<c:if test="${filesize!=null}">
					${filesize}
				</c:if>
			</li>
		</ul>
	</li>
</ul>
<h3>동영상목차정보</h3>
<ul class="ad_box" id="ad_unit_box">
	<c:forEach var="vo" items="${unitList}">
		<li>목차</li>
		<li>${vo.unit}</li>
		<li>목차명</li>
		<li>${vo.unit_content}</li>	
	</c:forEach>
</ul>
<h3>영상등록정보</h3>
<ul class="text_center ad_box" id="ad_video_addList">
	<li>
		<ul>
			<li>목차명</li>
			<li>순서</li>
			<li>영상제목</li>	
			<li>파일명</li>
			<li>영상길이</li>
			<li>등록일</li>
		</ul>
	</li>
	<c:forEach var="vo" items="${videoList}">
	<li>
		<ul>
			<li>${vo.unit_content}</li>
			<li>${vo.section_index}</li>
			<li><a href="">${vo.video_name}</a></li>	
			<li class="wordCut">${vo.video_filename}</li>
			<li>${vo.video_length}</li>
			<li>${vo.enroll_date}</li>
		</ul>
	</li>	
	</c:forEach>
	<li><button class="btn">+</button></li>
</ul>
<ul>
	<li class="content_center">
		<input id="code" type="hidden" name="code"/>
		<button class="btn" onclick="loacation.href='/gachi/adminVideoUpdate?'">수정/삭제</button>
		<button class="btn">목록보기</button>
	</li>
</ul>
</div>