<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
*,body{
 font-family: "맑은 고딕";
 margin:0px;
 padding:0px;
 font-size:14px;
}
/* caption{
 background: url(images/title_event.png) no-repeat center center;
 width:700px;
 height:50px;
} */
caption span{
 display:none;
}
table{
 border-collapse: collapse;
}
td{
 border-bottom: 1px solid #000;
 text-align:center;
 padding:5px 10px;
}
th{
 height:34px;
 padding:0px 10px;
 font-size:16px;
}
/* th span{
  border-right:1px solid #666;
 background: url(images/bar7_1.png) no-repeat right 10px;
  display:block;
  padding:0px 0px 2px 0px;
} */
tr:FIRST-CHILD{
 
}
tr:last-CHILD{
 border-bottom: 2px solid #000;
}
/* th:FIRST-CHILD{
 background: url(images/table_header_bg.png) repeat-x;
} */
 /* 2열의 th 내용*/ 
/* th:nth-child(2) {
 background: url(images/table_header_bg.png) center top repeat-x;
} 
th:nth-child(3) {
 background: url(images/table_header_bg.png) center top repeat-x;
} 
th:nth-child(4) {
 background: url(images/table_header_bg.png) center top repeat-x;
} 
th:nth-child(5) {
 background: url(images/table_header_bg.png) right top repeat-x;
}  */
.bb{
 border:none;
}
/* td{
 background: url(images/bar7_1.png) no-repeat right bottom;
} */
input[type="button"] {
  background: #1dabb8;
  border-radius: 3px;
  color: #fff;
  float: center;
  font-weight: bold;
   padding: 5px 10px;
}
</style>
<script type="text/javascript">
	function goBack() {
	    window.history.back();
	}
	function outMember() {
		location.href="${pageContext.request.contextPath}/admin/outMemberList.do";
	}
	function goMain() {
		location.href="${pageContext.request.contextPath}/admin/adminForm.do";
	}
	function a(id) {
		location.href="${pageContext.request.contextPath}/admin/out.do?id="+id;
	}
	function b(id) {
		location.href="${pageContext.request.contextPath}/admin/in.do?id="+id;
	}
</script>
<title>Insert title here</title>
</head>

<body>
<%@ include file="../include_login.jsp" %>
<form style="margin: 0 auto;text-align: center;margin-top: 100px">
<table style="margin: 0 auto;text-align: center;">
<tr>
	<th>회원번호</th>
	<th>ID</th>
	<th>이름</th>
	<th>생년월일</th>
	<th>연락처</th>
	<th>성별</th>
	<th>상태</th>
</tr>
<c:forEach var = "l" items="${list}">
<tr>
	<td>${l.mem_num}</td>
	<td>${l.id}</td>
	<td>${l.name}</td>
	<td>${l.birth}</td>
	<td>${l.phone}</td>
	<td>${l.gender}</td>
	<td>${l.mem_status}</td>
	<c:if test="${l.mem_status eq 'y'}">
		<td><input type="button" onclick="a('${l.id}')" value="블랙리스트 등록"></td>
	</c:if>
	<c:if test="${l.mem_status eq 'n'}">
		<td><input type="button" value="블랙리스트 풀기" onclick="b('${l.id}')"></td>
	</c:if>
</tr>
</c:forEach>
</table>
<c:choose>
	<c:when test="${a eq 'y'}">
		<tr><td><input type="button" value="일반회원 보기" onclick="goBack()" style="margin-top: 25px">
		<input type="button" value="돌아가기" onclick="goMain()"></td></tr>
	</c:when>
	<c:otherwise>
		<tr><td><input type="button" value="블랙리스트 보기" onclick="outMember()"style="margin-top: 25px;background: #1DABB9;">
		<input type="button" value="돌아가기" onclick="goMain()"></td></tr>
	</c:otherwise>
</c:choose>
</form>
</body>
</html>