<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

#CserviceSearchDiv {
	float: right;
}

#CserviceSearchTxt {
	border: 0;
	border-bottom: 1px solid black;
	outline: none;
}

#CserviceSearchDiv button {
	background-color: white;
	color: black;
	border: 0;
}

#CserviceSearchDiv button:focus {
	outline: none;
	color: #888;
}

</style>
<div class="CboardDiv">
	<div id="CserviceSearchDiv">
		<select name="CserviceSelect">
			<option value="CSall">전체</option>
			<option value="CSSubject">질문</option>
			<option value="CSContent">답변</option>			
		</select>
		<input type="text" name="CserviceSearchTxt" id="CserviceSearchTxt" />
			<button name="CserviceSearchBtn">검색하기</button>
	</div>

</div>