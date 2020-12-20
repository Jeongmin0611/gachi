<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
 #cre_profile_imgArea{
 	border:3px solid #437299;
 	border-radius:10px;
 	text-align:center;
 }
 #cre_profile_imgArea li{
 	padding:5px 0px;
 }
 #creator_editForm2{
 	margin:20px 0px;
 	border:3px solid #437299;
 	border-radius:10px;
 	overflow: auto;
 }
 #creator_editForm2>li{
 	float:left;
 	border-bottom:1px solid gray;
 	height:45px;
 	padding-top:7px;
 	overflow: auto;
 }

</style>
<script>

var nickNameChk2 = RegExp(/^[가-힣A-Za-z0-9]+$/);
var birthdateChk2 = RegExp(/^[0-9]+$/);
var business_numberChk= RegExp(/^[0-9]+$/);
var banknameChk=RegExp(/^[가-힣a-zA-Z]+$/);
var accountChk=RegExp(/^[0-9]+$/);

	$(()=>{
		
		$("#creator_editForm2>li:nth-child(2n+1)").css("width","15%").css("text-align","center");
		$("#creator_editForm2>li:nth-child(2n)").css("width","85%");
		$("#creator_editForm2>li:nth-child(21)").css("width","100%").css("border","none");
		$("#creator_editForm2>li:nth-child(22)").css("height","800px").css("margin","0");
		$(".form-control").css("width","30%").css("float","left");
		CKEDITOR.replace("creator_info");
		CKEDITOR.config.height=650;
		
		$("#frm").submit(function(){
			if($("#nickname").val()==""){
				alert("닉네임을 입력하세요.");
				return false;
			}
			if(!nickNameChk2.test($("#nickname").val())){ 
				alert("닉네임의 형식에 맞게 입력해주세요(특수문자X)");
				$("#nickname").val(""); 
				$("#nickname").focus(); 
				return false;
				}
			if($("#tel").val()==""){
				alert("연락처를 입력하세요.");
				$("#tel").focus();
				return false;
			}
			if($("#business_number").val()==""){
				alert("사업자번호를 입력하세요.");
				$("#business_number").focus();
				return false;
			}
			if($("#account").val()==""){
				alert("계좌번호를 입력하세요.");
				$("#account").focus();
				return false;
			}
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				$("#userpwd").focus();
				return false;
			}
			if(!pwdChk2.test($("#userpwd").val())){ 
				alert("비밀번호 형식에 맞지않습니다(8자 이상16자리이하 영어,특수문자,숫자 조합)");
				$("#userpwd").val(""); 
				$("#userpwd").focus(); 
				return false;
				}
			if($("#userpwdchk").val()==""){
				alert("비밀번호 확인을 입력하세요.");
				$("#userpwdchk").focus();
				return false;
			}
			
			if($("#userpwd").val()=="" && $("#userpwdchk").val()==""){
				return true;
			}
			if($("#userpwd").val() != $("#userpwdchk").val()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#userpwd").focus();
				return false;
			}
			return true;
		});
		
	});
	
    function onlyNumber(){

        if((event.keyCode<48)||(event.keyCode>57))

           event.returnValue=false;
	}
    
    function pictureDel(){
    	if(confirm("크리에이터 이미지를 삭제 하시겠습니까?")){
    		location.href="creatorPictureDelete";
    	}
    }
</script>
<div class="container ad_font">
	<h1>프로필 수정</h1>
	<div>
		<form method="post" id="frm" action="creatorEditOk" enctype="multipart/form-data">
			<ul id="cre_profile_imgArea" style="border:3px solid #437299;border-radius:10px;text-align:center;margin:10px 0px">
				<li>프로필 사진</li>
				<c:if test="${vo.picture eq null}"><li><img src="/gachi/img/add.png" style="width:100px; height:100px;"></li></c:if>
				<c:if test="${vo.picture ne null}"><li><img src="/gachi/upload/creatorImg/${vo.picture }" style="width:200px; height:200px;"></li>
				<button type="button" onclick="pictureDel();">삭제</button>
				<input type="hidden" name="picture" value="${vo.picture }" />
				</c:if>
				<li style="text-align:center;"><input type="file" accept="image/*" name="imgFile" id=imgFile value="" /></li>
			</ul>
			<ul id="creator_editForm2" class="form-group" style="overflow:auto">
				<li>아이디</li><li><input type="text" id ="userid" name="userid" value="${vo.userid }" size="30" readonly/></li>
				<li>비밀번호</li><li><input type="password" id="userpwd" name="userpwd" size="30" value=""/></li>
				<li>비밀번호확인</li><li><input type="password" id="userpwdchk" name="userpwdchk" size="30" value=""/></li>
				<li>크리에이터명</li><li><input type="text" id="nickname" name="nickname" size="30" value="${vo.nickname }"/></li>
				<li>생년월일</li><li><input type="text" id="birthdate" name="birthdate" size="30" value="${vo.birthdate }" readonly/></li>
				<li>연락처</li>
				<li><input type="text" id="tel" name ="tel" onkeypress="onlyNumber();" maxlength="11" oninput="numberMaxLength(this);" size="30" value="${vo.tel }"/></li>
				<li>사업자번호</li>
				<li><input type="text" id="business_number" name="business_number" size="30" onkeypress="onlyNumber();" value="${vo.business_number }"/></li>
				<li>은행</li>
				<li>
					<select name ="bankname" id="bankname">
						<option value="" selected>선택하세요</option>
						<option value="국민은행"<c:if test="${vo.bankname eq '국민은행'}"> selected</c:if>>국민은행</option>
						<option value="기업은행"<c:if test="${vo.bankname eq '기업은행'}"> selected</c:if>>기업은행</option>
						<option value="농협"<c:if test="${vo.bankname eq '농협'}"> selected</c:if>>농협</option>
						<option value="수협"<c:if test="${vo.bankname eq '수협'}"> selected</c:if>>수협</option>
						<option value="새마을금고"<c:if test="${vo.bankname eq '새마을금고'}"> selected</c:if>>새마을금고</option>
						<option value="신한은행"<c:if test="${vo.bankname eq '신한은행'}"> selected</c:if>>신한은행</option>
						<option value="우리은행"<c:if test="${vo.bankname eq '우리은행'}"> selected</c:if>>우리은행</option>
						<option value="카카오뱅크"<c:if test="${vo.bankname eq '카카오뱅크'}"> selected</c:if>>카카오뱅크</option>
						<option value="케이뱅크"<c:if test="${vo.bankname eq '케이뱅크'}"> selected</c:if>>케이뱅크</option>
						<option value="하나은행"<c:if test="${vo.bankname eq '하나은행'}"> selected</c:if>>하나은행</option>
						<option value="한국씨티은행"<c:if test="${vo.bankname eq '한국씨티은행'}"> selected</c:if>>한국씨티은행</option>
						<option value="BNK부산은행"<c:if test="${vo.bankname eq 'BNK부산은행'}"> selected</c:if>>BNK부산은행</option>
						<option value="sc제일은행"<c:if test="${vo.bankname eq 'sc제일은행'}"> selected</c:if>>sc제일은행</option>
					</select>
				</li>
				<li>계좌번호</li>
				<li><input type="text" id="account" name="account"  size="30" onkeypress="onlyNumber();" value="${vo.account }"/></li>
				<li>sns계정</li>
				<li><input type="text" id="sns_addr" name="sns_addr"  size="50" value="${vo.sns_addr }"/></li>
			</ul>
			<h3>소개글</h3>
			<textarea name="creator_info" id="creator_info" >${vo.creator_info }</textarea>
			<div style="text-align:center;margin-top:20px;">
				<button type="button" class="btn" onclick="location.href='/gachi/creatorDashboard'">돌아가기</button>
				<input type="submit" class="btn" id="frm" value="수정"/>
				<input type="reset" class="btn" value="다시쓰기"/>
			</div>
		</form>
	</div>
</div>