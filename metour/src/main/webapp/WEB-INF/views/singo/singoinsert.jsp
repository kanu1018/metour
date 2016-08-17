<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	/* window.onload = init;
	
	function init() {
		document.fr.share_num.value = window.opener.document.fs.share_num.value;
		document.fr.singo_kind.value = window.opener.document.fs.singo_kind.value;
	} */
	function add() {
		//window.opener.document.fs.singo_kind.value = 's';
		//document.fr.submit();
		//window.close();
		
		var url = "${pageContext.request.contextPath}/singo/add.do?singo_content="+document.fr.singo_content.value+"&share_num="+document.fr.share_num.value+"&singo_kind="+document.fr.singo_kind.value+"&share_num="+document.fr.share_num.value+"&gul_num="+document.fr.gul_num.value;
		   window.opener.location.href = url;
		   window.close();
	}
</script>
<style type="text/css">
*,body{
 font-family: "맑은 고딕";
 margin-top:20px;
 padding:0px;
}

 INPUT[type="button"]{
		height: 30px;
		border: solid 2px;
		border-radius:7px;
		background-color:#1ABC9C;
		text-align:center;
		color: #FFFFFF;
		width: 50px;
}

input[type="text"]{
  line-height: normal;
  width: 250px;
  height: 30px;
}


</style>
<title>:::SingoInsert</title>
</head>
<body>
<div align="center">
<h3>[신고 해주세요!]</h3>
<form action="${pageContext.request.contextPath}/singo/add.do" method="post" name="fr">
	<table>
		<tr>
			<td><input type="text" name="singo_content" placeholder="신고 사유를 입력해주세요."></td>
			<td><input type="button" value="신고" onclick="add()"></td>
		</tr>
	</table> 
	<input type="hidden" name="share_num" value="${num }">
	<input type="hidden" name="singo_kind" value="${type }">
	<input type="hidden" name="gul_num" value="${share_num }">
</form>
</div>
</body>
</html>