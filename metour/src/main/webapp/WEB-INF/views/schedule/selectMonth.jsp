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
</script>



</head>
<body>
<form name="f">
<table style="background-color: #282832" width='250px'>
	<th align="right" style="height: 30px"><select id="year" name="year" style="border:0px; width: 100%;height: 100%; background-color: #282832; color: #ffffff; font-size: 20px"></select></th>
	<th  align="right"><select id="month" name="month"  style="border:0px; width:100%;height: 100%; background-color: #282832; color: #ffffff; font-size: 20px"></select></th>
	<th><button style="background-color: #282832; color: #ffffff; color: #ffffff; font-size: 20px; cursor: pointer;border: 0px" onclick="a()">이동</button></th>
</table>
</form>
</body>
</html>