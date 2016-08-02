<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function a(){
		location.href = "${pageContext.request.contextPath}/member/loginForm.do"
	}
	function b() {
		location.href = "${pageContext.request.contextPath }/member/logout.do";
	}
	function c() {
		location.href = "${pageContext.request.contextPath }/member/pwdchkForm.do";
	}
</script>
<title>Insert title here</title>
</head>
<body>
메인페이지~
<form method="post" name="f">
<c:choose>
		<c:when test="${sessionScope.id eq id && id ne null}">
			<a onclick="b()">로그아웃&nbsp;</a>
			<a onclick="c()">회원정보수정&nbsp;</a>
		</c:when>
		<c:otherwise>
			<a onclick="a()">로그인&nbsp;</a>
		</c:otherwise>
</c:choose>
</form>
</body>
</html>