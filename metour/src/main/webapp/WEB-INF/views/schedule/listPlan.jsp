<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function sharePlans(){
		var sel_obj = document.getElementsByName("checked");
		var selected = "";
		for(var i = 0; i < sel_obj.length; i++){
			if(sel_obj[i].checked == true){
				selected += sel_obj[i].value+"/";
			}
			if(i==sel_obj.length-1){
				selected = selected.substring(0,selected.length-1);
			}
		}
		
		if(confirm("선택된 날짜 계획을 공유하시겠습니까?")==true){
			
			var url = "${pageContext.request.contextPath}/subplan/combination.do?main_num="+selected;
			
			/* var url = "${pageContext.request.contextPath}/ms/selectPlans.do?main_num="+selected; */
			//location.href = url;
			window.opener.location.href = url;
			window.close();
		}else{
			return;
		}
	}
	
	function deletePlans(){
		var sel_obj = document.getElementsByName("checked");
		var selected = "";
		for(var i = 0; i < sel_obj.length; i++){
			if(sel_obj[i].checked == true){
				selected += sel_obj[i].value+"/";
			}
		}
		
		if(confirm("선택된 계획을 삭제하시겠습니까?")==true){
			var url = "${pageContext.request.contextPath}/schedule/deletePlans.do?main_num="+selected;
			//location.href = url;
			window.opener.location.href = url;
			window.close();
		}else{
			return;
		}
	}
</script>
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
			<td rowspan="2" style="height: 60px; width: 45px;"><input type="checkbox" name="checked" value="${s.main_num}"></td>
			<td colspan="2" style="height: 30px; width: 310px;">${s.main_title}</td>
			<td rowspan="2" style="height: 60px; width: 25px;">상세</td>
		</tr>
		<tr>
			<td style="height: 30px; width: 200px;">${s.year}년 ${s.month}월 ${s.day}일</td>
		</tr>
	</table>
</c:forEach>
</div>
<div style="width:100%;height:15px;margin-top: 5px" align="center">
	<c:if test="${action eq 0}">
	<button style="width:50%;height:20px;" onclick="deletePlans()">삭제하기</button>
</c:if>
<c:if test="${action eq 1}">
	<button style="width:50%;height:20px;" onclick="sharePlans()">공유하기</button>
</c:if>
</div>




</body>
</html>