<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="resources/Chart.js"></script>
<style>
.ad_StatClass_Piechart {
	float: left;
	width: 33%;
	margin: 50px 0px;
	font-size: 1.5em;
}

canvas {
	width: 100%;
	margin-bottom: 20px;
}

#ad_StatClass_ul>li {
	float: left;
	width: 20%;
	text-align: center;
	margin-left: 100px;
}

.ad_StatClass_board {
	border: 2px solid #437299;
	border-radius:10px;
	width: 250px;
	height: 150px;
	padding: 10px;
	margin-top: 50px;
}


</style>

<script type="text/javascript">
	$(function(){
		
		$("#startDate").val("${startDate}");
		$("#endDate").val("${endDate}");
		if('${category}' != '') {
			$("#category").val("${category}");
		} else{
			$("#category").val('');
		}
		if('${username}' != '') {
			$("#username").val("${username}");
		}
		
		$("#countStatClassAll").text( ${countStatClassAll});
		$("#countClassN").text(${countClassN});
		$("#countClassY").text(${countClassY});
		
		console.log(${countStatClassAll});
		console.log(${countClassN});
		console.log(${countClassY});
		
		
		$("#frm").click(function(){
			var url = "/adminStatClass";
			var data = "startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val() /*+ "&category=" + $('#category').val() + "&username=" + $('#username').val().trim()*/;
			$.ajax({
				url : url,
				data : data,
				success: function(data){
				/* 	$("#startMonth").append("${startMonth}");
					$("#endMonth").append("${endMonth}"); */
					
				},error:function(){
					console.log("ajax에러발생");
				}
			});
		});
	});

</script>		

<div class="container ad_StatClass_center text-center">
	<div class="container ad_font">
	<h1>클래스 통계</h1>
		<form action="adminStatClass" method="post" id="frm">
		<div class="ad_StatClass_searchForm">
			
		<input type="date" name="startDate" id="startDate" value=""/>~<input type="date" name="endDate" id="endDate" value=""/>
		</div>
<!--  		<div class="ad_StatClass_searchForm">
			<select id="category" name="category">
				<option value="">전체</option>
				<option value="공예/창작">공예/창작</option>
				<option value="요리">요리</option>
				<option value="미술">미술</option>
				<option value="음악">음악</option>
				<option value="라이프스타일">라이프스타일</option>
				<option value="운동">운동</option>
				<option value="사진/영상">사진/영상</option>
			</select>
			<input type="text" name="username" id="username" placeholder="크리에이터명" size="40"/>
			<input type="submit" class="btn" value="검색"/> 
		</div>
		
		<div class="text-center textSize">
			<input type="radio" name="" checked/>전체
			<input type="radio" name=""/>스토어
			<input type="radio" name=""/>크리에이터<br/>
		</div> -->
			<ul id="ad_StatClass_ul">
				<li><div class="ad_StatClass_board">
							<b>총 클래스</b><br/>
							<span style="font-size:50px;line-height:100px" id="countStatClassAll"></span>
						</div></li>
				<li><div class="ad_StatClass_board">
							<b>미승인 클래스</b><br/>
							<span style="font-size:50px;line-height:100px" id="countClassN"></span>
						</div></li>
				<li><div class="ad_StatClass_board">
							<b>승인 클래스</b><br/>
							<span style="font-size:50px;line-height:120px" id="countClassY"></span>
					</div></li>							
			</ul>
		</form>
</div>
		<div>
			<canvas id="ad_StatClass_chart" style="margin-top:50px"></canvas>
			<script type="text/javascript">
			var ad_StatClass_context = document.getElementById('ad_StatClass_chart').getContext('2d');
			var ad_StatClass_chart = new Chart(ad_StatClass_context, {
			    type: 'line',
			    data: {
			        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
			        datasets: [{
			            label: '월별 매출 기록',
			            data: [100, 50, 150, 100, 60, 60, 70, 30, 90, 200, 36, 88],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 120, 252, 0.2)',
			                'rgba(180, 111, 220, 0.2)',
			 
			  
				],
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
			</script>
	</div>
	<div class="ad_StatClass_Piechart cfont" >
		<canvas id="ad_StatClass_gender_chart" data-aos="fade-up"
     	data-aos-anchor-placement="top-center"></canvas>
		<script type="text/javascript">
		var ad_StatClass_gender_context = document.getElementById('ad_StatClass_gender_chart').getContext('2d');
		var ad_StatClass_gender_chart = new Chart(ad_StatClass_gender_context, {
		    type: 'pie',
		    data: {
			labels : ["Man" , "Woman"],
			datasets : [{
			backgroundColor : ["#2ecc71","#3498dd"],
			hoverBackgroundColor : ["#a6a6a6","#d1b2ff"],
			data : [10,9]
				}]
			},
			options : {
				responsive: false
				}
			});
		
		</script>
		성별
	</div>
	<div class="ad_StatClass_Piechart cfont">	
		<canvas id="ad_StatClass_age_chart" data-aos="fade-up"
     data-aos-anchor-placement="top-center"></canvas>
		<script type="text/javascript">
		var ad_StatClass_age_context = document.getElementById('ad_StatClass_age_chart').getContext('2d');
		var ad_StatClass_age_chart = new Chart(ad_StatClass_age_context, {
		    type: 'pie',
		    data: {
			labels : ["유아" ,"10대" , "20대", "30대", "40대", "50대 이상"],
			datasets : [{
			backgroundColor : ["#2ecc71","#3498dd","pink","yellow","green","orange"],
			hoverBackgroundColor : ["#a6a6a6","#d1b2ff","pink","yellow","green","orange"],
			data : [10,9,7,3,1,2]
				}]
			},
			options : {
				responsive: false
				}
			});
		
		</script>
		연령별
		</div>
		<div class="ad_StatClass_Piechart cfont">
		<canvas id="ad_StatClass_star_chart" data-aos="fade-up"
     data-aos-anchor-placement="top-center"></canvas>
		<script type="text/javascript">
		var ad_StatClass_star_context = document.getElementById('ad_StatClass_star_chart').getContext('2d');
		var ad_StatClass_star_chart = new Chart(ad_StatClass_star_context, {
		    type: 'pie',
		    data: {
			labels : ["1점" ,"2점" , "3점", "4점", "5점"],
			datasets : [{
			backgroundColor : ["#2ecc71","#3498dd","pink","yellow","orange"],
			hoverBackgroundColor : ["#a6a6a6","#d1b2ff","pink","yellow","orange"],
			data : [10,9,7,3,1]
				}]
			},
			options : {
				responsive: false
				}
				});	
			</script>
			평점
		</div>
</div>	
	