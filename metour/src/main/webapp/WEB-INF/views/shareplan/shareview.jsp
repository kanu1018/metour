<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
	function metoo(share_num, type) {
		location.href = "${pageContext.request.contextPath }/metoo/metoo.do?share_num="+share_num+"&type="+type;
	}
</script>
<title>:::ShareView:::</title>
</head>
<body>
<table border="1">
	<tr>
		<th>share_num</th>
		<td>${s.share_num }</td>
		<th>writer</th>
		<td>${s.writer }</td>
	</tr>
	<tr>
		<th colspan="2">content</th>
		<td colspan="2">
			 <c:if test="${s.content ne null }">${s.content }</c:if>
		</td>
	</tr>
	<tr>
		<td><input type="text" id="metoo" value="${s.metoo }"></td>
		<td>
			<c:choose>
				<c:when test="${cnt eq 0 }">
					<input type="button" value="metoo" onclick="metoo(${s.share_num },1)">
				</c:when>
				<c:when test="${me.metoo_yn eq 'n'}">
					<input type="button" value="metoo" onclick="metoo(${s.share_num },2)" style="background-color: #B2EBF4;">
				</c:when>
				<c:when test="${me.metoo_yn eq 'y'}">
					<input type="button" value="metoo" onclick="metoo(${s.share_num },3)" style="background-color: #FFA7A7;">
				</c:when>
			</c:choose>
		</td>
	</tr>
</table>
<%-- <form action="">
	<table>
		<tr>
			<td><input type="text" value="rep_content"></td>
			<td><input type="button" value="댓글작성"></td>
		</tr>
</form>
	<c:forEach var="" items="">
			<tr>
				<td></td>
			</tr>
		</c:forEach>
	</table> --%>
</body>
</html>