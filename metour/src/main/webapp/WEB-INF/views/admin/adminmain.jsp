<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
function member() {
	location.href = "${pageContext.request.contextPath}/admin/memberList.do"
}
function singo() {
	location.href = "${pageContext.request.contextPath}/admin/singoList.do"
}
</script>
<title>Insert title here</title>
</head>
<body>
<input type="button" value="회원관리" onclick="member()">
<input type="button" value="신고조회" onclick="singo()">
</body>
</html>