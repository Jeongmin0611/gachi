<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#ad_dash_board_ul>li {
	float: left;
	width: 20%;
	text-align: center;
	margin-left: 100px;
}

.ad_dash_board {
	border: 2px solid #437299;
	border-radius:10px;
	width: 300px;
	height: 200px;
	padding: 10px;
	margin-top: 50px;
}
b{
	margin-top:10px;
}

</style>    
<script>
$(function(){ // 로딩시,
	$('#ad_all').css('display', 'block');
	$('#ad_member').css('display', 'none');
	$('#ad_creator').css('display', 'none');
	
	
	$("#ad_dash_settleAll").text("￦ " + numberWithCommas("${Allpayment}"));
	$("#ad_dash_settleStore").text("￦ " + numberWithCommas("${AllPaymentStore}"));
	$("#ad_dash_settleClass").text("￦ " + numberWithCommas("${AllPaymentClass}")); 
	
	$('#ad_dash_settleAll').css('display', 'block');
	$('#ad_dash_settleStore').css('display', 'none');
	$('#ad_dash_settleClass').css('display', 'none');
	
	$('#dashAllchart_Div').css('display', 'block');
	$('#dashStorechart_Div').css('display', 'none');
	$('#dashClasschart_Div').css('display', 'none');
	
	
	 // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=ad_dash_User]").click(function(){
        if($("input[name=ad_dash_User]:checked").val() == "전체"){
        	$('#ad_all').css('display', 'block');
        	$('#ad_member').css('display', 'none');
        	$('#ad_creator').css('display', 'none');	
        }else if($("input[name=ad_dash_User]:checked").val() == "회원"){
        	$('#ad_all').css('display', 'none');
        	$('#ad_member').css('display', 'block');
        	$('#ad_creator').css('display', 'none');	
        }else if($("input[name=ad_dash_User]:checked").val() == "크리에이터"){
        	$('#ad_all').css('display', 'none');
        	$('#ad_member').css('display', 'none');
        	$('#ad_creator').css('display', 'block');	
        }
    });
	 
    $("input:radio[name=ad_dash_pay]").click(function(){
        if($("input[name=ad_dash_pay]:checked").val() == "전체"){
        	$('#ad_dash_settleAll').css('display', 'block');
        	$('#ad_dash_settleStore').css('display', 'none');
        	$('#ad_dash_settleClass').css('display', 'none');
        	
        	$('#dashAllchart_Div').css('display', 'block');
        	$('#dashStorechart_Div').css('display', 'none');
        	$('#dashClasschart_Div').css('display', 'none');
        }else if($("input[name=ad_dash_pay]:checked").val() == "스토어"){
        	$('#ad_dash_settleAll').css('display', 'none');
        	$('#ad_dash_settleStore').css('display', 'block');
        	$('#ad_dash_settleClass').css('display', 'none');
        	
        	$('#dashAllchart_Div').css('display', 'none');
        	$('#dashStorechart_Div').css('display', 'block');
        	$('#dashClasschart_Div').css('display', 'none');
        }else if($("input[name=ad_dash_pay]:checked").val() == "클래스"){
        	$('#ad_dash_settleAll').css('display', 'none');
        	$('#ad_dash_settleStore').css('display', 'none');
        	$('#ad_dash_settleClass').css('display', 'block');
        	
        	$('#dashAllchart_Div').css('display', 'none');
        	$('#dashStorechart_Div').css('display', 'none');
        	$('#dashClasschart_Div').css('display', 'block');
        }
    });
});
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>

<div class="container ad_dash_center text-center ad_font">
<h1 style="text-align:center;"> 관리자 대시보드 </h1>
<br/>
	<div id ="ad_dash_div">
		<form action="adminDashboard" method="post">
         <input type="month" id="startMonth" name="startMonth" value="${startMonth }" onchange="return chkPeriod();"/>
         -
         <input type="month" id="endMonth" name="endMonth" value="${endMonth }" onchange="return chkPeriod();"/>
         <input type ="submit" class="btn btn-outline-dark btn-sm" id="frm" value="조회"/>
         
		<ul id="ad_dash_board_ul">
			<li><div class="ad_dash_board"><input type="radio" name="ad_dash_User" value="전체" checked/>전체
					<input type="radio" name="ad_dash_User" value="회원" />회원
					<input type="radio" name="ad_dash_User" value="크리에이터"/>크리에이터<br/>
						<b>가입자 수</b><br/>
						<span style="font-size:50px;line-height:100px" id="ad_all"> ${dashAllMemberData} 명</span>
						<span style="font-size:50px;line-height:100px" id="ad_member"> ${dashMemberData} 명</span>
						<span style="font-size:50px;line-height:100px" id="ad_creator"> ${dashCreatorData} 명</span>
					</div></li>
			<li><div class="ad_dash_board"><input type="radio" name="ad_dash_pay" value="전체" checked/>전체
					<input type="radio" name="ad_dash_pay" value="스토어"/>스토어
					<input type="radio" name="ad_dash_pay" value="클래스"/>클래스<br/>
						<b>총 매출</b><br/>
						<span style="font-size:50px;line-height:100px" id="ad_dash_settleAll"> ${Allpayment}</span>
						<span style="font-size:50px;line-height:100px" id="ad_dash_settleStore"> ${AllPaymentStore}</span>
						<span style="font-size:50px;line-height:100px" id="ad_dash_settleClass"> ${AllPaymentClass}</span>
						<%-- <span style="font-size:50px;line-height:100px" id="ad_allsales">￦ ${dashAllMemberData}å</span>
						<span style="font-size:50px;line-height:100px" id="ad_storesales">￦ ${dashMemberData}</span>
						<span style="font-size:50px;line-height:100px" id="ad_classsales">￦ ${dashCreatorData}</span> --%>
					</div></li>
			<li><div class="ad_dash_board">
						<b>답변 대기 문의</b><br/>
						<span style="font-size:50px;line-height:120px">0 건</span>
					</div></li>							
		</ul>
		</form>
	</div>
<div id="dashAllchart_Div">	
	<canvas id="dashAllchart" style="margin:100px 0 ;"></canvas>
	<script type="text/javascript" src="resources/Chart.js"></script>
	<script type="text/javascript">

     
     var dashMemberData = "${dashMemberData}";
     var dashAllMemberData = "${dashAllMemberData}";
     var dashCreatorData = "${dashCreatorData}"
     var labelData = "${labelData}";
     var dashClassChart = "${dashClassChart}";
     var dashAllChart = "${dashAllChart}";
     var dashStoreChart = "${dashStoreChart}";

     var startMonth = "${startMonth}";
     var endMonth = "${endMonth}";
     var Allpayment = "${Allpayment}";
     var AllPaymentStore ="${AllPaymentStore}";
     var AllPaymentClass = "${AllPaymentClass}";
     
     $(function(){
 		console.log('loading');
 	    // 로딩될때
 	    if($('#startMonth').val() == '' && $('#endMonth').val() == '') {
 	    	
 			$('#startMonth').val();
 			$('#endMonth').val();
 			
 			console.log($('#startMonth').val());
 			console.log($('#endMonth').val());
 	    } else{
 	    	
 	    }
 	    $('#frm').on('submit',function(){
 	         frmSubmit();
 	         return false;
 	     });//submit
 	     
	$("#frm").click(function(){
		var url = "/adminDashBoard";
		var data = ${dashAllMemberData};
		$.ajax({
			url : url,
			data : data,
			success: function(data){
				$("#startMonth").append("${startMonth}");
				$("#endMonth").append("${endMonth}");
				
			},error:function(){
				console.log("ajax에러발생");
			}
		});
	});
 	              
  function addData(chart, label, data) {
 	 
 	    chart.data.labels.push(label);
 	    chart.data.datasets.forEach((dataset) => {
 	        dataset.data.push(data);
 	    });
 	    chart.update();
 	}
 	
  function chkPeriod(){
 		var startMonth = $('#startMonth').val();
 		var endMonth = $('#endMonth').val();
 		
 		if(startMonth >= endMonth) {
 			alert('기간을 다시 선택해주세요.');
 			return false;
 		} else {
 			return true;
 		}
 	} // chkPeriod

 	     
	
  });
	
	
	var Dash_All_context = document.getElementById('dashAllchart').getContext('2d');
	var dashAllchart = new Chart(Dash_All_context, {
	    type: 'line',
	    data: {
	        labels: ${labelData},
	        datasets: [{
	            label: '월별 매출 기록',
	            data: ${dashAllChart},
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 120, 252, 0.2)',
	                'rgba(180, 111, 220, 0.2)',
	 
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255,1)',
	                'rgba(255, 159, 64,1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
	
	</script>
</div>	
<div id="dashStorechart_Div">	
	<canvas id="dashStorechart" style="margin:100px 0 ;"></canvas>
	<script type="text/javascript" src="resources/Chart.js"></script>
	<script type="text/javascript">

     
     var dashMemberData = "${dashMemberData}";
     var dashAllMemberData = "${dashAllMemberData}";
     var dashCreatorData = "${dashCreatorData}"
     var labelData = "${labelData}";
     var dashStoreChart = "${dashStoreChart}";
     var dashClassChart = "${dashClassChart}";
     var dashAllChart = "${dashAllChart}";

     var startMonth = "${startMonth}";
     var endMonth = "${endMonth}";
     var Allpayment = "${Allpayment}";
     var AllPaymentStore ="${AllPaymentStore}";
     var AllPaymentClass = "${AllPaymentClass}";
	
	
	var Dash_Store_context = document.getElementById('dashStorechart').getContext('2d');
	var dashStorechart = new Chart(Dash_Store_context, {
	    type: 'line',
	    data: {
	        labels: ${labelData},
	        datasets: [{
	            label: '월별 매출 기록',
	            data: ${dashStoreChart},
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 120, 252, 0.2)',
	                'rgba(180, 111, 220, 0.2)',
	 
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255,1)',
	                'rgba(255, 159, 64,1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
	
	</script>
</div>
<div id="dashClasschart_Div">	
	<canvas id="dashClasschart" style="margin:100px 0 ;"></canvas>
	<script type="text/javascript" src="resources/Chart.js"></script>
	<script type="text/javascript">

     
     var dashMemberData = "${dashMemberData}";
     var dashAllMemberData = "${dashAllMemberData}";
     var dashCreatorData = "${dashCreatorData}"
     var labelData = "${labelData}";
     var dashAllChart = "${dashAllChart}";
     var dashStoreChart = "${dashStoreChart}";
     var dashClassChart = "${dashClassChart}";
     var startMonth = "${startMonth}";
     var endMonth = "${endMonth}";
     var Allpayment = "${Allpayment}";
     var AllPaymentStore ="${AllPaymentStore}";
     var AllPaymentClass = "${AllPaymentClass}";
	
	
	var Dash_Class_context = document.getElementById('dashClasschart').getContext('2d');
	var dashClasschart = new Chart(Dash_Class_context, {
	    type: 'line',
	    data: {
	        labels: ${labelData},
	        datasets: [{
	            label: '월별 매출 기록',
	            data: ${dashClassChart},
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 120, 252, 0.2)',
	                'rgba(180, 111, 220, 0.2)',
	 
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255,1)',
	                'rgba(255, 159, 64,1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
	
	</script>
</div>		
</div>