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
        width:380px;
    }
     
    #mainPlanTable td { 
        border:1px solid #000;        
        border-collapse: collapse;               
    }

    
    #mainPlanTable td.checked { 
    	background-color: #037E8C;
    	color: #ffffff;         
    }
     
</style>
</head>
<body>
<c:if test="${action eq 0}">
	<div style="width:100%;height:60px; background-color: #33308C;color:#ffffff; padding-top:30px; font-size: 20pt;" align="center">
	삭제하기
	</div>
</c:if>
<c:if test="${action eq 1}">
	<div style="width:100%;height:60px; background-color: #037E8C;color:#ffffff; padding-top:30px; font-size: 20pt;" align="center">
	공유하기
	</div>
</c:if>

<div style="margin-top: 5px">

<c:forEach items="${schedules}" var="s" varStatus="status">
	<c:if test="${status.first eq false}">
		<br>
	</c:if>
	<table id="mainPlanTable">
		<tr>
			<td rowspan="2" style="height: 60px; width: 45px;">ch</td>
			<td colspan="2" style="height: 30px; width: 310px;">${s.main_title}</td>
			<td rowspan="2" style="height: 60px; width: 25px;">상세</td>
		</tr>
		<tr>
			<td style="height: 30px; width: 200px;">${s.year}년 ${s.month}월 ${s.day}일</td>
			<td style="height: 30px; width: 110px;">포인트</td>  
		</tr>
	</table>
</c:forEach>
</div>
<div style="width:100%;height:15px;margin-top: 5px" align="center">
	<c:if test="${action eq 0}">
	<button style="width:50%;height:20px;">삭제하기</button>
</c:if>
<c:if test="${action eq 1}">
	<button style="width:50%;height:20px;">공유하기</button>
</c:if>
</div>




</body>
</html>