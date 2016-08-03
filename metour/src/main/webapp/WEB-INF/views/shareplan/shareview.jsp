<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<meta charset="UTF-8">
<title>:::ShareView:::</title>
</head>
<body>
<table border="1">
	<tr>
		<th>share_num</th>
		<td>${s.share_num }</td>
		<th>writer</th>
		<td>${s.writer }</td>
	</tr>
	<tr>
		<th colspan="2">content</th>
		<td colspan="2">
			 <c:if test="${s.content ne null }">${s.content }</c:if>
		</td>
	</tr>
</table>
</body>
</html>