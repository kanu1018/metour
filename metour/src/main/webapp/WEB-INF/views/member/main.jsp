<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	function login(){
		location.href = "${pageContext.request.contextPath}/member/loginForm.do"
	}
	function logout(){
		if(confirm("로그아웃을 하시겠습니까?")==true){
			location.href = "${pageContext.request.contextPath }/member/logout.do";
		}else{
			return;
		}
	}
	function goEditMember() {
		location.href = "${pageContext.request.contextPath }/member/pwdchkForm.do";
	}
	function goAdminPage() {
		location.href = "${pageContext.request.contextPath }/admin/adminForm.do";
	}
	function goShareList() {
		location.href = "${pageContext.request.contextPath }/share/list.do";
	}
	function goSchedule() {
		location.href = "${pageContext.request.contextPath }/schedule/schedule.do";
	}
	function goJoin() {
		location.href="${pageContext.request.contextPath }/member/joinForm.do";
	}
	function goLoginForm(){
		if(confirm("로그인이 필요한 서비스 입니다. \n로그인 하시겠습니까?")==true){
			location.href = "${pageContext.request.contextPath}/member/loginForm.do"
		}else{
			return;
		}
	}
	function search1(){
		var text = document.getElementById("searchText").value;
		var select = document.getElementById("search_box");
		var option_value = select.options[select.selectedIndex].value;
		if(text==''){
			option_value = 0;
			alert("검색어를 입력해주세요");
		}else{
			location.href = "${pageContext.request.contextPath }/member/search.do?type="+option_value+"&searchText="+text;
		}
	}
	function showKeyCode(event) {
		var select = document.getElementById("search_box");
		var option_value = select.options[select.selectedIndex].value;
		var keyValue = event.keyCode;
		if(option_value == 3){
			if(((keyValue>=48) && (keyValue<=57))){
				return true;
			}
			else{
				return false;
			}
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include_login.jsp" %>
<div align="center">
	<c:choose>
			<c:when test="${sessionScope.id eq id && id ne null}">
				<a onclick="goSchedule()">일정등록&nbsp;</a>
			</c:when>
			<c:otherwise>
				<a onclick="goLoginForm()">일정등록&nbsp;</a>
			</c:otherwise>
	</c:choose>
		<a onclick="goShareList()">공유글보기&nbsp;</a><br>
</div>
<div align="center" style="margin-top: 10px;">
<select id="search_box">
	<option value="1">제목</option>
	<option value="2">작성자</option>
	<option value="3">글번호</option>
</select>
<input type="text" id="searchText" onkeypress="if(event.keyCode==13) {search1();}else{return showKeyCode(event)}">
<input type="button" value="검색" onclick="search1()">
<br>
<table border="1" style="margin-top: 20px;text-align: center" >
	<tr class="aa">
	<th>게시글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>지역</th>
	<th>추천수</th>
	<c:forEach var="m" items="${LIST}">
		<tr><td>${m.share_num}</td>
		<td>${m.main_title}</td>
		<td>${m.id}</td>
		<td>${m.location}</td>
		<td>${m.metoo}</td><tr>
	</c:forEach>
</table>
</div>
</body>
</html>