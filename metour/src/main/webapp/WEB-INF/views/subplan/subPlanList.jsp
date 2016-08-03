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
		<td>
			<table border="1">
			<tr>
				<th>시간</th>	
			</tr>
			<c:forEach var="time" items="${time}">
				<tr>
					<th>${time}</th>
				</tr>
				</c:forEach>
			</table>
		</td>
		<td>
			<table border="1">
				<tr>
					<th>제목</th>
					<th>장소</th>
					<th>미션</th>
					<th>미션성공</th>
					<th>사진 등록</th>
				</tr>
				<c:forEach var="splist" items="${splist}">
				<tr>
					<td <c:if test="${splist.title ne ''}">style="background-color: #F7CAC9;"</c:if>>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/subplan/listview.do?sub_num=${splist.sub_num}">${splist.title}</a>&nbsp;&nbsp;</td>
					<td>${splist.place }</td>
					<td><c:if test="${splist.mission == 'g' }">명소 찾아가기</c:if><c:if test="${splist.mission == 'p'}">명소 사진찍기</c:if></td>
					<td><c:if test="${splist.mission_yn == '0'}"></c:if><c:if test="${splist.mission == '1'}">사진 완료 & GPS 실패</c:if>
						<c:if test="${splist.mission_yn == '2'}">성공</c:if><c:if test="${splist.mission == '3'}">성공</c:if>
					</td>
					<td> &nbsp;&nbsp;<c:if test="${splist.title ne '' && splist.mission == 'p'}"><a href="${pageContext.request.contextPath}/여기 바꾸기?sub_num=${splist.sub_num}">사진등록</a></c:if>&nbsp;&nbsp;</td>
				</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
</table>
</body>
</html>