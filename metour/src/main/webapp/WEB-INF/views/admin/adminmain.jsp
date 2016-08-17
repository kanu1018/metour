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
*,body{
 font-family: "맑은 고딕";
}

</style>
<title>::ADMIN::</title>
</head>
<body>
<div align="center">
<h1>[ 관리자 페이지 ]</h1>
<table style="text-align: center;margin-top: 200px;"><tr><td>
<a href ="${pageContext.request.contextPath}/admin/memberList.do"><img src="${pageContext.request.contextPath}/resources/img/user02.png" style="width: 367px;height: 258px;align: center;"/></a>
<a href ="${pageContext.request.contextPath}/admin/singoList.do"><img src="${pageContext.request.contextPath}/resources/img/siren02.png" style="width: 270px;height: 270px;margin-left:100px;"/></a>
</td></tr></table>
</div>
</body>
</html>