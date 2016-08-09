<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
	var newWindow;
</script>
<title>:::ShareView:::</title>
</head>
<body>
<c:if test="${s.content ne null }">${s.content }</c:if>
</body>
</html>
