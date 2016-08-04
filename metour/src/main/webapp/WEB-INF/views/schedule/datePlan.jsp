<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style> 
    #mainPlanTable {
    	border-collapse: collapse;
        border:2px solid #000;
        width:330px;
    }
     
    #mainPlanTable td { 
        border:1px solid #000;        
        border-collapse: collapse;               
    }
     
</style>
<script>
function deletePlan(main_num){
	var url = "${pageContext.request.contextPath}/schedule/deletePlan.do?main_num="+main_num;
	//location.href = url;
	window.opener.location.href = url;
	window.close();
}

function moveURL1(URL){
	var url = "${pageContext.request.contextPath}"+URL;
	location.href = url;
}
function moveURL2(URL){
	var url = "${pageContext.request.contextPath}"+URL;
	window.opener.location.href = url;
	window.close();
}		

</script>
</head>
<body>

<table border='0' width='330' cellpadding='0' cellspacing='0'>
  <tr>
     <td width='90' align='center' valign='middle'>
         <a href="${pageContext.request.contextPath}/schedule/datePlan.do?year=${L_Year}&month=${L_Month}&day=${L_Day}">
             <font size="2">${L_Month}월 ${L_Day}일</font>
         </a>
     </td>
     <td width='130' align='center' valign='middle'> 
			     
         <b>${Year}년 ${Month}월 ${Day}일</b>
     </td>
     <td width='90'align='center' valign='middle'>
         <a href="${pageContext.request.contextPath}/schedule/datePlan.do?year=${N_Year}&month=${N_Month}&day=${N_Day}">
             <font size="2">${N_Month}월 ${N_Day}일</font>
         </a>
    </td>
  </tr>
</table>
<c:if test="${schedule ne null}">
	<table id ="mainPlanTable">
		<tr>
			<td colspan="3" align="center">
				${schedule.main_title}
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				포인트 : ${schedule.point_num}
			</td>
		</tr>
		<c:forEach items="${subPlans}" var="sp">
			<tr>
				<td colspan="3" align="center">${sp.sub_title}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">${sp.start_time}~${sp.end_time}</td>
				<td align="center">${sp.mission_yn}</td>
			</tr>
		
		</c:forEach>
		</table>
	<table border='0' width='330' cellpadding='0' cellspacing='0'>
		<tr style="height: 30px">
			<td align="center">
				<button style="width: 100%;height: 100%" onclick="moveURL1('/subplan/add.do?main_num='+${schedule.main_num})">상세계획추가</button>
			</td>
			<td align="center">
				<button style="width: 100%;height: 100%" onclick="moveURL2('/subplan/list.do?main_num='+${schedule.main_num})">상세계획보기</button>
			</td>
		</tr>
		<tr style="height: 30px">
			<td align="center">
				<button style="width: 100%;height: 100%" onclick="deletePlan(${schedule.main_num})">계획삭제하기</button>
			</td>
			<td align="center">
				<button style="width: 100%;height: 100%">계획공유하기</button>
			</td>
		</tr>
	</table>
</c:if>
<c:if test="${schedule eq null}">
<div align ="center">
	<table style="width:330px">
		<tr style="height: 30px">
			<td align="center">
				<button style="width: 100%;height: 100%" onclick="insertPlan(${Year},${Month},${Day})">계획하기</button>
			</td>
		</tr>
	</table>
</div>
	
</c:if>


</body>
</html>