<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container ad_font">
<script type="text/javascript">
$(function(){
	
	
	
	$("#adminGoodsEdit").submit(()=>{
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
		/* if($("#goods_img1").val()==null || $("#goods_img1").val()=="") {
			alert("메인 이미지를 선택해주세요.");
			return false;
		} */
		/* if($("#detailImg1").val()==null || $("#detailImg1").val()=="") {
			alert("슬라이드 이미지1을  선택해주세요.");
			return false;
		} */
		return true;
	});	
});
function goodsDel(){
	if(confirm("해당 상품을 삭제하시겠습니까?")){
		location.href = "adminGoodsDelete?code=" + "${vo.code}";
	}
}
</script>
<div class="container">
<h1>상품수정</h1>
<form method="post" action="adminGoodsEditOk" id="adminGoodsEditOk" enctype="multipart/form-data">
<ul id="ad_goods_editForm" style="height: 500px;">
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
			<li class="content_center">메인 이미지</li>
			<li><input type="file" name="img_main" accept="image/*" id="goods_img1" /></li>
			<li class="content_center">상품 설명 이미지</li>
			<li><input type="file" name="img_goodsInfo" accept="image/*" id="goods_info" /></li>
			<li class="content_center">슬라이드 이미지1</li>
			<li><input type="file" name="img_detail1" accept="image/*" id="detailImg1" /></li>
			<li class="content_center">슬라이드 이미지2</li>
			<li><input type="file" name="img_detail2" accept="image/*" id="detailImg2" /></li>
			<li class="content_center">슬라이드 이미지3</li>
			<li><input type="file" name="img_detail3" accept="image/*" id="detailImg3" /></li>
		</ul>
	</li>
	
</ul>
<h3 style="text-align:center;">스토어 이미지 목록</h3>
<div class="text_center ad_box" style="margin :0 auto ; text-align:center; width : 850px;">
	<div style="margin:0 15px; width:230px;height:100%;">
		<div style="text-align:center;height:24px;">메인 이미지	
		</div>
		<div style="text-align:center">
			<img src="<%=request.getContextPath()%>/upload/storeImg/${vo.goods_img1}" style="width:200px; height:200px; text-align:center;"/>
		</div>
		<div>
			<input type="hidden" name="goods_img1" value="${vo.goods_img1 }"/> 
			<%-- <span class="wordCut">${imgList}</span><b>  x  </b> --%>
		</div>
		<div style="text-align:center;height:24px;">상품 설명 이미지	
		</div>
		<div style="text-align:center; width:200px; height: 200px;">
			<img src="<%=request.getContextPath()%>/upload/storeImg/${vo.goods_info}" style="width:200px; height:200px; text-align:center;"/>
		</div>
		<div>
			<input type="hidden" name="goods_info" value="${vo.goods_info }"/> 
			<%-- <span class="wordCut">${imgList}</span><b>  x  </b> --%>
		</div>
		<c:if test="${detail1 ne 'null' and detail1 ne null}">
		<div style="text-align:center;height:24px;">슬라이드 이미지1	
		</div>
		<div style="text-align:center">
			<img src="<%=request.getContextPath()%>/upload/storeImg/${detail1}" style="width:200px; height:200px; text-align:center;"/>
		</div>
		<div>
			<input type="hidden" name="detail1" value="${detail1 }"/> 
			<%-- <span class="wordCut">${imgList}</span><b>  x  </b> --%>
		</div>
		</c:if>
		<c:if test="${detail2 ne 'null' and detail2 ne null }">
		<div style="text-align:center;height:24px;">슬라이드 이미지2	
		</div>
		<div style="text-align:center">
			<img src="<%=request.getContextPath()%>/upload/storeImg/${detail2}" style="width:200px; height:200px;text-align:center;"/>
		</div>
		<div>
			<input type="hidden" name="detail2" value="${detail2 }"/> 
			<%-- <span class="wordCut">${imgList}</span><b>  x  </b> --%>
		</div>
		</c:if>
		<c:if test="${detail3 ne 'null' and detail3 ne null}">
		<div style="text-align:center;height:24px;">슬라이드 이미지3	
		</div>
		<div style="text-align:center">
			<img src="<%=request.getContextPath()%>/upload/storeImg/${detail3}" style="width:200px; height:200px;text-align:center;"/>
		</div>
		<div>
			<input type="hidden" name="detail3" value="${detail3 }"/> 
			<%-- <span class="wordCut">${imgList}</span><b>  x  </b> --%>
		</div>
		</c:if>
	</div>
</div>
		<ul id="ad_goods_write">
			<li class="content_center">
				<input type="submit" class="btn" value="수정"/>
				<input type="reset" class="btn" value="다시쓰기"/>
				<button type="button" class="btn" onclick="goodsDel();">삭제</button>
			</li>
		</ul>
	</form>
	</div>
</div>