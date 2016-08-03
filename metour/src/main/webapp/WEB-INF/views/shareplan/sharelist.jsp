<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<meta charset="UTF-8">
<title>:::ShareList:::</title>
</head>
<body>
<table>
	<tr>
		<th>share_num</th>
		<th>writer</th>
		<th>metoo</th>
	</tr>
	<c:forEach var="s" items="${list }">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">${s.share_num }</a>
			</td>
			<td>${s.writer }</td>
			<td>${s.metoo }</td>		
		</tr>
	</c:forEach>
</table>
</body>
</html>