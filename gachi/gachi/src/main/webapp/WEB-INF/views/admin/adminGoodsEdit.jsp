<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container ad_font">
<script type="text/javascript">
$(function(){
	var editor=CKEDITOR.replace('goods_info',{
		imageUploadUrl:'/gachi/StoreimageUpload',
		extraPlugins:'uploadimage'
	});
	editor.on('fileUploadRequest', function( evt ) {
	    var fileLoader = evt.data.fileLoader,
	        formData = new FormData(),
	        xhr = fileLoader.xhr;
	    xhr.open( 'POST', fileLoader.uploadUrl, true );
	    formData.append( 'upload', fileLoader.file, fileLoader.fileName );
	    formData.append('type','GoodsEdit');
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
		
	$("#adminGoodsEdit").submit(()=>{
		let grpl = $("input[name=imgList]").length;
		if(grpl==0){
			alert("클래스 이미지를 최소 1개 이상 선택하여야 합니다.");
			return false;
		}
		if($("#store_name").val()==null||$("#store_name").val()==""){
			alert("클래스명을 입력하여 주세요.");
			return false;
		}
		if($("#stock").val()==null||$("#stock").val()==""){
			alert("재고 수량을 입력하여 주세요.");
			return false;
		}
		if($("#real_price").val()==null||$("#real_price").val()==""){
			alert("판매가를 입력하여 주세요.");
			return false;
		}
		return true;
	});	
});
function goodsDel(){
	if(confirm("해당 상품을 삭제하시겠습니까?")){
		
	}
}
</script>
<div class="container">
<h1>상품수정</h1>
<form method="post" action="adminGoodsEditOk" id="adminGoodsEditOk" enctype="multipart/form-data">
<ul id="ad_goods_writeForm">
	<li>
		<ul>
			<li class="content_center">상품코드</li>
			<li><input type="text" id="code" name="code" value="${vo.code }" readonly/></li>
			<li class="content_center">카테고리</li>
			<li>
				<select id="category" name="category">
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
			<li class="content_center">상품명</li>
			<li><input type="text" id="goods_name" name="goods_name" size="40" value="${vo.goods_name }"/></li>
			<li class="content_center">재고</li>
			<li><input type="text" id="stock" name="stock" value="${vo.stock }"/></li>
			<li class="content_center">판매금액</li>
			<li><input type="text" id="real_price" name="real_price" value="${vo.real_price } "/>
			
			</li>
			<li class="content_center">판매상태</li>
			<li>
				<select id="sale_state" name="sale_state">
					<option value="판매중지" 
						<c:if test="${vo.sale_state eq '판매중지'}"> selected</c:if>>판매중지</option>
					<option value="판매중" 
						<c:if test="${vo.sale_state eq '판매중'}"> selected</c:if>>판매중</option>
					<option value="판매종료" 
						<c:if test="${vo.sale_state eq '판매종료'}"> selected</c:if>>판매종료</option>
				</select>
			</li>
		</ul>
	</li>
	<li class="content_center">
		<div style="height:24px;margin:7px 0px;">
			상품 이미지 추가
		</div>
		<div class="content-center add_img" style="width:80%; height:80%; margin:0 auto">
			<img src="<%=request.getContextPath()%>/img/add.png" style="width:100px;height:100px;margin-top:70px;">
		</div>
	</li>
</ul>
<h3>스토어 이미지 목록</h3>
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
		<ul id="ad_goods_write">
			<li>상품설명</li>
			<li><textarea name="goods_info" id="goods_info">${vo.goods_info }</textarea></li>
			<li>첨부파일 <input type="file" name="no"/> </li>
			<li class="content_center">
				<input type="submit" class="btn" value="수정"/>
				<input type="reset" class="btn" value="다시쓰기"/>
				<button class="btn" onclick="goodsDel()">삭제</button>
			</li>
		</ul>
	</form>
	</div>
</div>