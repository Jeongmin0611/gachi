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
		height:55px;
		padding:6px 0px;
		overflow:auto;
		border-bottom:1px solid gray;
	}
	#ad_video_addList li:nth-child(7n+2),#ad_video_addList li:nth-child(7n+7){
		width:5%;
	}
	#ad_video_addList li:nth-child(7n+1){
		width:20%;
	}
	#ad_video_addList li:nth-child(7n+3){
		width:35%;
	}
	#ad_video_addList li:nth-child(7n+4){
		width:15%;
		overflow:hidden;
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
	#ad_video_addList{
		overflow: auto;
	}
</style>
<script type="text/javascript">
	var newStr=null;
	$(()=>{
		$("#file_info>li:lt(6)").css("borderBottom","1px solid gray");
		var video_sample=videojs('video_sample');
		video_sample.load();
		 video_sample.on("loadedmetadata", function() {
		let fileIndex=video_sample.currentSrc().lastIndexOf("/")+1;
		let filename=video_sample.currentSrc().substring(fileIndex); 
		var duration=video_sample.duration();
		var floor=Math.floor(duration);
		var hour = parseInt(duration/3600);
		var min = parseInt((duration%3600)/60);
		var sec = floor%60;
		var durationStr=hour+":"+min+":" + sec;
		$("#file_info li:nth-child(2)").text(filename);
		$("#file_info li:nth-child(4)").text(durationStr);
		$('#ad_video_addList>ul:last-child>li:last>input:nth-of-type(1)').val(duration);
		//$('#ad_video_addList>ul:last-child>li:eq(7)>input:hidden:first-child').trigger('change');
		$("#ad_video_addList>ul:last-child>li:eq(4)").text(durationStr);
			$("#file_info li:nth-child(6)").text($("#videoSrc").attr("type"));
		}); 
	    $("#add_mov").on("dragenter dragover", function(event){
	        event.preventDefault();
	    }); 
	
		$(document).on("drop","#add_mov",(event)=>{
			event.preventDefault();
			if($("#code").val()==""||$("#code").val()==null){
				alert("클래스를 먼저 선택해주세요.");
				return;
			}
			var files =event.originalEvent.dataTransfer.files;
			var file=files[0];
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
			var filename=result.filePath.slice(result.filePath.lastIndexOf("/")+1);
			console.log(filename);
			tagTxt='<ul class="videoList"><li><select name="unitContent"/>';
			result.conList.forEach((content)=>{
				tagTxt+='<option value="'+content+'">'+content+'</option>';
			});
			tagTxt+='</select><input type="hidden" name="sectionCode"/></li>';
			tagTxt+='<li><input type="hidden" name="unitArray" value="1"/>';
			tagTxt+='<select name="sectionIndex">';
			for (var i = 1; i <=10; i++) {
				tagTxt+='<option value="'+i+'">'+i+'</option>';
			}
			tagTxt+='</select></li>';
			tagTxt+='<li><input type="text" name="videoName"/></li>';
			tagTxt+='<li class="wordCut"><input type="hidden" name="videoFileName"'; 
			tagTxt+='value="'+filename+'"/>'+filename+'</li>';
			tagTxt+='<li></li>';
			tagTxt+='<li><input type="hidden" name="enrollDate" value="'+year+'-'+month+'-'+day+'"/>';
			tagTxt+=year+'-'+month+'-'+day+'</li>';
			tagTxt+='<li><b class="video_del">x</b><input type="hidden" name="videoLength"/>';
			tagTxt+='<input type="hidden" name="videoCode"/></li></ul>';
			$("#ad_video_addList>ul:last-child").after(tagTxt);
			if(!video_sample.paused){
				video_sample.pause();
			}
		 	 console.log("filePath=> "+result.filePath);
		 	  video_sample.src({
		            src:result.filePath,
		            type: 'video/mp4'
				});
		   	 video_sample.load();
			$("#file_info li:last-child").text(result.sizeStr);		
		}
		$(document).on('click','.video_del',(event)=>{
			if(confirm("동영상목록(파일)을 삭제하시겠습니까?\n삭제된 파일은 다시 복구되지 않습니다.")){
				let video_code=$(event.target).attr("title");
				let filename=$(event.target).parent().prev().prev().prev().text();
				if(video_code!=null){
					$.ajax({
						url:'/gachi/videoDel?video_code='+video_code+'&filename='+filename,
						type:'get',
						success:(result)=>{
							if(result<=0){
								alert("동영상목록을 db에서 삭제를 실패하였습니다.");
							}else{
								$(event.target).parent().parent().remove();
							}
						},error:(e)=>{
							alert("동영상 삭제를 실패하였습니다.");
						}
					});
				}else{
					let filename=$(event.target).parent().prev().prev().prev().text();
					$.ajax({
						url:'/gachi/videoDelete?fileName='+filename,
						type:'get',
						success:(result)=>{
							$(event.target).parent().parent().remove();
						},error:(e)=>{
							alert("동영상파일 삭제를 실패하였습니다.");
						}
					});
					$(event.target).parent().parent().remove();
				}	
			}
		});	 
			$(document).on('change','#ad_video_addList>ul>li:first-child select',(event)=>{
				let unit_content=$(event.target).val();
				$.ajax({
					url:'/gachi/getUnit?unit_content='+unit_content,
					success:(unit)=>{
						$(event.target).parent().next().children().first().val(unit).trigger('change');
					},error:(e)=>{
						alert(e);
					}
				});
				
			});
			$("#adminVideoUpdate").submit(()=>{
				let array=new Array();
				let num=$("#ad_video_addList>ul").length;
				
				for (var i = 0; i <=num-1; i++) {
					let unit=document.getElementsByName("unitArray");
					let idx=document.getElementsByName("sectionIndex");
					
					let check=unit[i].value+''+idx[i].value;
					array.push(check);
				}
				const set = new Set(array);
				console.log(array.length);
				console.log(set.size);
				if(array.length !== set.size){
					alert("목차정보(목차명+순서)가 중복되었습니다.\n동영상 정보를 다시입력해주세요.");
					return false;
				}
				if($(".videoList>li:eq(2) input:last-child").val()==''||
				$(".videoList>li:eq(3)>input:first-child").val()==null){
					alert("영상정보에 공란이 있습니다.\n수정하기 전, 확인 부탁드립니다.");
					return false;
				}	
				return true;
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
			<li style="height:35px; line-height:30px">해당영상</li>
			<li>
			<video  id="video_sample" class="video-js vjs-default-skin vjs-controls-enabled vjs-big-play-centered" controls preload="metadata"
	    		width="450" height="250" data-setup="{}">
	    		<source id="videoSrc" src="<%=request.getContextPath()%>/upload/class_video/${filename}" type="video/mp4" />		
			</video> 
			</li>
		</ul>
	</li>
	<li style="border-left:3px solid #437299;">
		<ul id="file_info">
			<li>파일명</li>
			<li></li>
			<li>영상길이</li>
			<li></li>
			<li>확장자</li>
			<li></li>
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
	<li>목차명</li>
	<li>순서</li>
	<li>영상제목</li>	
	<li>파일명</li>
	<li>영상길이</li>
	<li>등록일</li>
	<li>취소</li>
	<c:forEach var="vo" items="${videoList}">
		<ul class="videoList">
			<li class="wordCut">
				<input type="hidden" name="unitContent" value="${vo.unit_content}"/>
				<input type="hidden" name="sectionCode" value="${vo.section_code}"/>
				${vo.unit_content}
			</li>
			<li>
				<input type="hidden" name="unitArray" value="${vo.unit}"/>
				<input type="hidden" name="sectionIndex" value="${vo.section_index}"/>
				${vo.section_index}
			</li>
			<li class="wordCut"><a href="/gachi/creatorVideoView?code=${code}&video_filename=${vo.video_filename}">
				<input type="hidden" name="videoName" value="${vo.video_name}"/>
				${vo.video_name}
			</a></li>	
			<li class="wordCut">
				<input type="hidden" name="videoFileName" value="${vo.video_filename}"/>
				${vo.video_filename}
			</li>
			<li>
				${vo.lengthStr}
			</li>
			<li>
				<input type="hidden" name="enrollDate" value="${vo.enroll_date}"/>
				${vo.enroll_date}
			</li>
			<li>
				<b class="video_del" title="${vo.video_code}">x</b>
				<input type="hidden" name="videoLength" value="${vo.video_length}"/>
				<input type="hidden" name="videoCode" value="${vo.video_code}"/>
			</li>
		</ul>	
	</c:forEach>
</ul>
<ul>
	<li class="content_center">
		<input id="code" type="hidden" name="code" value="${code}"/>
		<button type="button" class="btn" onclick="location.href='/gachi/creatorVideo'">목록보기</button>
	</li>
</ul>
</div>