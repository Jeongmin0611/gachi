<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	//초를 시분초로
	function getTimeStringSeconds(seconds){
		var hour, min, sec
		hour = parseInt(seconds/3600);
		min = parseInt((seconds%3600)/60);
		sec = seconds%60;
	
		if (hour.toString().length==1) hour = "0" + hour;
		if (min.toString().length==1) min = "0" + min;
		if (sec.toString().length==1) sec = "0" + sec;
		
		if(hour=="00"){
			return min + ":" + sec;
		}else{
			return hour + ":" + min + ":" + sec;
		}
	}
	//이전영상
	function prevVideo(){
		var video_code = "${video_code}";
		var video_code_num = video_code.substr(1)*1;
		var prevNum = video_code_num-1;
		return location.href='/gachi/myclassVideo?code=${code}&video_code=v'+prevNum;
	}
	//다음영상
	function nextVideo(){
		var video_code = "${video_code}";
		var video_code_num = video_code.substr(1)*1;
		var nextNum = video_code_num+1;
		return location.href='/gachi/myclassVideo?code=${code}&video_code=v'+nextNum;
	}
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
		$(".video_length").each(function(){
			$(this).text(getTimeStringSeconds($(this).text()));
		});
		$("#progressBtn").click(function(){
			$.ajax({
				url: "/gachi/progressInsert",
				data: "code=${vo.code}&video_code=${video_code}",
				type: "GET",
				success: function(result){
					if(result>0){
						location.href=location.href;
					}
				}, error: function(){
					console.log("progress 실패");
				}
			});
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
				${video_name }
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
			<c:if test="${video_code ne firstVideo }">	
				<button type="button" class="btn btn-light" onclick="prevVideo()">< 이전 영상</button>
			</c:if>
			<c:if test="${count eq 0 }">
				<button type="button" class="btn btn-primary" id="progressBtn">다 봤어요!</button>
			</c:if>
			<c:if test="${count ne 0 }">
				<button type="button" class="btn btn-secondary" disabled>수강완료</button>
			</c:if>
			<c:if test="${video_code ne lastVideo }">
				<button type="button" class="btn btn-light" onclick="nextVideo()">다음 영상 ></button>
			</c:if>
		</div>
	</div>
	<div id="myclassVideoLst">
		<div style="padding:10px 20px">
			<div><label class="badge badge-info" style="font-size:0.9em">${vo.category }</label><h4>${vo.class_name }</h4></div>
			<div>진도율 : <fmt:formatNumber value="${vo.progress }" pattern=".00" />%</div>
			<div>수강시간 : 0분</div>
			<div>수강기한 : ${vo.startdate } ~ ${vo.enddate }</div>
			<c:if test="${vo.progress eq 0 }">
				<div class="progress" style="height:30px;margin:10px 0"><div class="progress-bar progress-bar-striped bg-info" style="width:${vo.progress}%">${vo.progress }%</div></div>
			</c:if>
			<c:if test="${vo.progress ne 0 }">
				<div class="progress" style="height:30px;margin:10px 0"><div class="progress-bar progress-bar-striped bg-info" style="width:${vo.progress}%"><fmt:formatNumber value="${vo.progress }" pattern=".00" />%</div></div>
			</c:if>
		</div>
		<ul>
			<c:forEach var="map" items="${map}">
				<li>
					<label>${map.key }</label>
					<ol>
						<c:forEach var="list" items="${map.value }">
							<c:if test="${list.video_code eq video_code }">
								<li style="font-weight:bold"><a href="/gachi/myclassVideo?code=${list.code }&video_code=${list.video_code }">${list.video_name }<label class="video_length">${list.video_length }</label></a></li>
							</c:if>
							<c:if test="${list.video_code ne video_code }">
								<li><a href="/gachi/myclassVideo?code=${list.code }&video_code=${list.video_code }">${list.video_name }<label class="video_length">${list.video_length }</label></a></li>
							</c:if>
						</c:forEach>
					</ol>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
</body>
</html>