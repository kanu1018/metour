<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Calendar</title>
<style> 

    #calendarTable {
        width:519px;
    }
    
    #calendarTable th, #calendarTable td {
        width: 76px; 
    }
   
    #calendarTable th {        
        background-color: #282832;
        color: #ffffff;  
    }    
    #calendarTable td {        
        height: 65px;         
    }
    #calendarTable td.empty {
        background-color: #DFDCD8;
    } 
    
    
    #calendarTable button{
    	width: 100%;
    	height: 100%; 
    	border:0px;
    	font-weight: bold;
    	font-size: 20px
    }
    
    #calendarTable button.Reserved{ 
    	background-color: #1DABB9;
    	color: #ffffff
    } 
   	#calendarTable button.Today{
    	background-color: #f24c27; 
    	color: #ffffff
    } 
    #calendarTable button.NotR{
    	background-color: #fffff3;
    	color:#282832 
    } 

</style>

<script type="text/javascript">
	window.onload = function(){
		var start_y = 2015;
		var now_y = "<c:out value='${Year}'/>"
		var end_y = 2020;
		var start_m =1;
		var now_m = "<c:out value='${Month+1}'/>"
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
				strMonth += "<option selected='selected' value"+i+">"+i+"</option>"
			}else{
				strMonth += "<option value"+i+">"+i+"</option>"
			}
		}
		document.getElementById("year").innerHTML = strYear;
		document.getElementById("month").innerHTML = strMonth;
	}
	
	function datePlan(year, month, day){
		var url = "${pageContext.request.contextPath}/schedule/datePlan.do?year="+year
				+"&month="+month+"&day="+day;
		//location.href = url;
		window.open(url, "idcheck", "top=200, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes, width=340, height=500" );
	
	}
	
	
	function listPlan(action){
		var url = "${pageContext.request.contextPath}/schedule/listPlan.do?action="+action;
		//location.href = url;
		window.open(url, "idcheck", "top=200, left=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes, width=410, height=500" );

	}
	
</script>
</head>
<body bgcolor='white'>
<div>
<table width='519px' style="margin: auto; background-color: #282832;">
  <tr>
     <td width='160' align='right' valign='middle'>
         <a style="text-decoration: none; color: #ffffff;" href="${pageContext.request.contextPath }/schedule/schedule.do?year=${Year}&month=${Month}&action=0">
             <font size="2">이전달</font>
         </a>
     </td>
     <td width='199' align='center' valign='middle' style="color: #ffffff; font-size: 30px"> 
         <b>${Year}년 ${Month+1}월</b>
     </td>
     <td width='160' align='left' valign='middle'>
         <a style="text-decoration: none; color: #ffffff;" href="${pageContext.request.contextPath }/schedule/schedule.do?year=${Year}&month=${Month}&action=1">
             <font size="2">다음달</font>
         </a>
    </td>
  </tr>
</table>

<table id="calendarTable" style="margin: auto;">
		<tr>
              <th style="color: red; height: 30px">일</th>
              <th>월</th>
              <th>화</th>
              <th>수</th>
              <th>목</th>
              <th>금</th>
              <th style="color: blue;">토</th>                      
       </tr>
	<c:forEach items="${DayFlag}" var="d">
			<c:if test="${((d.index+1) mod 7) eq 1 }">
				<tr>
			</c:if>
				<c:if test="${DOW gt d.week_num}">
					<td class="empty">&nbsp;</td>
				</c:if>	
				<c:if test="${DOW le d.week_num}">
					<c:choose>
						<c:when test="${d.flag eq 4}">
							<td>${d.day}</td>
						</c:when>
						<c:when test="${d.flag eq 3}">
							<td><button class="Reserved" onclick="datePlan(${Year},${Month+1},${d.day})">${d.day}</button></td>
						</c:when>
						<c:when test="${d.flag eq 2}">
							<td><button class="Today" onclick="datePlan(${Year},${Month+1},${d.day})">${d.day}</button></td>
						</c:when>
						<c:when test="${d.flag eq 1}">
							<td><button class="NotR" onclick="datePlan(${Year},${Month+1},${d.day})">${d.day}</button></td>
						</c:when>
						<c:when test="${d.flag eq 0}">
							<td class="empty">&nbsp;</td>
						</c:when>
					</c:choose>

				</c:if>
			<c:if test="${((d.index+1) mod 7) eq 0 }">
				</tr>
			</c:if>
	</c:forEach>
</table>
<table width='520' style="margin: auto;">
  <tr>
     <td width='260' align='right' valign='middle'>
         <button style="width: 76px; height: 30px; background-color: #282832; color: #ffffff; border: 0px" onclick="listPlan(1)">공유하기</button>
     </td>
     <td width='260' align='left' valign='middle'>
		<button style="width: 76px; height: 30px; background-color: #282832; color: #ffffff; border: 0px"  onclick="listPlan(0)">삭제하기</button>
    </td>
  </tr>
</table>
</div>

<form action="${pageContext.request.contextPath }/schedule/schedule.do?action=0">
	<table>
		<tr>
			<td><select id="year" name="year"></select></td>
			<td><select id="month" name="month"></select></td>
			<td><input type="submit" value="이동"></td>
		</tr>
	</table>
</form>


<c:forEach items="${schedules}" var="s">
	${s.main_title} ${s.main_writer} ${s.year} ${s.month} ${s.day}<br>
</c:forEach>
 
  
</body>
</html>