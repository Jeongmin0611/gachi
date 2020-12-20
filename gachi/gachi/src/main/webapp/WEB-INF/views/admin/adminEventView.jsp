<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
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

function EventDel(){
	if(confirm("해당 상품을 삭제하시겠습니까?")){
		location.href="adminEventDelete?event_num=" + "${vo.event_num}";
	}
}
</script>
<div class="container">
<h1>이벤트 수정</h1>
<form method="post" action="adminEventEditOk" id="adminEventEditOk" enctype="multipart/form-data">
<ul id="ad_Event_writeForm">
	<li>
		<ul>
			<li class="content_center">이벤트 번호</li>
			<li><input type="text" id="event_num" name="event_num" value="${vo.event_num }"/></li>
			<li class="content_center">제목</li>
			<li><input type="text" id="subject" name="subject" size="40" value="${vo.subject }"/></li>
			<li class="content_center">시작 기간</li>
			<li><input type="date" id="startdate" name="startdate" maxlength="8" oninput="maxLengthCheck(this)" value="${vo.startdate }"/></li>
			<li class="content_center">종료 기간</li>
			<li><input type="date" id="enddate" name="enddate" maxlength="8" oninput="maxLengthCheck(this)" onkeypress="onlyNumber();" value="${vo.enddate }"/></li>
			<li class="content_center">메인 이미지</li>
			<li><input type="file" name="img_event" accept="image/*" id="img_event" /></li>
			<li class="content_center">이벤트설명 이미지</li>
			<li><input type="file" name="img_content" accept="image/*" id="img_content" /></li>
		</ul>
	</li>
	<li class="content_center">
		<div style="height:24px;margin:7px 0px;">
			이벤트 대표 이미지
		</div>
		<div class="content-center add_img" style="width:80%; height:80%; margin:0 auto">
			<img src="<%=request.getContextPath()%>/img/add.png" style="width:100px;height:100px;margin-top:70px;">
		</div>
	</li>
</ul>
<!--  --><h3>이벤트 이미지 목록</h3>
<div class="text_center ad_box">
	<div style="margin:0 15px; width:230px;height:100%;">
		<div style="text-align:center;height:24px;">메인 이미지	
		</div>
		<div style="text-align:center; width:200px; height: 200px;">
			<img src="<%=request.getContextPath()%>/upload/eventImg/${vo.event_img}" style="width:200px; height:200px;"/>
		</div>
		<div>
			<input type="hidden" name="event_img" value="${vo.event_img}"/> 
			<%-- <span class="wordCut">${vo.event_img}</span><b>  x  </b> --%>
		</div>
		<div style="text-align:center;height:24px;">이벤트 설명 이미지	
		</div>
		<div style="text-align:center; width:200px; height: 200px;">
			<img src="<%=request.getContextPath()%>/upload/eventImg/${vo.content}" style="width:200px; height:200px;"/>
		</div>
		<div>
			<input type="hidden" name="content" value="${vo.content}"/> 
		<%-- 	<span class="wordCut">${vo.content}</span><b>  x  </b> --%>
		</div>
	</div>

</div>
 		<ul id="ad_event_write">
			<!-- <li>상품설명</li>
			<li><textarea name="event_Wordinfo" id="event_Wordinfo"></textarea></li>
			<li>첨부파일 <input type="file" name="no"/> </li>-->
			<li class="content_center">
				<input type="submit" class="btn" value="수정하기"/>
				<input type="reset" class="btn" value="다시쓰기"/>
				<button type="button" class="btn" value="삭제하기" id="remove" onClick="EventDel();">삭제하기</button>
			</li>
		</ul> 
	</form>
	</div>
</div>