<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		$(".ad_settle_searchForm").css("text-align","right");
		$("#ad_settle_info").css("border","3px solid #F4BFA9");
		$("#ad_settle_info").css("padding","20px");
	});
</script>
<div class="container">
<h1>정산관리</h1>
	<form method="post" action="">
	<div class="ad_settle_searchForm">
		<a href="#">전일</a>
		<input type="date" name="date1"/>~<input type="date" name="date2"/>
		<a href="#">다음</a>
		<button>금월</button>
		<button>전월</button>	
	</div>
	<div class="ad_settle_searchForm">
		<select>
			<option>공예/창작</option>
			<option>요리</option>
			<option>미술</option>
			<option>음악</option>
			<option>라이프스타일</option>
			<option>운동</option>
			<option>사진영상</option>
		</select>
		<input type="text" name="" placeholder="크리에이터명"/>
		<input type="submit" value="검색"/> 
	</div>
	</form>
	<div class="text-center textSize">
		<input type="radio" name="" checked/>전체
		<input type="radio" name=""/>스토어
		<input type="radio" name=""/>크리에이터
	</div>
	<div id="ad_settle_info" class="text-center">
		<h1>총 매출액</h1>
		<h1>154,4540원</h1>
	</div>
	<div>
	<button style="text-align:right">일괄정산</button>
	<ul id="ad_settle_lst" class="text-center">
		
		<li>크리에이터아이디</li>
		<li>카테고리</li>
		<li>크리에이터명</li>
		<li>정산예정금액</li>
		<li>지급금액</li>
		<li>지급일</li>
		<li>정산상태</li>
		
		<li>hogildong@naver.com</li>
		<li>라이프스타일</li>
		<li>홍길동</li>
		<li>150000</li>
		<li>0</li>
		<li>2020-11-14</li>
		<li><button>정산처리</button></li>
	</ul>
	</div>
<div id="paging">
	<ul>
		<li>prev</li>
		<li>1</li>
		<li>2</li>
		<li>3</li>
		<li>4</li>
		<li>5</li>
		<li>next</li>
	</ul>
</div>
</div>