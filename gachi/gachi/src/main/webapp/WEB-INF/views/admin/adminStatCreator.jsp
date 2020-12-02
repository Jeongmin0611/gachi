<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="resources/Chart.js"></script>
<style>
	.ad_StatClass_Piechart {float:left;width:33%; margin:50px 0px; font-size:1.5em;}
	canvas {width:100%; margin-bottom:20px;}
</style>

<div class="container Cr_StatClass_center text-center ad_font">
   <h1 style="text-align:center;"> 크리에이터 통계 </h1><br/>
      
		<form action="adminStatCreator" method="post">
         <input type="month" id="startMonth" name="startMonth" value="${startMonth }" onchange="return chkPeriod();"/>
         -
         <input type="month" id="endMonth" name="endMonth" value="${endMonth }" onchange="return chkPeriod();"/>
         <input type ="submit" class="btn btn-outline-dark btn-sm" id="frm" value="조회"/>
        </form> 
      <div>
         <canvas id="ad_Cr_StatClass_chart" style="margin-top:50px"></canvas>
         <script type="text/javascript">
         
         var dashData = "${dashData}";
         var labelData = "${labelData}";
         var genderLabel = "${genderLabel}";
         var genderData = "${genderData}";
         var ageLabel = "${ageLabel}";
         var ageData = "${ageData}";
         var categoryData = "${categoryData}"
         var categortLabel = "${categoryLabel}"
         
         var startMonth = "${startMonth}";
         var endMonth = "${endMonth}";
         
         
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
			var url = "/adminStatCreator";
			var data = ${dashData};
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
         
         var ad_Cr_StatClass_context = document.getElementById('ad_Cr_StatClass_chart').getContext('2d');
         var ad_Cr_StatClass_chart = new Chart(ad_Cr_StatClass_context, {
             type: 'line',
             data: {
                 labels: ${labelData},
                 datasets: [{
                     label: '가입 크리에이터 수',
                     data: ${dashData},
                     backgroundColor: [
                         'rgba(255, 99, 132, 0.2)',
                         'rgba(54, 162, 235, 0.2)',
                         'rgba(255, 206, 86, 0.2)',
                         'rgba(75, 192, 192, 0.2)',
                         'rgba(153, 120, 252, 0.2)',
                         'rgba(180, 111, 220, 0.2)', 
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
                         'rgba(153, 102, 255, 1)',
                         'rgba(255, 159, 64, 1)',
                         'rgba(255, 99, 132, 1)',
                         'rgba(54, 162, 235, 1)',
                         'rgba(255, 206, 86, 1)',
                         'rgba(75, 192, 192, 1)',
                         'rgba(153, 102, 255, 1)',
                         'rgba(255, 159, 64, 1)'
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
   <div class="ad_StatClass_Piechart cfont" >
      <canvas id="ad_Cr_StatClass_gender_chart"></canvas>
      <script type="text/javascript">
      var ad_Cr_StatClass_gender_context = document.getElementById('ad_Cr_StatClass_gender_chart').getContext('2d');
      var ad_Cr_StatClass_gender_chart = new Chart(ad_Cr_StatClass_gender_context, {
          type: 'pie',
          data: {
         labels : ${genderLabel},
         datasets : [{
         backgroundColor : ["#2ecc71","#3498dd"],
         hoverBackgroundColor : ["#a6a6a6","#d1b2ff"],
         data : ${genderData}
            }]
         },
         options : {
            responsive: false
            }
         });
      
      </script>
      성별
   </div>
   <div class="ad_StatClass_Piechart cfont" >
      <canvas id="ad_Cr_StatClass_age_chart"></canvas>
      <script type="text/javascript">
      var ad_Cr_StatClass_age_context = document.getElementById('ad_Cr_StatClass_age_chart').getContext('2d');
      var ad_Cr_StatClass_age_chart = new Chart(ad_Cr_StatClass_age_context, {
          type: 'pie',
          data: {
         labels : ${ageLabel},
         datasets : [{
         backgroundColor : ["#2ecc71","#3498dd","pink","yellow","green","orange"],
         hoverBackgroundColor : ["#a6a6a6","#d1b2ff","pink","yellow","green","orange"],
         data : ${ageData}
            }]
         },
         options : {
            responsive: false
            }
         });
      
      </script>
      연령별
      </div>
		<div class="ad_StatClass_Piechart cfont" >
			<canvas id="ad_cr_StatClass_star_chart"></canvas>
			<script type="text/javascript">
			var ad_cr_StatClass_star_context = document.getElementById('ad_cr_StatClass_star_chart').getContext('2d');
			var ad_cr_StatClass_star_chart = new Chart(ad_cr_StatClass_star_context, {
			    type: 'pie',
			    data: {
				labels : ${categoryLabel},
				datasets : [{
				backgroundColor : ["#2ecc71","#3498dd","pink","yellow","orange","pink","lightblue"],
				hoverBackgroundColor : ["#a6a6a6","#d1b2ff","pink","yellow","orange","black","lightblue"],
				data : ${categoryData}
					}]
				},
				options : {
					responsive: false
					}
					});	
			</script>
			카테고리
		</div>
</div>



	