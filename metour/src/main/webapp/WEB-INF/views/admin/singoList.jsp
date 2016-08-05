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
input[type="button"] {
  background: #1dabb8;
  border-radius: 3px;
  color: #fff;
  float: center;
  font-weight: bold;
  padding: 5px 10px;
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
}
  2열의 th 내용
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
} */
</style>
<script type="text/javascript">
	function a(singo_num) {
		if(confirm("정말 처리하시겠습니까?")==true){
			location.href = "${pageContext.request.contextPath }/admin/singoCom.do?singo_num="+singo_num;
		   } else{
		      return;
		   }
	}
	function goMain() {
		location.href="${pageContext.request.contextPath}/admin/adminForm.do";
	}
</script>
<title>Insert title here</title>
</head>
<%@ include file="../include_login.jsp" %>
<body>
<form style="margin: 0 auto;text-align: center;margin-top: 100px">
<table style="margin: 0 auto;text-align: center">
<tr class="aa">
	<th>신고번호</th>
	<th>신고유형</th>
	<th>신고사유</th>
	<th>처리현황</th>
	<th>신고대상</th>
	<th>피신고자</th>
</tr>
<c:forEach var = "l" items="${list}">
<tr>
	<td>${l.singo_num}</td>
	<c:if test="${l.singo_kind eq 'r'}">
	<td>댓글</td>
	</c:if>
	<c:if test="${l.singo_kind eq 's'}">
	<td>글</td>
	</c:if>
	<td>${l.singo_content}</td>
	<td>처리전</td>
	<td>${l.content_num}</td>
	<td>${l.singo_mem}</td>
	<td><input type="button" onclick="a('${l.singo_num}')" value="처리완료"></td>
	<%-- <td><a href ="${pageContext.request.contextPath }/admin/singoCom.do?singo_num=${l.singo_num}">처리완료</a></td> --%>
</tr>
</c:forEach>
</table>
<input type="button" value="돌아가기" onclick="goMain()" style="margin-top: 25px">
</form>
</body>
</html>