<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	window.onload = function(){
		div = document.getElementById("content");
		document.frm.html.value = div.innerHTML;
		document.frm.submit();
	}
	function ss() {
		div = document.getElementById("content");
		document.frm.html.value = div.innerHTML;
		document.frm.submit();
	}
	
</script>
</head>
<body>
<div id="content">
<c:forEach items="${item}" var="i" varStatus="status1">
	<h1>${i.main_title }</h1>
	<h2>${i.date }</h2>
	<c:forEach items="${item.get(status1.index).list}" var="m" varStatus="status">
		<div align="center">
		<div style="width:600px; ">
			<div style="background-color: #E9E7DB; height: 35px; padding-top: 15px;" >${m.sub_title }</div>
			<div ><div style=" float: left; width: 25%; background-color: #4285F4; height: 35px; padding-top: 15px;">일정시작시각</div><div style="float: left; width: 25%;height: 35px;padding-top: 15px; ">${m.start_time}</div ><div style="float: left; width: 25%; background-color: #4285F4;height: 35px;padding-top: 15px;">일정마무리시각</div><div style="float: left; width: 25%;height: 35px;padding-top: 15px;">${m.end_time }</div></div>
			<c:if test="${not empty m.photo}">
			<div style="margin-top: 10px"><h5><br>이미지</h5><img src="${m.photo}" style="width:600px;height:400px"/></div>
			</c:if>
			<div><input type="text" readonly="readonly" value="${m.memo}" style="width:600px; height: 100px; text-align: center"></div>
		</div>
		
		<c:if test="${not status.last}">
		<br>
		<h2>NEXT</h2>
		<br>
		<br>
		</c:if>
	</div>
	</c:forEach>
	<c:if test="${not status1.last}">
	<h3>다음날짜</h3>
	</c:if>
</c:forEach>
</div>
<form action="${pageContext.request.contextPath}/subplan/com.do" method="post" name="frm">
<input type="hidden" name="html">
<input type="hidden" name="photo" value="${photo}">
<input type="hidden" name="location" value="${location}">
<input type="hidden" name="main_num" value="${main_num}">
<input type="button" value="공유하기" onclick="ss()">
<input type="hidden" name="point" value="${point}">

</form>

</body>
</html>