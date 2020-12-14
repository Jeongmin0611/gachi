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
		padding:3px 0px;
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
</style>
<script type="text/javascript">
	$(function(){
		let cnt=0;
		
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
			tagTxt='<div><li><select name="list['+cnt+'].unit_content"/>';
			result.conList.forEach((content)=>{
				tagTxt+='<option value="'+content+'">'+content+'</option>';
			});
			tagTxt+='</select></li>';
			tagTxt+='<li><input type="text" name="list['+cnt+'].section_index"/></li>';
			tagTxt+='<li><input type="text" name="list['+cnt+'].video_name"/></li>';
			tagTxt+='<li class="wordCut"><input type="hidden" name="list['+cnt+'].video_filename"'; 
			tagTxt+='value="'+filename+'"/>'+filename+'</li>';
			tagTxt+='<li><input type="hidden" name="list['+cnt+'].video_length" value="333"/>123</li>';
			tagTxt+='<li><input type="hidden" name="list['+cnt+'].enroll_date" value="'+year+'-'+month+'-'+day+'"/>';
			tagTxt+=year+'-'+month+'-'+day+'</li>'
			tagTxt+='<li><b title="'+filename+'">x</b></li></div>'
			cnt=cnt+1;
			console.log(cnt);
			$("#ad_video_addList").append(tagTxt);
		}
			$(document).on('change','#category',(event)=>{
				let value=$("#category option:selected").val();
				$.ajax({
					url:"/gachi/adminGetClassList?value="+value,
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
				cnt=cnt-1;
				let fileName=$(event.target).attr("title");
				console.log("aaaaa=>"+fileName);
				$.ajax({
					url:'/gachi/videoDelete?fileName='+fileName,
					type:'get',
					success:()=>{
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
<h3>동영상목차정보</h3>
<ul class="ad_box" id="ad_unit_box">
	
</ul>
<div class="ad_box" id="add_mov" style="height:300px; text-align:center; padding:auto; "> 
	<div style="margin-top:60px">
		<h3 style="line-height:80px;">강좌를 선택하신 후,</h3>
		<h3 style="line-height:80px;">영상을 여기에 끌어주세요.</h3>
	</div>
</div>
<form method="post" id="adminVideoWriteOk" action="/gachi/adminVideoWriteOk">
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