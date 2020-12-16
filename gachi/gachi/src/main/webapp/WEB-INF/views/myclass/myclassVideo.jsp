<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="resources/bootstrap.css" type="text/css" />
<link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/bootstrap.js"></script>
<script src="https://vjs.zencdn.net/7.10.2/video.js"></script>
<title>Insert title here</title>
<style>
	@font-face {
	font-family: 'OSeongandHanEum';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/OSeongandHanEum.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
	/* 클래스 수강하기(동영상 창) */
	
	.cfont{
		font-family:'OSeongandHanEum';
	}
 	a:link, a:visited, a:hover{
 		text-decoration:none;
 		color:#000;
 	}
 	a:hover{
 		font-weight:bold;
 	}
 	ul{
 		margin:0;
 		padding:0;
 		list-style-type:none;
 	}
	body{
		margin:0;
		padding:0;
	}
	
	/****************/
	/* 메인창 */
	#myclassVideoMain{
		width:74%;
		height:100vh;
		overflow:;
		float:left;	
	}

	/* 메인창 상단 - 동영상 제목 */
	#myclassVideoTop{
		padding:0;
		margin:0;
		height:7.5%;
		font-size:1.5em;
		line-height:50px;
	}
	#myclassVideoTop>div:first-child{
		height:100%;
		margin:0;
		width:15%;
		background-color:#ddd;
		float:left;
		text-align:center;
	}
	#myclassVideoTop>div:last-child{
		height:100%;
		margin:0;
		width:85%;
		background-color:#eee;
		float:left;
		overflow:hidden;
		padding-left:20px;
	}
	/* 목차열기,닫기 버튼 */
	#videoLstOpen, #videoLstClose{
		width:40px;
		float:right;
		margin:10px;
		font-size:1em;
		padding:0;
	}
	#videoLstOpen{
		display:none;
	}
	
	/* 메인창 - 영상재생창 */
	#myclassVideoView{
		height:85%;
		overflow:hidden;
	}
	#myclassVideoView img{
		width:100%;
		height:100%;
		object-fit:cover;
	}
	
	/* 메인창 하단 - 버튼 */
	#myclassVideoBtm{
		height:7.5%;
		background-color:#eee;
		text-align:center;
	}
	#myclassVideoBtm>button{
		margin:5px 10px;
		background-color:;
	}
	
	/****************/
	/* 목차 */
	#myclassVideoLst{
		width:26%;
		height:100vh;
		overflow:auto;
		border-left:1px solid gray;
		float:left;
	}
	#myclassVideoLst>label{
		font-size:1.3em;
		margin:10px 20px 0;
	}
	#myclassVideoLst>ul:nth-child(3)>li{
		margin:10px 20px;
	}
	#myclassVideoLst>ul:nth-child(3)>li>progress{
		width:100%;
	}
	#myclassVideoLst>ul:nth-child(3)>li:first-child{
		width:100%;
		font-size:1.3em;
		margin:10px 20px;
	}
	#myclassVideoLst>ul:last-child>li>label{
		line-height:40px;
		padding:0 20px;
		width:100%;
		background-color:#116487;
		color:#fff;
	}
	#myclassVideoLst ol>li{
		line-height:20px;
		margin:20px 0;
	}
	#myclassVideoLst ol>li:last-child{
		margin-bottom:40px;
	}
	#myclassVideoLst ol label{
		padding-right:10px;
		float:right;
		color:gray;
		font-size:1em;
	}
	#my-video{
		width:100%;
		height:100%;
	}
</style>
<script>
	$(function(){
		$('#videoLstClose').click(function(){
			$('#myclassVideoLst').hide();
			$('#myclassVideoMain').css('width','100%');
			$('#videoLstClose').hide();
			$('#videoLstOpen').show();
		});
		$('#videoLstOpen').click(function(){
			$('#myclassVideoLst').show();
			$('#myclassVideoMain').css('width','74%');
			$('#videoLstOpen').hide();
			$('#videoLstClose').show();
		});
	});
</script>
</head>
<body>
<div class="cfont">
	<div id="myclassVideoMain">
		<div id="myclassVideoTop">
			<div style="font-size:0.9em"><a href="/gachi/myclassView?code=${vo.code }">나가기<img src="/gachi/img/icon_back.png" style="width:15%;margin-bottom:3%;margin-left:3%"/></a></div>
			<div style="font-size:0.9em">
				프랑스 자수 클래스를 소개합니다!
				<button class="btn btn-light" id="videoLstClose">></button>
				<button class="btn btn-light" id="videoLstOpen"><</button>
			</div>
		</div>
		<div id="myclassVideoView">
			<video  id="my-video" class="video-js" controls preload="auto"
    				data-setup="{}">
    		<source src="/gachi/upload/class_video/${vVO.video_filename }" type="video/mp4" />	
    				
			</video>
		</div>
		<div id="myclassVideoBtm" style="padding:2px">
			<button type="button" class="btn btn-light">< 이전 영상</button>
			<button type="button" class="btn btn-primary">다 봤어요!</button>
			<button type="button" class="btn btn-light">다음 영상 ></button>
		</div>
	</div>
	<div id="myclassVideoLst">
		<div style="padding:10px 20px">
			<div><label class="badge badge-info" style="font-size:0.9em">${vo.category }</label><h4>${vo.class_name }</h4></div>
			<div>진도율 : 50%</div>
			<div>수강시간 : 0분</div>
			<div>수강기한 : ${vo.startdate } ~ ${vo.enddate }</div>
			<div class="progress" style="margin:20px 0"><div class="progress-bar progress-bar-striped bg-info" style="width:50%">50%</div></div>
		</div>
		<ul>
			<li>
				<label><b>프랑스 자수 클래스 소개</b></label>
				<ol>
					<li><a href="/gachi/myclassVideo">프랑스 자수 클래스를 소개합니다!<label>02:00</label></a></li>
					<li><a href="/gachi/myclassVideo">클래스 준비물과 주의사항에 대해 알아볼까요?<label>04:00</label></a></li>
				</ol>
			</li>
			<li>
				<label>01 프랑스 자수의 기초</label>
				<ol>
					<li><a href="#">실을 다루는 방법과 매듭짓는 방법<label>00:00</label></a></li>
					<li><a href="#">작품에 사용될 5가지 스티치 연습하기<label>00:00</label></a></li>
				</ol>
			</li>
			<li>
				<label>02 베개 커버에 수놓기</label>
				<ol>
					<li><a href="#">곰돌이 수놓기1<label>00:00</label></a></li>
					<li><a href="#">곰돌이 수놓기2<label>00:00</label></a></li>
				</ol>
			</li>
			<li>
				<label>03 자수 블랭킷 만들기</label>
				<ol>
					<li><a href="#">블랭킷 도안선 그리고 위치잡기<label>00:00</label></a></li>
					<li><a href="#">달모양 수놓기<label>00:00</label></a></li>
					<li><a href="#">가글 보틀 수놓기<label>00:00</label></a></li>
					<li><a href="#">잠옷입은 곰돌이 수놓기<label>00:00</label></a></li>
					<li><a href="#">탁상조명 수놓기<label>00:00</label></a></li>
				</ol>
			</li>
			<li>
				<label>04 완성</label>
				<ol>
					<li><a href="#">세탁방법 알아보기<label>00:00</label></a></li>
					<li><a href="#">상쾌한 아침을 기다려요!<label>00:00</label></a></li>
				</ol>
			</li>
		</ul>
	</div>
</div>
</body>
</html>