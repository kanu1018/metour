<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/member/pwdchk_ok.do" method="post" name="f">
<input type="text" name="id" id="id" value="${sessionScope.id}"/>
<input type="password" name="pwd" style="height: 25px; width: 200px">
<input type="submit" value="확인"/>
<input type="reset" value="취소"/>
</form>
</body>
</html>