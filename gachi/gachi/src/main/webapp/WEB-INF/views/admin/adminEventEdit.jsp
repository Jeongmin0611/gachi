<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container ad_font">
<script type="text/javascript">
$(function(){
	var editor=CKEDITOR.replace('event_info',{
		imageUploadUrl:'/gachi/EventimageUpload',
		extraPlugins:'uploadimage'
	});
	editor.on('fileUploadRequest', function( evt ) {
	    var fileLoader = evt.data.fileLoader,
	        formData = new FormData(),
	        xhr = fileLoader.xhr;
	    xhr.open( 'POST', fileLoader.uploadUrl, true );
	    formData.append( 'upload', fileLoader.file, fileLoader.fileName );
	    formData.append('type','eventEdit');
	    fileLoader.xhr.send( formData );
	    evt.stop();
	}, null, null, 4 ); 
	
	CKEDITOR.config.height=500;
	$("#ad_Event_edit").css("height","500px");
	$("#ad_Event_editForm>li").slice(2).css("width","100%");
	$("#ad_Event_editForm>li:first-child li").css("margin","7px 0px");
	$("#ad_Event_edit li").css("margin-top","10px");
	$("textarea").css("height","800px");
	$(".ad_box img").css("width","200px").css("height","200px");
	$(".ad_box>div").css("margin","20px 0px;");
	$(".ad_box>div").css("float","left");
	let imgCount=2;
	 $(".add_img").on("dragenter dragover", function(event){
	        event.preventDefault();
	    });
	
	$(document).on("drop",".add_img",(event)=>{
		// 삭제
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
			url:"/gachi/StoreimgThumbnail",
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
				tagTxt+='<input type="hidden" name="imgList" value="'+filename+'"/>'+filename+'<b>  x  </b></div>';
				$(".ad_box").append(tagTxt);
			}
		});
	});
		$(document).on('click','b',(event)=>{
			let imageName=$(event.target).prev().text();
			let code=$("#code").val();
			$.ajax({
				url:'/gachi/StoreimageDelete?imageName='+imageName+"&code="+code,
				type:'get',
				success:(result)=>{
					$(event.target).parent().parent().remove();
				},error:(e)=>{
					alert("이미지파일 삭제를 실패하였습니다.");
				}
			});
		});	
		
	$("#admineventEdit").submit(()=>{
		let grpl = $("input[name=imgList]").length;
		if(grpl==0){
			alert("이벤트 이미지를 최소 1개 이상 선택하여야 합니다.");
			return false;
		}
		if($("#subject").val()==null||$("#subject").val()==""){
			alert("이벤트명을 입력하여 주세요.");
			return false;
		}
		return true;
	});	
});
function eventDel(){
	if(confirm("해당 이벤트 삭제하시겠습니까?")){
		
	}
}
function onlyNumber(){

    if((event.keyCode<48)||(event.keyCode>57))

       event.returnValue=false;

}
</script>
<div class="container">
<h1>이벤트 수정</h1>
<form method="post" action="adminEventEditOk" id="adminEventEditOk" enctype="multipart/form-data">
<ul id="ad_Event_editForm">
		<li>
			<ul>
				<li class="content_center">이벤트번호</li><li><input type="text" name="event_num" value="${list.event_num }" readonly/></li>
				<li class="content_center">제목</li><li><input type="text" name="subject" value="${list.subject }" /></li>
				<li class="content_center">시작날짜</li><li><input type="text" name="startdate" onkeypress="onlyNumber();" maxlength="8" value="${list.startdate }" /></li>
				<li class="content_center">종료 기간</li><li><input type="text" id="enddate" name="enddate" onkeypress="onlyNumber();" maxlength="8" value="${list.enddate }"/></li>
		</ul>
	</li>
	<li class="content_center">
		<div style="height:24px;margin:7px 0px;">
			이벤트 대표이미지
		</div>
		<div class="content-center add_img" style="width:80%; height:80%; margin:0 auto">
			<img src="<%=request.getContextPath()%>/img/add.png" style="width:100px;height:100px;margin-top:70px;">
		</div>
	</li>
</ul>
<h3>이벤트 이미지 목록</h3>
<div class="text_center ad_box">
<c:forEach var="imgList" items="${vo.imgList}" varStatus="status">
	<div style="margin:0 15px; width:230px;height:100%;">
		<div style="text-align:center;height:24px;">이미지${status.index+1}		
		</div>
		<div style="text-align:center">
			<img src="<%=request.getContextPath()%>/upload/storeImg/${imgList}"/>
		</div>
		<div>
			<input type="hidden" name="imgList" value="${imgList}"/> 
			<span class="wordCut">${imgList}</span><b>  x  </b>
		</div>
	</div>
</c:forEach>
</div>
		<ul id="ad_Event_edit">
			<li>이벤트설명</li>
			<li><textarea name="event_info" id="event_info">${list.event_info }</textarea></li>
			<li>첨부파일 <input type="file" name="no"/> </li>
			<li class="content_center">
				<input type="submit" class="btn" value="수정"/>
				<input type="reset" class="btn" value="다시쓰기"/>
				<button class="btn" onclick="eventDel()">삭제</button>
			</li>
		</ul>
	</form>
	</div>
</div> --%>