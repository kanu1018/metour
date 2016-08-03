<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function age10(){
		var url = "${pageContext.request.contextPath}/share/agelist.do?age=10";
		   window.opener.location.href = url;
		   window.close();
	}
	
	function age20(){
		var url = "${pageContext.request.contextPath}/share/agelist.do?age=20";
		   window.opener.location.href = url;
		   window.close();
	}
	
	function age30(){
		var url = "${pageContext.request.contextPath}/share/agelist.do?age=30";
		   window.opener.location.href = url;
		   window.close();
	}
	
	function age40(){
		var url = "${pageContext.request.contextPath}/share/agelist.do?age=40";
		   window.opener.location.href = url;
		   window.close();
	}
	
	function age50(){
		var url = "${pageContext.request.contextPath}/share/agelist.do?age=50";
		   window.opener.location.href = url;
		   window.close();
	}
	
	function age60(){
		var url = "${pageContext.request.contextPath}/share/agelist.do?age=60";
		   window.opener.location.href = url;
		   window.close();
	}
	

</script>
<title>Insert title here</title>
</head>
<body>
<input type="button" value="10대" onclick="age10()">
<input type="button" value="20대" onclick="age20()">
<input type="button" value="30대" onclick="age30()">
<input type="button" value="40대" onclick="age40()">
<input type="button" value="50대" onclick="age50()">
<input type="button" value="60대" onclick="age60()">
</body>
</html>