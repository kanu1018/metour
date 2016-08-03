<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Calendar</title>
<style> 
    #calendarTable, #calendarTable th, #calendarTable td{
        border-collapse: collapse;             
    } 
    #calendarTable {
        border:2px solid #000;
        width:519px;
    }
    
    #calendarTable th, #calendarTable td {
        width: 70px;
        border:1px solid #000;        
        border-collapse: collapse;
        padding: 5px;        
    }
   
    #calendarTable th {        
        background-color: #666;
        color: #ffffff;  
    }    
    #calendarTable td {        
        height: 70px;
        text-align : center;            
    }
    #calendarTable td.empty {
        background-color: #DFDCD8;
    }  
    #calendarTable td.today {
        background-color: #6C7EAA;
    }  
    #calendarTable td.reservedColor {
        background-color: #555555;
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
</script>
</head>
<body bgcolor='white'>
<div style="margin:auto;">
<table border='0' width='521' cellpadding='0' cellspacing='0'>
  <tr>
     <td width='150' align='right' valign='middle'>
         <a href="${pageContext.request.contextPath }/schedule.do?year=${Year}&month=${Month}&action=0">
             <font size="2">이전달</font>
         </a>
     </td>
     <td width='260' align='center' valign='middle'> 
			     
         <b>${Year}년 ${Month+1}월</b>
     </td>
     <td width='173' align='left' valign='middle'>
         <a href="${pageContext.request.contextPath }/schedule.do?year=${Year}&month=${Month}&action=1">
             <font size="2">다음달</font>
         </a>
    </td>
  </tr>
</table>

<table id="calendarTable">
	<tr>
              <th>일</th>
              <th>월</th>
              <th>화</th>
              <th>수</th>
              <th>목</th>
              <th>금</th>
              <th>토</th>                      
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
							<td class="reservedColor">${d.day}</td>
						</c:when>
						<c:when test="${d.flag eq 3}">
							<td class="reservedColor">${d.day}</td>
						</c:when>
						<c:when test="${d.flag eq 2}">
							<td class="today">${d.day}</td>
						</c:when>
						<c:when test="${d.flag eq 1}">
							<td>${d.day}</td>
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
</div>

<table>
	<tr>
		<td><select id="year" name="year"></select></td>
		<td><select id="month" name="month"></select></td>
	</tr>
</table>

<c:forEach items="${schedules}" var="s">
	${s.main_title} ${s.main_writer} ${s.year} ${s.month} ${s.day}<br>
</c:forEach>
 
  
</body>
</html>