<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		if(confirm("로그인이 필요한 서비스 입니다. \n 로그인 하시겠습니까?")==true){
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
		<a onclick="goShareList()">공유글보기&nbsp;</a>
</div>
<div align="center">
<select id="search_box">
	<option value="1">제목</option>
	<option value="2">작성자</option>
	<option value="3">글번호</option>
</select>
<input type="text" id="searchText" onkeypress="if(event.keyCode==13) {search1();}">
<input type="button" value="검색" onclick="search1()">

<table border="1" style="text-align: center">
	<tr><th width="100px" nowrap>게시글번호</th><th width="300px" nowrap>제목</th><th width="100px" nowrap>작성자</th><th width="100px" nowrap>지역</th><th width="100px" nowrap>추천수</th>
	<c:forEach var="m" items="${LIST}">
		<tr><td>${m.share_num}</td><td>${m.main_title}</td><td>${m.id}</td><td>${m.location}</td><td>${m.metoo}</td><tr>
	</c:forEach>
</table>
</div>
</body>
</html>