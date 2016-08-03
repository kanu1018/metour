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
caption{
 background: url(images/title_event.png) no-repeat center center;
 width:700px;
 height:50px;
}
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
 padding:0px 0px;
 font-size:16px;
}
th span{
/*  border-right:1px solid #666; */
 background: url(images/bar7_1.png) no-repeat right 10px;
  display:block;
  padding:0px 0px 2px 0px;
}
tr:FIRST-CHILD{
 
}
tr:last-CHILD{
 border-bottom: 2px solid #000;
}
th:FIRST-CHILD{
 background: url(images/table_header_bg.png) repeat-x;
}
 /* 2열의 th 내용*/ 
th:nth-child(2) {
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
} 
.bb{
 border:none;
}
td{
 background: url(images/bar7_1.png) no-repeat right bottom;
}
</style>
<script type="text/javascript">
function goBack() {
    window.history.back();
}
</script>
<title>Insert title here</title>
</head>
<body>
<form >
<table style="margin: 0 auto;text-align: center">
<tr class="aa">
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
	<td><a href ="${pageContext.request.contextPath }/admin/out.do?id=${l.id}">블랙리스트 등록</a></td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>