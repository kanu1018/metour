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
			<td><a href="${pageContext.request.contextPath}/subplan/listview.do?sub_num=${s.sub_num}">${s.sub_title}</a></td>
		</tr>
	</table>
</c:forEach>
</body>
</html>