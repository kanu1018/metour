<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function genderM(){
		var url = "${pageContext.request.contextPath}/share/genderlist.do?gender=m";
		   window.opener.location.href = url;
		   window.close();
	}
	function genderF(){
		var url = "${pageContext.request.contextPath}/share/genderlist.do?gender=f";
		   window.opener.location.href = url;
		   window.close();
	}

</script>
<title>Insert title here</title>
</head>
<body>
<input type="button" value="남자" onclick="genderM()"><input type="button" value="여자" onclick="genderF()">
</body>
</html>