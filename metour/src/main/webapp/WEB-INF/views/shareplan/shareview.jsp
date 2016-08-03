<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
	var flag = false;
	
	function metooPlus(num) {
		var metoo = ${s.metoo};
		var metoo_yn = ${me.metoo_yn};
		if(flag == false){
			document.getElementById("metoo").value++;
			flag = true;
			location.href = "${pageContext.request.contextPath }/share/metoo.do?share_num="+num+"&metoo="+metoo;
		}
	}
	
	function metooCancel(num) {
		var metoo = ${s.metoo};
		if(flag == true){
			if(metoo > 0){
				document.getElementById("metoo").value--;
				flag = false;
				location.href = "${pageContext.request.contextPath }/share/metoo.do?share_num="+num+"&metoo="+metoo;
			}
		}
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
			<%-- <c:if test="${sessionScope.id ne null }">
				<input type="button" value="metoo" onclick="metooPlus(${s.share_num })">
				<c:if test="${s.share_num eq m.share_num && m.metoo_yn eq 'y' }">
					<input type="button" value="metoo" onclick="metooCancel(${s.share_num })" style="background-color: #FFA7A7;">
				</c:if>
			</c:if> --%>
			<input type="button" value="metoo" onclick="metooPlus(${s.share_num })">
				<c:if test="${s.share_num eq me.share_num && me.metoo_yn eq 'y' }">
					<input type="button" value="metoo" onclick="metooCancel(${s.share_num })" style="background-color: #FFA7A7;">
			</c:if>
		</td>
	</tr>
</table>
</body>
</html>