<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
/* body{
	width: 300px;
	height: 300px;
	
	background-image: url('${pageContext.request.contextPath}/resources/img/user.png');
	background-repeat: no-repeat;
	background-size: contain;
}
 */


</style>
<title>Insert title here</title>
</head>
<body>
<form style="text-align: center;margin-top: 200px;" >
<a href ="${pageContext.request.contextPath}/admin/memberList.do"><img src="${pageContext.request.contextPath}/resources/img/user.png" style="width: 240px;height: 300px;align: center;"/></a>
<a href ="${pageContext.request.contextPath}/admin/singoList.do"><img src="${pageContext.request.contextPath}/resources/img/siren.png" style="margin-left:100px; width: 240px;height: 300px"/></a>
</form>
</body>
</html>