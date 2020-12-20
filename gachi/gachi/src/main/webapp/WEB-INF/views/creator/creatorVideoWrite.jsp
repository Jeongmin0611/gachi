<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#ad_videoFile_list>li{
		width:50%;
		float:left;
		text-align:center;
	}
	#ad_videoFile_list>li:last-child li{
		float:left;
		width:50%;
		border-bottom:1px solid gray;
		height:72px;
		line-height:72px;
		text-align:left;
	}
	#ad_video_addList li{
		text-align:center;
		font-size:1.3em;
		float:left;
		width:10%;
		height:55px;
		padding:6px 0px;
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
	#file_info{
		overflow: auto;
	}
	#video_sample{
		margin:0 auto;
	}
	.videoList>li:first-child select{
		width:70%;
	}
</style>
<script type="text/javascript">
		var newStr=null;
		$(()=>{
			$("#file_info>li:lt(6)").css("borderBottom","1px solid gray");
			var video_sample=videojs('video_sample');
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
			$("#ad_video_addList>ul:last>li:eq(4)").text(durationStr);
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
				tagTxt+='<li><b class="video_del" title="'+filename+'">x</b><input type="hidden" name="videoLength"/>';
				tagTxt+='<input type="hidden" name="videoCode"/></li></ul>';
				var ulCount=$("#ad_video_addList>ul").length;
				if(ulCount<=0){
					$("#ad_video_addList>li:last").after(tagTxt);
				}else{
					$("#ad_video_addList>ul:last").after(tagTxt);
				}
				$("#video_sample").attr("src","/gachi/upload/class_video/test2.mp4");
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
			$(document).on('change','#category',(event)=>{
				let value=$("#category option:selected").val();
				$.ajax({
					url:"/gachi/creatorGetClassList?value="+value,
					type:"get",
					success:(list)=>{
						let txt='';
						let cnt=1;
						let firstCode='';
						list.forEach((vo)=>{
							txt+='<option value='+vo.class_name+'>'+vo.class_name+'</option>';
							if(list[0].class_name==vo.class_name){
								firstCode=vo.code;
							}
						});
						$('#class_name').html(txt);
						$("#code").val(firstCode);
						$('#code').val(firstCode).trigger('change');
					},
					error:(e)=>{
						alert(e);
					}
				});
			});
			$(document).on('change','#class_name',(event)=>{
				let value=$("#class_name option:selected").text();
				$.ajax({
					url:"/gachi/adminGetCode?class_name="+value,
					type:"get",
					success:(code)=>{
						$("#code").val(code);
						$('#code').val(code).trigger('change');
					},
					error:(e)=>{
						alert(e);
					}
				});
			});
			
			$(document).on('change','#code',(event)=>{
				let code=$(event.target).val();
				console.log("aaaaaa");
				$.ajax({
					url:'/gachi/adminGetVideoInfo?code='+code,
					type:"get",
					success:(list)=>{
						addUnit(list);
					},
					error:(e)=>{
						
					}
				});
			});
			function addUnit(list){
				let txt='';
				list.forEach((vo)=>{
					txt+='<li>목차</li>';
					txt+='<li>'+vo.unit+'</li>';
					txt+='<li>목차명</li>';
					txt+='<li>'+vo.unit_content+'</li>';
					$("#ad_unit_box").html(txt);
				});
			}
			
			$(document).on('click','b',(event)=>{
				let fileName=$(event.target).attr("title");
				console.log("aaaaa=>"+fileName);
				if("삭제된 영상은 다시 복구되지 않습니다.\n삭제 하시겠습니까?"){
					$.ajax({
						url:'/gachi/videoDelete?fileName='+fileName,
						type:'get',
						success:()=>{
							$(event.target).parent().parent().remove();
						},error:(e)=>{
							alert("이미지파일 삭제를 실패하였습니다.");
						}
					});
				}
			});
			
			$("#creatorVideoWriteOk").submit(()=>{
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
				var videoName=document.getElementsByName("videoName");
				videoName.forEach((ele)=>{
					console.log("uc==>"+ele.value);
					if(ele.value==''||ele.value==null){
						alert("영상제목이 누락되었습니다\n확인 후 다시 등록을 시도하여 주십시오.");
						return false;
					}
				});
				return true;
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
	});
</script>
<div class="container ad_font">
<h1>영상등록</h1>
<div class="text-center">
		카테고리:
		<select id="category" name="category">
			<option>--선택--</option>
			<option value="공예/창작">공예/창작</option>
			<option value="요리">요리</option>
			<option value="미술">미술</option>
			<option value="음악">음악</option>
			<option value="라이프스타일">라이프스타일</option>
			<option value="운동">운동</option>
			<option value="사진/영상">사진/영상</option>
		</select>
	등록할 클래스 :
	<select id="class_name" name="class_name">
	</select>
	<!--<button id="selectBtn" class="btn">선택</button>-->
</div>
<ul class="ad_box" id="ad_videoFile_list">
	<li>
		<ul>
			<li style="height:35px; line-height:30px">영상 미리보기</li>
			<li>
			<video  id="video_sample" class="video-js vjs-default-skin vjs-controls-enabled vjs-big-play-centered" controls preload="metadata"
	    		width="450" height="250" data-setup="{}">		
				<source id="videoSrc" src="<%=request.getContextPath() %>/upload/class_video/test2.mp4" type="video/mp4" />		
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
	
</ul>
<div class="ad_box" id="add_mov" style="height:300px; text-align:center; padding:auto; "> 
	<div style="margin-top:60px">
		<h3 style="line-height:80px;">강좌를 선택하신 후,</h3>
		<h3 style="line-height:80px;">영상을 여기에 끌어주세요.</h3>
	</div>
</div>
<form method="post" id="creatorVideoWriteOk" action="/gachi/creatorVideoWriteOk">
<h3>영상등록정보</h3>
<ul class="text_center ad_box" id="ad_video_addList">
		<li>목차명</li>
		<li>순서</li>
		<li>영상제목</li>	
		<li>파일명</li>
		<li>영상길이</li>
		<li>등록일</li>
		<li>취소</li>
		
</ul>
<ul>
	<li class="content_center">
		<input id="code" type="hidden" name="code"/>
		<button class="btn">등록</button>
		<input type="reset" class="btn" value="다시쓰기"/>
	</li>
</ul>
</form>
</div>