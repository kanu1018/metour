<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부 계획 목록</title>
</head>

<body>
<a href="${pageContext.request.contextPath}/subplan/add.do">등록</a>
	<table border="1">
		<tr>
			<th colspan="2">시작시간 ~ 종료시간</th>
			<th>제목</th>
			<th>장소</th>
			<th>미션</th>
			<th>미션성공</th>
			<th>사진 등록</th>
		</tr>
	<c:forEach var="s" items="${list}">
		<tr>
			<td>${s.start_time}</td>
			<td>${s.end_time}</td>
			<td><a href="${pageContext.request.contextPath}/subplan/listview.do?sub_num=${s.sub_num}">${s.sub_title}</a></td>
			<td>${s.place }</td>
			<td><c:if test="${s.mission == 'g' }">명소 찾아가기</c:if><c:if test="${s.mission == 'p' }">명소 사진찍기</c:if></td>
			<td><c:if test="${s.mission_yn == '0'}"></c:if><c:if test="${s.mission == '1'}">사진 완료 & GPS 실패</c:if>
				<c:if test="${s.mission_yn == '2'}">성공</c:if><c:if test="${s.mission == '3'}">성공</c:if>
			</td>
			<td><input type="button" value="카메라이미지"></td>
		</tr>
	</c:forEach>
	</table>

</body>
</html>