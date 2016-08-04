<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function login(){
	location.href = "${pageContext.request.contextPath}/member/loginForm.do"
}
function logout(){
	if(confirm("로그아웃을 하시겠습니까?")==true){
		location.href = "${pageContext.request.contextPath }/member/logout.do";
	}else{
		return;
	}
}
function goEditMember() {
	location.href = "${pageContext.request.contextPath }/member/pwdchkForm.do";
}
function goAdminPage() {
	location.href = "${pageContext.request.contextPath }/admin/adminForm.do";
}
function goJoin() {
	location.href="${pageContext.request.contextPath }/member/joinForm.do";
}

</script>

<title>Insert title here</title>


</head>
<body>
<div align="right">
	<c:choose>
		<c:when test="${sessionScope.id eq id && id ne null}">
			<a onclick="logout()">로그아웃&nbsp;</a>
			<a onclick="goEditMember()">회원정보수정&nbsp;</a>
				<c:if test="${type eq 'm'}">
				<a onclick="goAdminPage()">관리자페이지&nbsp;</a>
				</c:if>
		</c:when>
		<c:otherwise>
			<a onclick="login()">로그인&nbsp;</a>
			<a onclick="goJoin()">회원가입&nbsp;</a>
		</c:otherwise>
	</c:choose>
</div>
<br>
</body>
</html>