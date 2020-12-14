<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="voCount" value="0"/> 
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
	#ad_video_addList>li:last-child{
		width:100%;
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
	$(()=>{
		let cnt=0;
		let duration=null;
		let durationStr=null;
		$("#file_info>li:lt(6)").css("borderBottom","1px solid gray");
		var video_sample=videojs('video_sample');
		 video_sample.on("loadedmetadata", function() {
		let fileIndex=video_sample.currentSrc().lastIndexOf("/")+1;
		let filename=video_sample.currentSrc().substring(fileIndex); 
		duration=video_sample.duration();
		let floor=Math.floor(duration);
	    var hour = parseInt(duration/3600);
	    var min = parseInt((duration%3600)/60);
	    var sec = floor%60;
	    durationStr=hour+":"+min+":" + sec;
	    $("#file_info li:nth-child(2)").text(filename);
	    $("#file_info li:nth-child(4)").text(durationStr);
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
				var filename=result.filePath.slice(result.filePath.lastIndexOf("/")+1);
				console.log(filename);
				tagTxt='<ul><li><select name="list['+cnt+'].unit_content"/>';
				result.conList.forEach((content)=>{
					tagTxt+='<option value="'+content+'">'+content+'</option>';
				});
				tagTxt+='</select></li>';
				tagTxt+='<li><input type="hidden" name="list['+cnt+'].unit" value="1"/>';
				tagTxt+='<input type="text" name="list['+cnt+'].section_index"/></li>';
				tagTxt+='<li><input type="text" name="list['+cnt+'].video_name"/></li>';
				tagTxt+='<li class="wordCut"><input type="hidden" name="list['+cnt+'].video_filename"'; 
				tagTxt+='value="'+filename+'"/>'+filename+'</li>';
				tagTxt+='<li><input type="hidden" name="list['+cnt+'].video_length" value="'+duration+'"/>'+durationStr+'</li>';
				tagTxt+='<li><input type="hidden" name="list['+cnt+'].enroll_date" value="'+year+'-'+month+'-'+day+'"/>';
				tagTxt+=year+'-'+month+'-'+day+'</li>'
				tagTxt+='<li><b class="video_del">x</b></li></ul>'
				cnt=cnt+1;
				console.log(cnt);
				$("#ad_video_addList>ul:last-child").after(tagTxt);
				$("#video_sample").attr("src","/gachi/upload/class_video/test2.mp4");
				if(!video_sample.paused){
					video_sample.pause();
				}
					var source=document.getElementById('videoSrc');
			 	 source.setAttribute('src',"/gachi/upload/class_video/test2.mp4");
			 	 //video_sample.appendChild(source);
			 	 console.log("filePath=> "+result.filePath);
			 	  video_sample.src({
		                src:result.filePath,
		                type: 'video/mp4'
            		});
			   	 video_sample.load();
				$("#file_info li:last-child").text(result.sizeStr);		
			}
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
				
				for (var i = 0; i <=num; i++) {
					var unit=document.getElementsByName("list["+i+"].unit");
					var idx=document.getElementsByName("list["+i+"].section_index");
					if(unit[0].value==null){
						$("#ad_video_addList>ul:eq("+i+") li:eq(2)").children().first()
					}
					var valCheck=unit[i].value+''+idx[i].value;				
					array.push(valCheck);
				}
				const set = new Set(array);
				if(array.length !== set.size) {
				  alert("목차가 중복됩니다. 다시 입력해주세요.");
				  return false;
				}
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
<div class="ad_box" id="add_mov" style="height:300px; text-align:center; padding:auto; "> 
	<div style="margin-top:60px">
		<h3 style="line-height:150px;">영상을 여기에 끌어주세요.</h3>
	</div>
</div>
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
<form id="adminVideoUpdate" action="/gachi/adminVideoUpdate">
<ul class="text_center ad_box" id="ad_video_addList">
	<li>목차명</li>
	<li>순서</li>
	<li>영상제목</li>	
	<li>파일명</li>
	<li>영상길이</li>
	<li>등록일</li>
	<li>취소</li>
	<c:forEach var="vo" items="${videoList}">
		<ul>
			<li class="wordCut">${vo.unit_content}</li>
			<li>
				<input type="hidden" name="list[${voCount}].unit" value="${vo.unit}"/>
				<input type="hidden" name="list[${voCount}].section_index" value="${vo.section_index}"/>
				${vo.section_index}
			</li>
			<li class="wordCut"><a href="">${vo.video_name}</a></li>	
			<li class="wordCut">${vo.video_filename}</li>
			<li>${vo.video_length}</li>
			<li>${vo.enroll_date}</li>
			<li><b class="video_del" title="${vo.video_code}">x</b></li>
		</ul>	
	<c:set var="voCount" value="${voCount+1}"/>
	</c:forEach>
</ul>
<script type="text/javascript">
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
</script>
<ul>
	<li class="content_center">
		<input id="code" type="hidden" name="code" value="${code}"/>
		<button class="btn">수정</button>
		<button class="btn">목록보기</button>
	</li>
</ul>
</form>
</div>