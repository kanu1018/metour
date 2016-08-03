<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<script type="text/javascript">
	function shareplanSearch(){
		 document.f.submit();
	}
	function backList(){
		location.href="${pageContext.request.contextPath}/share/list.do";
	}
	function bestList(){
		location.href="${pageContext.request.contextPath}/share/list.do";
	}
	function placeList(){
		location.href="${pageContext.request.contextPath}/share/list.do";
	}
	function genderList(){
		newWindow = window.open("${pageContext.request.contextPath}/share/gender.do", "newWindow", "height=200, width=400, resizable=yes"); 
	}
	function ageList(){
		newWindow = window.open("${pageContext.request.contextPath}/share/age.do", "newWindow", "height=200, width=400, resizable=yes");
	}
</script>
<meta charset="UTF-8">
<title>:::ShareList:::</title>
</head>
<body>
<table>
	<tr>
		<td><input type="button" value="전체보기" onclick="backList()"></td>
		<td><input type="button" value="베스트글보기" onclick="bestList()"></td>
		<td><input type="button" value="지역별보기" onclick="placeList()"></td>
		<td><input type="button" value="성별보기" onclick="genderList()"></td>
		<td><input type="button" value="연령대별보기" onclick="ageList()"></td>
	</tr>
</table>

<form action="${pageContext.request.contextPath}/share/search.do" method="post" name="f ">
	<input type="text" name="search"><input type="button" value="검색" onclick="shareplanSearch()">
</form>
<table>
	<tr>
		<th>share_title</th>
		<th>writer</th>
		<th>metoo</th>
	</tr>
	<c:forEach var="s" items="${list }">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">${s.share_title}</a>
			</td>
			<td>${s.writer }</td>
			<td><input type="text" id="metoo" value="${s.metoo }"></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>