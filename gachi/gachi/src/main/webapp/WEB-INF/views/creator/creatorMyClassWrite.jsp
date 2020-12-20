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
	#bb div{
		margin:7px 0px;
	}
	#sub_imgArea>div>div:last-child{
		text-align: center;
	}
	h3{
		margin:20px 0px;
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
		
		CKEDITOR.config.height=700;
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
			console.log("code==>"+code);
			var formData= new FormData();
			formData.append("file",file);
			formData.append("code",code);
			$.ajax({
				type:"post",
				enctype: 'multipart/form-data',
				url:"/gachi/creImgThumbnail",
				//ajax로 넘길경우 form-data 형식
				processData: false,
				contentType: false,
				//////////////////////////
				data: formData,
				success:function(result){					
					var filename=result.slice(result.lastIndexOf("/")+1);
					console.log(filename);
					let tagTxt='<div style="margin:0px 15px;width:230px;height:100%;float:left">';
					tagTxt+='<div style="text-align:center;height:24px;">이미지썸네일</div>';
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
				$.ajax({
					url:'/gachi/creImageDelete?imageName='+imageName,
					type:'get',
					success:(result)=>{
						$(event.target).parent().parent().remove();
					},error:(e)=>{
						alert("이미지파일 삭제를 실패하였습니다.");
					}
				});
			});	
		$("#creatorMyClassWriteOk").submit(()=>{
			if($("#class_term").val()==null||$("#class_term").val()==""){
				alert("수강기간을 입력하여 주세요.");
				return false;
			}
			if($("#class_img").val()==null||$("#class_img").val()==""){
				alert("클래스 대표이미지를 입력하여 주세요.");
				return false;
			}
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
			txt+='<li><input type="number" name="unitArray"style="width:60%"/></li>'; 
			txt+='<li>목차명<input type="hidden" name="codes" value="${code}"/></li>'; 
			txt+='<li><input type="text" name="unitContent" style="width:50%"/>'; 
			txt+='<input type="hidden" name="sectionCode"/></li>';
			txt+='<li><b class="unit_del">x</b></li></ul>';
			$("#ad_unit_box>li:last-child").before(txt);
		});
		$(document).on('click','.unit_del',(event)=>{
			$(event.target).parent().parent().remove();
		});	
		
		$("#class_img").change((event)=>{
			 if($(event.target)[0].files && $(event.target)[0].files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(data) {
			     $("#mainImg").attr("src", data.target.result).width(400).height(320);        
			    }
			    reader.readAsDataURL($(event.target)[0].files[0]);
			   }
		});
});
</script>
<div class="container">
<h1>클래스 등록</h1>
<form method="post" id="creatorMyClassWriteOk" action="/gachi/creatorMyClassWriteOk" enctype="multipart/form-data">
<ul id="ad_goods_writeForm">
	<li style="margin-top:80px;">
		<ul class="class_part">
			<li class="content_center">카테고리</li>
			<li>
				<select id="category" name="category">
					<option  value="공예/창작">공예/창작</option>
					<option value="요리">요리</option>
					<option value="미술">미술</option>
					<option value="음악">음악</option>
					<option value="라이프스타일">라이프스타일</option>
					<option value="운동">운동</option>
					<option value="사진/영상">사진/영상</option>
				</select>
			</li>
			<li class="content_center">클래스명</li>
			<li><input type="text" id="class_name" name="class_name" size="50"/></li>
			<li class="content_center">난이도</li>
			<li>
				<select id="stage" name="stage">
					<option value="초급">초급</option>
					<option value="중급">중급</option>
					<option value="고급">고급</option>
					<option value="마스터">마스터</option>
				</select>
			</li>
			<li class="content_center">원가격</li>
			<li><input type="number" id="full_price" name="full_price"/></li>
			<li class="content_center">판매가</li>
			<li><input type="number" id="real_price" name="real_price"/></li>
			<li class="content_center">수강기간</li>
			<li><input type="number" id="class_term" name="class_term" style="width:20%"/>일</li>
		</ul>
	</li>	
	<li id="bb" class="content_center" style="height:100%;">
		<div style="height:24px;">
			클래스 대표이미지
		</div>
		<div>
			<img id="mainImg" src="<%=request.getContextPath()%>/img/unnamed.gif"/>			
		</div>
		<div>
			<input type="file" name="mainImg" id="class_img" accept="image/*"/>
		</div>
	</li>
</ul>
<h3>서브이미지 추가</h3>
<div id="sub_img" class="content-center add_img" style="height:200px; border:3px solid #437299; text-align:center;">
		<h3 style="margin-top:70px;">이미지를 끌어주세요.</h3>
</div>
<h3>서브 이미지 목록</h3>
<div id="sub_imgArea" class="text_center ad_box">
</div>
<h3>목차정보</h3>
<ul class="ad_box" id="ad_unit_box">
			<li><button type="button" id="add_btn" class="btn">+</button></li>
</ul>
<script type="text/javascript">

</script>
<h3>클래스정보</h3>
<ul id="ad_goods_write">
	<li><textarea id="class_info" name="class_info"></textarea></li>
	<li class="content_center">
		<input type="hidden" id="code" name="code" value="${code}"/>
		<input type="submit" class="btn" value="등록"/>
		<input type="reset" class="btn" value="다시쓰기"/>
	</li>
</ul>
</form>
</div>
</div>