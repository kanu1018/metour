<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Calendar</title>
<style> 
    #calendarTable {
        width:630px;
    }
    
    #calendarTable th, #calendarTable td {
        width: 90px; 
    }
   
    #calendarTable th {        
        background-color: #282832;
        color: #ffffff;  
    }    
    #calendarTable td {        
        height: 90px;         
    }
    #calendarTable td.empty {
        background-color: #DFDCD8;
    } 
    
    
    #calendarTable button{
    	width: 90px;
    	height: 100%; 
    	border:0px;
    	font-weight: bold;
    	cursor:pointer;
  
    }
    
    #calendarTable button.metoDay{ 
    	background-color: #33308C;
    	color: #ffffff;
    	font-size: 20px;
    } 
    
    
    #calendarTable button.Reserved{ 
    	background-color: #1ABC9C;
    	color: #ffffff;
    	font-size: 20px;
    } 
   	#calendarTable button.Today{
    	background-color: #f24c27; 
    	color: #ffffff;
    	font-size: 20px;
    } 
    #calendarTable button.NotR{
    	background-color: #fffff9;
    	color:#282832;
    	font-size: 20px
    } 
    
    a:link {text-decoration: none; color: #333333;}
	a:visited {text-decoration: none; color: #333333;}
	a:active {text-decoration: none; color: #333333;}
	a:hover {text-decoration: underline; color: #333333;}
	
	#tab1 {
		width: 930px;
	}
	
	#tab1 td{
		width: 90px;
		height: 90px;
		text-align: center;
	}
	
	#tab1 button{
    	width: 90px;
    	height: 100%; 
    	border:0px;
    	font-weight: bold;
    	cursor:pointer;
  
    }
    
    #tab1 button.metoDay{ 
    	background-color: #E2F2F8;
    	color: #44514F;
    	font-size: 15px;
    	font-style: normal;
    	text-align: center;
    } 
    
    
    #tab1 button.Reserved{ 
    	background-color: #E2F2F8;
    	color: #44514F;
    	font-size: 15px;
    	font-style: normal;
    	text-align: center;
    } 
   	#tab1 button.Today{
    	background-color: #F1826F; 
    	color: #ffffff;
    	font-size: 15px;
    	font-style: normal;
    	text-align: center;
    } 
    #tab1 button.NotR{
    	background-color: #ffffff;
    	color:#44514F;
    	font-size: 15px;
    	font-style: normal;
    	text-align: center;
    } 
    
    img {
    	width: 50px;
    	height: 50px;
    }

</style>

<script type="text/javascript">
	
	
	function datePlan(year, month, day){
		var url = "${pageContext.request.contextPath}/schedule/datePlan.do?year="+year
				+"&month="+month+"&day="+day;
		//location.href = url;
		window.open(url, "idcheck", "top=200, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes, width=420, height=500" );
	
	}
	
	function goMonth(year, month){
		var url = "${pageContext.request.contextPath}/schedule/selectMonth.do?year="+year
				+"&month="+month;
		//location.href = url;
		window.open(url, "idcheck", "top=200, left=500, toolbar=no, menubar=no, scrollbars=yes, resizable=yes, width=258, height=15" );
	
	}
	
	
	function listPlan(action){
		var url = "${pageContext.request.contextPath}/schedule/listPlan.do?action="+action;
		//location.href = url;
		window.open(url, "idcheck", "top=200, left=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes, width=410, height=500" );

	}
	
	function goHome(){
		var url = "${pageContext.request.contextPath}/share/list.do";
		location.href = url;
	}
	
	
	function a(){
		document.f.submit();
	}
	
</script>
</head>
<body bgcolor='white' style="font-family: 맑은 고딕;">
<div style="margin-top: 30px">
<%-- <table width='652px' style="margin: auto; background-color: #282832;">
  <tr>
     <td width='195' align='right' valign="middle">
         <a style="text-decoration: none; color: #ffffff;" href="${pageContext.request.contextPath }/schedule/schedule.do?year=${Year}&month=${Month}&action=0">
             <font size="2">이전달</font>
         </a>
     </td>
     <td width='30' align='right' valign="middle">
         <a style="text-decoration: none; color: #ffffff;" href="${pageContext.request.contextPath }/schedule/schedule.do?year=${Year}&month=${Month}&action=0">
             <img style="height: 30px;" src="${pageContext.request.contextPath}/resources/img/left.png">
         </a>
     </td>
     <td width='202' align='center' valign='middle' style="color: #ffffff; font-size: 30px">
     	<button style="width: 100%; background-color: #282832; border:0px; color: #ffffff; cursor:pointer; font-size: 30px;" onclick="goMonth(${Year}, ${Month+1})">${Year}년 ${Month+1}월</button>
     </td>
     <td width='30' align='left' valign="middle">
         <a style="text-decoration: none; color: #ffffff;" href="${pageContext.request.contextPath }/schedule/schedule.do?year=${Year}&month=${Month}&action=1">
             <img style="height: 30px;" src="${pageContext.request.contextPath}/resources/img/right.png">
         </a>
     </td>
     <td width='195' align='left' valign="middle">
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
              <th style="color: #5070E0;">토</th>                      
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
							<td><button class="metoDay" onclick="datePlan(${Year},${Month+1},${d.day})">${d.day}<br><font size="2px">MeToday</button></td>
						</c:when>
						<c:when test="${d.flag eq 3}">
							<td><button class="Reserved" onclick="datePlan(${Year},${Month+1},${d.day})">${d.day}<br><font size="2px">MeTo</button></td>
						</c:when>
						<c:when test="${d.flag eq 2}">
							<td><button class="Today" onclick="datePlan(${Year},${Month+1},${d.day})">${d.day}<br><font size="2px">Today</font></button></td>
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
	<tr>
	<th colspan="2" valign='middle' style="background-color: #33308C; height: 30px">
         <button style="background-color: #33308C;color: #ffffff;" onclick="goHome()">홈으로</button>
     </th>
	 <th style="background-color: #ffffff;" colspan="3" ></th>
     <th valign='middle' style="background-color: #33308C;">
         <button style="background-color: #33308C;color: #ffffff;" onclick="listPlan(1)">공유하기</button>
     </th>
     <th valign='middle'  style="background-color: #33308C;">
		<button style="background-color: #33308C;color: #ffffff;"  onclick="listPlan(0)">삭제하기</button>
    </th>
  </tr>
</table> --%>
</div>
<div align="center" style="margin-top: 30px;">
	<table id="tab1">
		<tr>
			<td rowspan="10" style="width: 300px; background-color: #F1826F;">
				<button style="width: 100%; background-color: #F1826F; border:0px; cursor:pointer; text-align: left; text-indent: 15px;" onclick="goMonth(${Year}, ${Month+1})">
					<font style="font-size: 25px; color: #fbbbb0;">${Year},</font><br><br>
					<font style="font-size: 30px; color: #ffffff;">&nbsp;
						<c:if test="${Month+1 eq 1}">Jan</c:if>
						<c:if test="${Month+1 eq 2}">Feb</c:if>
						<c:if test="${Month+1 eq 3}">Mar</c:if>
						<c:if test="${Month+1 eq 4}">Apr</c:if>
						<c:if test="${Month+1 eq 5}">May</c:if>
						<c:if test="${Month+1 eq 6}">Jun</c:if>
						<c:if test="${Month+1 eq 7}">Jul</c:if>
						<c:if test="${Month+1 eq 8}">Aug</c:if>
						<c:if test="${Month+1 eq 9}">Sep</c:if>
						<c:if test="${Month+1 eq 10}">Oct</c:if>
						<c:if test="${Month+1 eq 11}">Nov</c:if>
						<c:if test="${Month+1 eq 12}">Dec</c:if>
					</font>
					<font style="font-size: 30px; color: #ffffff; text-indent: 10px;">${dDay}</font>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				</button>	
			</td>
		</tr>
		<tr>
			<td>
				<a href="${pageContext.request.contextPath }/schedule/schedule.do?year=${Year}&month=${Month}&action=0">
		             <img style="height: 30px;" src="${pageContext.request.contextPath}/resources/img/left02.png">
		         </a>
			</td>
			<td colspan="5">
				<button style="width: 100%; background-color: #ffffff; border:0px; color: #44514F; cursor:pointer; font-size: 15px; font-style: normal;" onclick="goMonth(${Year}, ${Month+1})">
					<font>
						<c:if test="${Month+1 eq 1}">January</c:if>
						<c:if test="${Month+1 eq 2}">February </c:if>
						<c:if test="${Month+1 eq 3}">March</c:if>
						<c:if test="${Month+1 eq 4}">April</c:if>
						<c:if test="${Month+1 eq 5}">May</c:if>
						<c:if test="${Month+1 eq 6}">Jun</c:if>
						<c:if test="${Month+1 eq 7}">July</c:if>
						<c:if test="${Month+1 eq 8}">August</c:if>
						<c:if test="${Month+1 eq 9}">September</c:if>
						<c:if test="${Month+1 eq 10}">Octobar</c:if>
						<c:if test="${Month+1 eq 11}">November</c:if>
						<c:if test="${Month+1 eq 12}">December</c:if>
					</font>
					<font>${Year}</font>
				</button>
			</td>
			<td>
				<a href="${pageContext.request.contextPath }/schedule/schedule.do?year=${Year}&month=${Month}&action=1">
		            <img style="height: 30px;" src="${pageContext.request.contextPath}/resources/img/right02.png">
		        </a>
			</td>
		</tr>
		<tr>
			<td style="color: red; height: 15px">SUN</td>
            <td>MON</td>
            <td>TUE</td>
            <td>WED</td>
            <td>THU</td>
            <td>FRI</td>
            <td style="color: #5070E0;">SAT</td>
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
							<td><button class="metoDay" onclick="datePlan(${Year},${Month+1},${d.day})">${d.day}<br><font size="2px">MeToday</button></td>
						</c:when>
						<c:when test="${d.flag eq 3}">
							<td><button class="Reserved" onclick="datePlan(${Year},${Month+1},${d.day})">${d.day}<br><font size="2px">MeTo</button></td>
						</c:when>
						<c:when test="${d.flag eq 2}">
							<td><button class="Today" onclick="datePlan(${Year},${Month+1},${d.day})">${d.day}<br><font size="2px">Today</font></button></td>
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
		<tr>
			<td colspan="6" style="text-align: right;">
				<img src="${pageContext.request.contextPath}/resources/img/share02.png" onclick="listPlan(1)">
				<!--  <button style="background-color: #33308C;color: #ffffff;" onclick="listPlan(1)">공유하기</button> -->
			</td>
			<td>
				<img src="${pageContext.request.contextPath}/resources/img/delete02.png" onclick="listPlan(0)">
				<!-- <button style="background-color: #33308C;color: #ffffff;"  onclick="listPlan(0)">삭제하기</button> -->
			</td>
		</tr>
	</table>
</div>
</body>
</html>