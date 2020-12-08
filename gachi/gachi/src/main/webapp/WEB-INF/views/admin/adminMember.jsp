<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<script>
$(function(){
	
	$('.container>div:nth-of-type(2)').css("margin-bottom","10px");
	
	if('${withdraw}' != '') {
		$("#withdraw").val("${withdraw}");
	} else{
		$("#withdraw").val('');
	}
	if('${search}' != '') {
		$("#search").val("${search}");
	}
	$("#frm_submit").click(function(){
		var url = "/adminMember";
		var data = "withdraw=" + $("#withdraw").val() + "&search=" + $("#search").val().trim(); + "&now=" + ${nowPage};
		$.ajax({
			url : url,
			data : data,
			type : "POST",
			dataType : "json",
			success: function(data){
				var result = data.result;
				console.log(result);
			},error:function(){
				var result = data.result;
				console.log(result);
			}
		});
		
	});
});

function postPageMove(now) {
	var url = "/adminMember";
	var data = "withdraw=" + $("#withdraw").val() + "&search=" + $("#search").val().trim(); + "&now=" + now;
	$.ajax({
		url : url,
		data : data,
		type : "POST",
		dataType : "json",
		success: function(data){
			var result = data.result;
			console.log(result);
		},error:function(){
			var result = data.result;
			console.log(result);
		}
	});
}
</script>
<div class="container ad_font">
<h1>회원관리</h1>
<div>
	<ul id="ad_member_info">
		<li>●총 회원 : ${countAllMember }명</li>
		<li>●현재 회원 : ${countNowMember }명</li>
		<li>●탈퇴한 회원 : ${countDeletedMember }명</li>
	</ul>
</div>
<div style="text-align:right"> 
	<form action="adminMember" method="post" id="frm">
		<!-- <select name="ad_opt1">
			<option value="">전체</option>
			<option value="userid">아이디</option>
			<option value="username">이름</option>
			<option value="nickname">닉네임</option>
			<option value="tel">연락처</option>
		</select> -->
		<select id="withdraw" name="withdraw">
			<option value="">전체</option>
			<option value="회원">가입</option>
			<option value="탈퇴">탈퇴</option>
		</select>
		<input type="text" id="search" name="search"/>
		<input type="hidden" id="now" value="${nowPage }"/>
		<input type="submit" id="frm_submit" class="btn" value="검색" />
	</form>
</div>
<ul id="ad_member_lst" class="text-center">
	<li>번호</li>
	<li>아이디</li>
	<li>닉네임</li>
	<li>이름</li>
	<li>연락처</li>
	<li>가입일</li>
	<li>탈퇴일</li>
	<li>상태</li>
	
	<c:forEach var="memberList" items="${memberList }">
		<li>${memberList.rownum }</li>
		<li><a href="/gachi/adminMemberView?userid=${memberList.userid}">${memberList.userid }</a></li>
		<li>${memberList.nickname }</li>
		<li>${memberList.username }</li>
		<li>${memberList.tel }</li>
		<li>${memberList.signupdate }</li>
		<li><c:if test="${memberList.deleted eq '탈퇴'}">${memberList.withdrawdate }</c:if><c:if test="${memberList.deleted ne '탈퇴'}"> </c:if></li>
	<li>${memberList.deleted}</li>	
	</c:forEach>
</ul>	
	<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<c:if test="${method eq 'get' }">
				<c:if test="${nowPage > 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminMember?now=${nowPage - 1 }">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="1" end="${lastPage}">
					<li class="btn">
						<a class="btn" href="/gachi/adminMember?now=${i }">Prev</a>
					</li>
				</c:forEach>
				<c:if test="${nowPage < lasttPage}">
					<li class="btn">
						<a class="btn" href="/gachi/adminMember?now=${nowPage + 1 }">Next</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${method eq 'post' }">
				<c:if test="${nowPage > 1}">
					<li class="btn">
						<a class="btn" onClick="postPageMove(${nowPage -1});">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="응가" end="${lastPage}">
					<li class="btn">
						<a class="btn" href="postPageMove(${i });">Prev</a>
					</li>
				</c:forEach>
				<c:if test="${nowPage < lasttPage}">
					<li class="btn">
						<a class="btn" href="postPageMove(${nowPage + 응가 });">Next</a>
					</li>
				</c:if>
			</c:if>
			
	</ul>
</div>
</div>