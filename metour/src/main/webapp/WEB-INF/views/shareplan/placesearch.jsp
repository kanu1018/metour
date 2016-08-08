<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function placeSearch(){
		var url = "${pageContext.request.contextPath}/share/placelist.do?place="+document.getElementById("place").value;
		window.opener.location.href = url;
		window.close();
	}
</script>
<title></title>
</head>
<body>
<table>
	<tr>
		<td><input type="text" id="place"></td>
		<td><input type="button" value="검색" onclick="placeSearch()"></td>
	</tr>
</table>
</body>
</html>