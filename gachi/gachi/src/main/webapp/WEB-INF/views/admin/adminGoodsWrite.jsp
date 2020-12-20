<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container ad_font">
<script type="text/javascript">
var detailImgSize = 1;
$(function(){
	var todate = "${todate}";
	var cnt = "${cnt}";
	if(cnt < 10) cnt = "0" + cnt;

	var code = "g" + todate.substr(0,4) + todate.substr(5,2) + todate.substr(8,2) + cnt;
	$("#code").val(code);

		/* $(document).on('click', '.detailImgAdd', function(){
			detailImgSize = detailImgSize + 1;
			
			var detailImg  = "<li class='content_center'>슬라이드 이미지"+(detailImgSize)+"</li><li><input type='file' name='img_detail"+(detailImgSize)+"' class='goods_img2' id='detailImg"+(detailImgSize)+"' /><button type='button' class='detailImgAdd'>상세이미지추가</button></li>";
			$(this).parent().after($(detailImg));
			$(this).remove();
			
		});// detailImgAdd clicks */
		
			
	$("#adminGoodsWriteOk").submit(()=>{
		if($("#goods_name").val()==null||$("#goods_name").val()==""){
			alert("상품명을 입력하여 주세요.");
			return false;
		}
		if($("#startdate").val()==null||$("#startdate").val()==""){
			alert("판매시작일을 입력하여 주세요.");
			return false;
		}
		if($("#enddate").val()==null||$("#enddate").val()==""){
			alert("판매종료일을 입력하여 주세요.");
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
		if($("#goods_info").val()==null || $("#goods_info").val()=="") {
			alert("상품 설명 이미지를 선택해주세요.");
			return false;
		}
		if($("#goods_img1").val()==null || $("#goods_img1").val()=="") {
			alert("메인 이미지를 선택해주세요.");
			return false;
		}
		if($("#detailImg1").val()==null || $("#detailImg1").val()=="") {
			alert("슬라이드 이미지1을  선택해주세요.");
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
<h1>상품등록</h1>
<form method="post" action="adminGoodsWriteOk" id="adminGoodsWriteOk" enctype="multipart/form-data">
<ul id="ad_goods_writeForm">
	<li>
		<ul>
			<!-- <li class="content_center">상품코드</li>
			<li><input type="text" id="code" name="code" value=""/> 생성시 시퀀스로 자동생성</li> -->
			<li class="content_center">카테고리</li>
			<li>
				<select id="category" name="category">
					<option  value="공예/창작"selected>공예/창작</option>
					<option value="요리">요리</option>
					<option value="미술">미술</option>
					<option value="음악">음악</option>
					<option value="라이프스타일">라이프스타일</option>
					<option value="운동">운동</option>
					<option value="사진/영상">사진/영상</option>
				</select>
			</li>
			<input type="hidden" name="code" id="code" value=""/>
			<li class="content_center">판매시작일</li>
			<li><input type="date" id="startdate" name="startdate" value="${todate }"/></li>
			<li class="content_center">판매종료일</li>
			<li><input type="date" id="enddate" name="enddate" value=""/></li>
			<li class="content_center">상품명</li>
			<li><input type="text" id="goods_name" name="goods_name" size="40" value=""/></li>
			<li class="content_center">재고</li>
			<li><input type="text" id="stock" name="stock" value=""/></li>
			<li class="content_center">원가금액</li>
			<li><input type="text" id="prime_cost" name="prime_cost" size="40" value=""/></li>
			<li class="content_center">판매금액</li>
			<li><input type="text" id="real_price" name="real_price" value=""/></li>
			<li class="content_center">판매상태</li>
			<li>
				<select id="sale_state" name="sale_state">
					<option value="판매중지" selected>판매중지</option>
					<option value="판매중">판매중</option>
					<option value="판매종료">판매종료</option>
				</select>
			</li>
			<li class="content_center">상품 설명 이미지</li>
			<li><input type="file" name="img_goodsInfo" accept="image/*" id="goods_info" /></li>
			<li class="content_center">메인 이미지</li>
			<li><input type="file" name="img_main" accept="image/*" id="goods_img1" /></li>
			<li class="content_center">슬라이드 이미지1</li>
			<li><input type="file" name="img_detail1" accept="image/*" id="detailImg1" /></li>
			<li class="content_center">슬라이드 이미지2</li>
			<li><input type="file" name="img_detail2" accept="image/*" id="detailImg2" /></li>
			<li class="content_center">슬라이드 이미지3</li>
			<li><input type="file" name="img_detail3" accept="image/*" id="detailImg3" /></li>
		</ul>
	</li>
	<%-- <li class="content_center">
		<div style="height:24px;margin:7px 0px;">
			스토어 이미지 추가
		</div>
		<div class="content-center add_img" style="width:80%; height:80%; margin:0 auto">
			<img src="<%=request.getContextPath()%>/img/add.png" style="width:100px;height:100px;margin-top:70px;">
		</div>
	</li> --%>
</ul>
<%-- <h3>스토어 이미지 목록</h3>
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
</div> --%>
		<ul id="ad_goods_write">
			<!-- <li>상품설명</li>
			<li><textarea name="goods_info" id="goods_info"></textarea></li>
			<li>첨부파일 <input type="file" name="no"/> </li> -->
			<li class="content_center">
				<input type="submit" class="btn" value="등록하기"/>
				<input type="reset" class="btn" value="다시쓰기"/>
			</li>
		</ul>
	</form>
	</div>
</div>