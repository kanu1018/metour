<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function(){
		var start_y = 2012;
		var now_y = ${Year}
		var end_y = 2025;
		var start_m =1;
		var now_m = ${Month}
		var end_m = 12;
		
		var strYear ="";
		var strMonth ="";
		for (var i=start_y; i<=end_y;i++){
			if(i==now_y){
				strYear += "<option selected='selected' value"+i+">"+i+"</option>"
			}else{
				strYear += "<option value"+i+">"+i+"</option>"
			}
			
		}
		for (var i=start_m; i<=end_m;i++){
			if(i==now_m){
				strMonth += "<option selected='selected' value"+i+">"+i+" </option>"
			}else{
				strMonth += "<option value"+i+">"+i+"</option>"
			}
		}
		document.getElementById("year").innerHTML = strYear;
		document.getElementById("month").innerHTML = strMonth;
	}
	
	function a(){
		var year = document.getElementById("year").value;
		var month = document.getElementById("month").value;
		var url = "${pageContext.request.contextPath }/schedule/schedule.do?year="+year+"&month="+month+"&action=0";
		window.opener.location.href = url;	
		window.close();
	}
	
	$(document).ready(function(){
		var select = $('.year select');
		select.change(function(){
			var select_name = $(this).children('option:selected').text();
			$(this).siblings("label").text(select_name);
		})
	});
	
/* 	$(document).ready(function(){
		var select = $('.month select');
		select.change(function(){
			var select_name = $(this).children('option:selected').text();
			$(this).siblings("label").text(select_name);
		})
	}); */
</script>
<style type="text/css">
	*,body{
		 font-family: "맑은 고딕";
	}
	
	table, tr, td{
		/* border: 1px;
		border-style: solid;
		border-collapse: collapse; */
		text-align: center;
	}
	
	table {
		border: 0;
		width: 250px;
		margin-top: 20px;
	}
	
	td {
		height: 40px;
	}
	
	/* select {
		background-color: #ffffff;
		border: 1px;
		border-color: #F1826F;
		width: 80%;
		height: 80%;
		color: #44514F;
		font-size: 20px;
		text-align: center;
		/* opacity: 0;
		filter:alpha(opacity=0);
		-ms-filter:alpha(opacity=0); */
	} */
	
	/*  IE 10, 11의 네이티브 화살표 숨기기 */
	/* select::-ms-expand { 
	  display: none;
	} */ 
	
	Button {
		background-color: #F1826F;
		color: #ffffff;
		font-size: 20px;
		cursor: pointer;
		border: 0px;
		text-align: center;
		width: 50%;
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
	}
	
	.year{
		position: relative;
		width: 125px;
		height: 40px;
		line-height: 40px;
		border: 1px solid #F1826F;
		border-radius: 4px;
		background: #ffffff;
	}
	
	.year label{
		position: absolute;
		width: 90%;
		font-size: 15px;
		color: #44514F;
		top:0;
		left: 0;
		padding: 0 5%;
	}
	
	.year label:after{
		content: '▼';
		width: 40px;
		height: 40px;
		position: absolute;
		top: 0;
		right: 0;
		font-size: 20px;
		color: #ffffff;
		text-align: center;
		background: #F1826F;
	}
	
	.year select{
		width: 80%;
		height: 30px;
		opacity: 0;
		filter:alpha(opacity=0);
		-ms-filter:alpha(opacity=0);
		font-size: 15px;
	}
	.month{
		position: relative;
		width: 125px;
		height: 40px;
		line-height: 40px;
		border: 1px solid #F1826F;
		border-radius: 4px;
		background: #ffffff;
	}
	
	.month label{
		position: absolute;
		width: 90%;
		font-size: 15px;
		color: #44514F;
		top:0;
		left: 0;
		padding: 0 5%;
	}
	
	.month label:after{
		content: '▼';
		width: 40px;
		height: 40px;
		position: absolute;
		top: 0;
		right: 0;
		font-size: 20px;
		color: #ffffff;
		text-align: center;
		background: #F1826F;
	}
	
	.month select{
		width: 80%;
		height: 30px;
		opacity: 0;
		filter:alpha(opacity=0);
		-ms-filter:alpha(opacity=0);
		font-size: 15px;
	}
</style>
</head>
<body>
<form name="f">
<table align="center">
<!-- 	<tr>
		<td colspan="3" style="height: 80px;">날짜를 선택하세요.</td>
	</tr> -->
	<tr>
		<td align="center" style="height: 30px; ">
			<div class="year">
				<label for="year">년도</label>
				<select id="year" name="year"/>
			</div>
			<!-- <select id="year" name="year"/> -->
		</td>
		<td  align="center">
			<div class="month">
				<label for="month">월</label>
				<select id="month" name="month"/>
			</div>
			<!-- <select id="month" name="month"/> -->
		</td>	
	</tr>
	<tr>
		<td colspan="3">
			<!-- <input type="button" value="이동" onclick="a()"> -->
			<button onclick="a()" style="height:30px; background-color: #E2F2F8;	color: #44514F;	font-size: 15px;cursor: pointer;border: 0px;text-align: center;	width: 50%;	border-top-left-radius: 5px;border-top-right-radius: 5px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">이동</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>