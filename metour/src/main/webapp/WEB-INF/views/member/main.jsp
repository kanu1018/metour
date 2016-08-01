<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function a(){
		document.f.submit();
	}
</script>
<title>Insert title here</title>
</head>
<body>
메인페이지~
<form action="${pageContext.request.contextPath}/member/loginForm.do" method="post" name="f">
<a onclick="a()">로그인&nbsp;</a>
</form>
</body>
</html>