<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container ad_font">
<script type="text/javascript">
 $(function(){	
	$("#adminEventWrite").submit(()=>{
		let grpl = $("input[name=imgList]").length;
		if(grpl==0){
			alert("이벤트 이미지를 최소 1개 이상 선택하여야 합니다.");
			return false;
		}
		if($("#subject").val()==null||$("#subject").val()==""){
			alert("상품명을 입력하여 주세요.");
			return false;
		}
		return true;
	});	
});


function onlyNumber(){

    if((event.keyCode<48)||(event.keyCode>57))

       event.returnValue=false;

}

</script>
<div class="container">
<h1>이벤트 등록</h1>
<form method="post" action="adminEventWriteOk" id="dataForm" enctype="multipart/form-data">
<ul id="ad_Event_writeForm">
	<li>
		<ul>
			<li class="content_center">제목</li>
			<li><input type="text" id="subject" name="subject" size="40" value=""placeholder=" 제목을 입력하세요"/></li>
			<li class="content_center">시작 기간</li>
			<li><input type="date" id="startdate" name="startdate" onkeypress="onlyNumber();" maxlength="8" value="${todate }" placeholder="예:20200101"/></li>
			<li class="content_center">종료 기간</li>
			<li><input type="date" id="enddate" name="enddate"  onkeypress="onlyNumber();" maxlength="8" value="" placeholder="예:20200131"/></li>
			<li class="content_center">메인 이미지</li>
			<li><input type="file" name="img_event" accept="image/*" id="event_img" /></li>
			<li class="content_center">이벤트 설명 이미지</li>
			<li><input type="file" name="img_content" accept="image/*" id="content" /></li>
		</ul>
	</li>

</ul>

		<ul id="ad_goods_write" style="margin-top: 50px;">
			<!-- <li>상품설명</li>
			<li><textarea name="content_textarea" id="content_textarea"></textarea></li>
			<li>첨부파일 <input type="file" name="no"/> </li> -->
			<li class="content_center">
				<input type="submit" class="btn" value="등록하기"/>
				<input type="reset" class="btn" value="다시쓰기"/>
			</li>
		</ul>
	</form>
	</div>
</div>