<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#ad_unit_box{
		overflow: auto;
	}
	#ad_unit_box li{
		padding:10px;
		border-bottom:1px solid gray;
		float:left;
		height:60px;
		width:10%;
		text-align:center;
		overflow: auto;
	}
	#ad_unit_box li:nth-child(5n+4){
		width:60%;
		text-align:left;
	}
	#ad_unit_box li:nth-child(5n+1),#ad_unit_box li:nth-child(5n+3){
		text-align: right;
	}
	#ad_unit_box>li{
		width:100%;
		text-align:center;
	}
	#ad_unit_box>li:last-child{
		width:100%;
		text-align: center;
	}
	#del_file{
		display: none;
	}
	h3{
		margin-top:20px;
	}
	#ad_goods_writeForm{
		height:400px;
	}
	#ad_goods_writeForm{
		border:3px solid #437299;
		border-radius:10px;
		overflow:auto;
	}
	#ad_goods_writeForm li{
		float:left;
		margin-top:5px;
		margin-bottom:5px;
	}
	#ad_goods_writeForm>li{
		height:300px;
		width:50%;
	}
	#ad_goods_writeForm ul>li:nth-child(2n+1){
		width:40%;
	}
	#ad_goods_writeForm ul>li:nth-child(2n){
		width:60%;
	}
</style>
<div class="container ad_font">
<script type="text/javascript">
	$(function(){
		var editor=CKEDITOR.replace('class_info',{
			imageUploadUrl:'/gachi/imageUpload',
			extraPlugins:'uploadimage'
		});
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
		
		CKEDITOR.config.height=500;
		$("#ad_goods_writeForm>li").slice(2).css("width","100%");
		$("#ad_goods_writeForm>li:first-child li").css("margin","7px 0px");
		$("#ad_goods_write li").css("margin-top","10px");
		$("textarea").css("height","800px");
		$(".ad_box img").css("width","200px").css("height","200px");
		$(".ad_box>div").css("margin","20px 0px;");
		$(".ad_box>div").css("float","left");
		let imgCount=2;
		 $(".add_img").on("dragenter dragover", function(event){
		        event.preventDefault();
		    });
		
		$(document).on("drop",".add_img",(event)=>{
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
					tagTxt+='<input type="hidden" name="imgNames" value="'+filename+'"/>'+filename+'<b class="img_del">x</b></div>';
					$("#sub_imgArea").append(tagTxt);
				}
			});
		});
			$(document).on('click','.img_del',(event)=>{
				let imageName=$(event.target).prev().val();
				console.log(imageName);
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
		$("#adminClassEditOk").submit(()=>{
			if($("#class_name").val()==null||$("#class_name").val()==""){
				alert("클래스명을 입력하여 주세요.");
				return false;
			}
			if($("#full_price").val()==null||$("#full_price").val()==""){
				alert("원가격을 입력하여 주세요.");
				return false;
			}
			if($("#real_price").val()==null||$("#real_price").val()==""){
				alert("판매가를 입력하여 주세요.");
				return false;
			}
			let array=new Array();
			var ulCount=$("#ad_unit_box>ul").length;
			if(ulCount<=0){
				alert("목차정보는 필수사항입니다.\n입력 후 등록버튼을 눌러주세요.");
			}else{
				for (var i = 0; i<=ulCount-1; i++) {
					var unit=document.getElementsByName("unitArray");
					var unitContent=document.getElementsByName("unitContent");
					console.log(unit[i].value);
					console.log(unitContent[i].value);
					if(unit[i].value==null||unit[i].value==''||
						unitContent[i].value==null||unitContent[i].value==''){
						alert("목차 정보가 부재입니다.\n입력 후 등록버튼을 눌러주세요.");
						return false;
					}
					array.push(unit[i].value);
				}	
				
			}
			const set = new Set(array);
			if(array.length !== set.size) {
			  alert("목차가 중복됩니다. 다시 입력해주세요.");
			  return false;
			}
			
			return true;
		});	
		$(document).on('click','#add_btn',()=>{
			let txt='<ul><li>목차</li>';
			txt+='<li><input type="text" name="unitArray"style="width:30%"/></li>'; 
			txt+='<li>목차명<input type="hidden" name="codes" value="${vo.code}"/></li>'; 
			txt+='<li><input type="text" name="unitContent" style="width:30%"/>'; 
			txt+='<input type="hidden" name="sectionCode" value="abc"/></li>';
			txt+='<li><b class="unit_del">x</b></li></ul>';
			$("#ad_unit_box>li:last-child").before(txt);
		});
		$(document).on('click','.unit_del',(event)=>{
			let section_code=$(event.target).attr("title");
			if(section_code!=null){
				$.ajax({
					url:'/gachi/unitDel?section_code='+section_code,
					type:'get',
					success:(result)=>{
						$(event.target).parent().parent().remove();
					},error:(e)=>{
						alert("이미지파일 삭제를 실패하였습니다.");
					}
				});
			}else{
				$(event.target).parent().parent().remove();
			}
		});	
		
		$("#a").click(()=>{
			console.log($("#class_img")[0].files[0].name);
		});
		
		$("#class_img").change((event)=>{
			 if($(event.target)[0].files && $(event.target)[0].files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(data) {
			     $("#mainImg").attr("src", data.target.result).width(500).height(300);
			    }
			    reader.readAsDataURL($(event.target)[0].files[0]);
			   }
		});
});
</script>
<div class="container">
<h1>클래스수정</h1>
<form method="post" id="adminClassEditOk" action="/gachi/adminClassEditOk" enctype="multipart/form-data">
<ul id="ad_goods_writeForm">
	<li style="margin-top:25px;">
		<ul>
			<li class="content_center">클래스코드</li>
			<li><input type="hidden" id="code" name="code" value="${vo.code}"/>${vo.code}</li>
			<li class="content_center">카테고리</li>
			<li>
				<select id="category" name="category" disabled>
					<option  value="공예/창작" 
						<c:if test="${vo.category eq '공예/창작'}"> selected</c:if>>공예/창작</option>
					<option value="요리" 
						<c:if test="${vo.category eq '요리'}"> selected</c:if>>요리</option>
					<option value="미술" 
						<c:if test="${vo.category eq '미술'}"> selected</c:if>>미술</option>
					<option value="음악" 
						<c:if test="${vo.category eq '음악'}"> selected</c:if>>음악</option>
					<option value="라이프스타일" 
						<c:if test="${vo.category eq '라이프스타일'}"> selected</c:if>>라이프스타일</option>
					<option value="운동" 
						<c:if test="${vo.category eq '운동'}"> selected</c:if>>운동</option>
					<option value="사진/영상" 
						<c:if test="${vo.category eq '사진/영상'}"> selected</c:if>>사진/영상</option>
				</select>
			</li>
			<li class="content_center">클래스명</li>
			<li><input type="text" id="class_name" name="class_name" value="${vo.class_name}" size="40"/></li>
			<li class="content_center">난이도</li>
			<li>
				<select id="stage" name="stage">
					<option value="초급" 
						<c:if test="${vo.category eq '초급'}"> selected</c:if>>초급</option>
					<option value="중급" 
						<c:if test="${vo.category eq '중급'}"> selected</c:if>>중급</option>
					<option value="고급" 
						<c:if test="${vo.category eq '고급'}"> selected</c:if>>고급</option>
					<option value="마스터" 
						<c:if test="${vo.category eq '마스터'}"> selected</c:if>>마스터</option>
				</select>
			</li>
			<li class="content_center">원가격</li>
			<li><input type="number" id="full_price" name="full_price" value="${vo.full_price}"/></li>
			<li class="content_center">가격</li>
			<li><input type="number" id="real_price" name="real_price" value="${vo.real_price}"/></li>
			<li class="content_center">수강기간</li>
			<li><input type="number" id="class_term" name="class_term" value="${vo.class_term}"/>일</li>
			<li class="content_center">클래스상태</li>
			<li>
				<select id="stage" name="class_state">
					<option value="미승인" 
						<c:if test="${vo.class_state eq '미승인'}"> selected</c:if>>미승인</option>
					<option value="영상승인대기" 
						<c:if test="${vo.class_state eq '영상승인대기'}"> selected</c:if>>영상승인대기</option>
					<option value="판매중" 
						<c:if test="${vo.class_state eq '판매중'}"> selected</c:if>>판매중</option>
					<option value="판매종료" 
						<c:if test="${vo.class_state eq '판매종료'}"> selected</c:if>>판매종료</option>
				</select>
			</li>
		</ul>
	</li>
	<li id="bb" class="content_center" style="margin:10px 0px;">
		<div style="height:24px;margin:7px 0px;">
			클래스 대표이미지
		</div>
		<div style="height:100%;">
			<img id="mainImg" src="<%=request.getContextPath()%>/upload/classImg/${vo.class_img}" style="width:500px;height:300px;">			
		</div>
		<div>
			<span id="del_file">${vo.class_img}</span>
			<input type="file" name="mainImg" id="class_img"/>
		</div>
	</li>
</ul>
<h3>서브이미지 추가</h3>
<div id="sub_img" class="content-center add_img" style="height:200px; border:3px solid #437299; text-align:center;">
		<h3 style="margin-top:70px;">이미지를 끌어주세요.</h3>
</div>
<h3>서브 이미지 목록</h3>
<div id="sub_imgArea"class="text_center ad_box">
<c:forEach var="imgList" items="${vo.imgList}" varStatus="status">
	<div style="margin:0 15px; width:230px;height:100%;">
		<div style="text-align:center;height:24px;">이미지${status.index+1}		
		</div>
		<div style="text-align:center">
			<img src="<%=request.getContextPath()%>/upload/classImg/${imgList}"/>
		</div>
		<div>
			<input type="hidden" name="imgNames" value="${imgList}"/> 
			${imgList}<b class="img_del">x</b>
		</div>
	</div>
</c:forEach>
</div>
<h3>목차정보</h3>
<ul class="ad_box" id="ad_unit_box">
	<c:forEach var="section" items="${sectionList}">
		<ul>
			<li>목차<input type="hidden" name="sectionCode" value="${section.section_code}"/></li>
			<li><input type="text" name="unitArray" value="${section.unit}" style="width:30%"/></li>
			<li>목차명<input type="hidden" name="codes" value="${section.code}"/></li>
			<li><input type="text" name="unitContent" value="${section.unit_content}" style="width:30%"/></li>
			<li><b class="unit_del" title="${section.section_code}">x</b></li>
		</ul>	
	</c:forEach>
			<li><button type="button" id="add_btn" class="btn">+</button></li>
</ul>
<script type="text/javascript">

</script>
<h3>클래스정보</h3>
<ul id="ad_goods_write">
	<li><textarea name="class_info">${vo.class_info}</textarea></li>
	<!--<li>첨부파일 <input type="file" name="class_img" value="${vo.class_img}"/></li> -->
	<li class="content_center">
		<input type="submit" class="btn" value="수정"/>
		<input type="reset" class="btn" value="다시쓰기"/>
	</li>
</ul>
</form>
</div>
</div>