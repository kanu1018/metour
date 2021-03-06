<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::세부계획::</title>
<style> 
	*,body{
	 font-family: "맑은 고딕";
	}
	
	#tabTop{
		background-color: #374560;
		width: 400px;
		height: 80px;
		margin: 10px;
		text-align: center;	
	}
	
	
	
    #mainPlanTable {
    	border-collapse: collapse;
        border:2px solid #000;
        width:360px;
    }
     
    #mainPlanTable td { 
        border:1px solid #000;        
        border-collapse: collapse;  
        height: 30px;            
    }
    
   button{
		height: 35px;
		border: solid 2px;
		border-radius:7px;
		background-color:#1ABC9C;
		text-align:center;
		color: #FFFFFF;
	}
     
</style>
<script>
function deletePlan(main_num){
	if(confirm("전체 계획을 삭제하시겠습니까?")==true){
		var url = "${pageContext.request.contextPath}/schedule/deletePlan.do?main_num="+main_num;
		//location.href = url;
		window.opener.location.href = url;
		window.close();
	}else{
		return;
	}
}
function sharePlan(main_num){
	if(confirm("현재 날짜 계획을 공유하시겠습니까?")==true){
		var url = "${pageContext.request.contextPath}/subplan/combination.do?main_num="+main_num;
		//location.href = url;
		window.opener.location.href = url;
		window.close();
	}else{
		return;
	}
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
function insertPlan(year,month,day){
	var title = document.getElementById("title").value;
	var day = year + "/" + month + "/" + day;
	var url = "${pageContext.request.contextPath}/schedule/insertPlan.do?title="+title+"&day="+day;
	//location.href = url;
	window.opener.location.href = url;
	window.close();
}

function addPlan(year,month,day,action){
	var url = "${pageContext.request.contextPath}/schedule/datePlan.do?year="+year
			+"&month="+month+"&day="+day+"&action="+action;
	location.href = url;
}
</script>
</head>
<body>

<table id="tabTop" width='400px' style="margin: auto; background-color: #282832;">
  <tr>
     <td width='65' height="35px" align="right" valign="middle">
        <a style="text-decoration:none; color: #ffffff;" href="${pageContext.request.contextPath}/schedule/datePlan.do?year=${L_Year}&month=${L_Month}&day=${L_Day}">
             <font size="2">${L_Month}/${L_Day}</font>
         </a>
     </td>
     <td width='20' align='center' valign="middle">
         <a style="text-decoration: none; color: #ffffff;" href="${pageContext.request.contextPath}/schedule/datePlan.do?year=${L_Year}&month=${L_Month}&day=${L_Day}">
             <img style="height: 15px;" src="${pageContext.request.contextPath}/resources/img/left.png">
         </a>
     </td>
    
     <td width='200' align='center' valign='middle' style="color: #ffffff; font-size: 23px">
     	<b>${Year}. ${Month}. ${Day}</b>
     </td>
     <td width='20' align='center' valign="middle">
         <a style="text-decoration: none; color: #ffffff;" href="${pageContext.request.contextPath}/schedule/datePlan.do?year=${N_Year}&month=${N_Month}&day=${N_Day}">
             <img style="height: 15px;" src="${pageContext.request.contextPath}/resources/img/right.png">
         </a>
     </td>
     <td width='65' align='left' valign="middle">
         <a style="text-decoration:none;  color: #ffffff;" href="${pageContext.request.contextPath}/schedule/datePlan.do?year=${N_Year}&month=${N_Month}&day=${N_Day}">
             <font size="2">${N_Month}/${N_Day}</font>
         </a>
    </td>
  </tr>
</table>

<c:if test="${schedule ne null}">
	<div style="padding-top: 15px" align="center">
	<table id ="mainPlanTable">
		<tr>
			<td colspan="3" align="center">
				[ ${schedule.main_title} ]
			</td>
		</tr>
	
		<c:forEach items="${subPlans}" var="sp">
			<tr>
				<td colspan="3">&nbsp; - ${sp.sub_title}</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;&nbsp;${sp.start_time} ~ ${sp.end_time}</td>
				<td align="center"><c:if test="${sp.mission_yn == '0'}">×</c:if><c:if test="${sp.mission_yn == '1'}">사진 ○ & GPS ×</c:if>
						<c:if test="${sp.mission_yn == '2'}">○</c:if><c:if test="${sp.mission_yn == '3'}">○</c:if></td>
				
			</tr>
		
		</c:forEach>
		</table>
	<table border='0' width='330' cellpadding='0' cellspacing='0' style="padding-top: 20px;">
		<tr style="height: 30px">
			<%-- <td align="center">
				<button style="width: 100%;height: 100%" onclick="moveURL1('/subplan/add.do?main_num='+${schedule.main_num})">상세계획추가</button>
			</td> --%>
			<td align="center" colspan="2">
				<button style="width: 100%;" onclick="moveURL2('/subplan/list.do?main_num='+${schedule.main_num})">상세계획보기</button>
			</td>
		</tr>
		<tr style="height: 30px">
			<td align="center">
				<button style="width: 100%;" onclick="deletePlan(${schedule.main_num})">계획삭제하기</button>
			</td>
			<c:if test="${not empty subPlans}">
			<td align="center">
				<button style="width: 100%;" onclick="sharePlan(${schedule.main_num})">계획공유하기</button>
			</td>
			</c:if>
		</tr>
	</table>
	</div>
	
</c:if>



<c:if test="${schedule eq null}">
<c:if test="${action eq null}">
<div align ="center">
	<img src="${pageContext.request.contextPath}/resources/img/addb.png" style="width: 50px; padding-top: 50px; cursor: pointer" onclick="addPlan(${Year},${Month},${Day},1)" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/adda.png'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/addb.png'">
</div>
</c:if>

<c:if test="${action eq 1}">
<div align ="center" style="padding-top: 10px">
	
	<table style="width:400px; margin-top: 30px;">
		<tr style="height: 30px">
		<td align="center">
				<input type="text" placeholder="제목을 입력하세요." style="width: 97%;height: 30px;" id="title"/>
			</td>
		</tr>
		<tr style="height: 30px;">
			<td align="center">
				<button style="width: 100%; height: 40px;" onclick="insertPlan(${Year},${Month},${Day})">계획하기</button>
			</td>
		</tr>
	</table>
</div>
</c:if>

	

	
</c:if>


</body>
</html>