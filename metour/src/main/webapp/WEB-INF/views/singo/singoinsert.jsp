<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	window.onload = init;
	
	function init() {
		document.fr.share_num.value = window.opener.document.fs.share_num.value;
		document.fr.singo_kind.value = window.opener.document.fs.singo_kind.value;
	}
	function add() {
		window.opener.document.fs.singo_kind.value = 's';
		document.fr.submit();
		window.close();
	}
</script>
<title>:::SingoInsert</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/singo/add.do" method="post" name="fr">
	<table>
		<tr>
			<td><input type="text" name="singo_content"></td>
			<td><input type="button" value="신고" onclick="add()"></td>
		</tr>
	</table> 
	<input type="hidden" name="share_num">
	<input type="hidden" name="singo_kind">
</form>
</body>
</html>