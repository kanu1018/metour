<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<a href="${pageContext.request.contextPath}/subplan/add.do">등록</a>
<c:forEach var="s" items="${list}">
	<table border="1">
		<tr>
			<th colspan="2">시작시간 ~ 종료시간</th>
			<th>제목</th>
			<th>장소</th>
			<th>미션</th>
		</tr>
		<tr>
			<td>${s.start_time}</td>
			<td>${s.end_time}</td>
			<td><a href="${pageContext.request.contextPath}/subplan/listview.do?sub_num=${s.sub_num}">${s.sub_title}</a></td>
			<td>${s.place }</td>
			<td><c:if test="${s.mission == 'g' }">명소 찾아가기</c:if><c:if test="${s.mission == 'p' }">명소 사진찍기</c:if></td>
		</tr>
	</table>
</c:forEach>
</body>
</html>