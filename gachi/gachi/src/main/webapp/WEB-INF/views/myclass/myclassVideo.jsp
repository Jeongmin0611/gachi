<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/bootstrap.css" type="text/css" />
<title>Insert title here</title>
<style>
 	a:link, a:visited, a:hover{text-decoration:none;color:#000;}
 	a:hover{font-weight:bold;}
	body{margin:0;padding:0;height:100vh;}
	#myclassVideoTop{padding:0;margin:0;height:7.5%;font-size:1.5em;line-height:50px;}
	#myclassVideoTop>div:first-child{height:100%;margin:0;width:10%;background-color:#F4BFA9;float:left;text-align:center;}
	#myclassVideoTop>div:last-child{height:100%;margin:0;width:70%;background-color:#eee;}
	
	#myclassVideoView{height:85%;overflow:hidden;}
	#myclassVideoView img{width:70%;height:100%;object-fit:cover;}
	
	#myclassVideoBtm{width:70%;height:7.5%;background-color:#F4BFA9;}
</style>
</head>
<body>
	<div id="myclassVideoTop">
		<div><a href="/gachi/myclassView">내 학습표</a></div>
		<div>프랑스 자수 클래스를 소개합니다!</div>
	</div>
	<div id="myclassVideoView">
		<img src="/gachi/img/video_test_image.png"/>
	</div>
	<div id="myclassVideoBtm">
		<button type="button" class="btn btn-primary">이전 동영상</button>
		<button type="button" class="btn btn-primary">다음 동영상</button>
	</div>
</body>
</html>