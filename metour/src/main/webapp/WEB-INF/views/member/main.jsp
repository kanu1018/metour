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
/* caption{
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
th span{ */
/*  border-right:1px solid #666; */
/*  background: url(images/bar7_1.png) no-repeat right 10px;
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
} 
.bb{
 border:none;
}
td{
 background: url(images/bar7_1.png) no-repeat right bottom;
} */
	.a1:link {text-decoration: none; color: #282832; background-color: #FFFFFF;}
	.a1:visited {text-decoration: none; color: #282832; background-color: #FFFFFF;}
	.a1:active {text-decoration: none; color: #282832; background-color: #FFFFFF;}
	.a1:hover {text-decoration: none; color: #282832; background-color: #FFFFFF;}
	
	a.a2{font-size: 15px;}
	.a2:link {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}
	.a2:visited {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}
	.a2:active {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}
	.a2:hover {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}
	
	div.top{
		height: 60px;
		background-color: #1ABC9C; 
		color: #ffffff;
		padding: 0px;
	}
	
	table.tabtop{
		width: 100%;
	}
	
	td.menu {
		text-align: left;
	}
	
	td.dropdown{
		text-align: right;
	}

	.dropdown li ul {
		background: #ffffff;
		display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
		height:30px;
		padding:0px;
		margin:0px;
		border:0px;
		position: absolute;
		width:200px;
		z-index:200;
		list-style-type: none;
		float: right;
		text-align: left;
		font-size: 30px;
		color: #000000;
	}
	.dropdown li:hover ul {
		display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
		clear: both;
		margin-right: 20px;
	} 
	img.person{
		width: 25px;
		height: 25px;
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
	function goJoin() {
		location.href="${pageContext.request.contextPath }/member/joinForm.do";
	}
</script>
<title>:::MAIN:::</title>
</head>
<body><%-- 
<%@ include file="../include_login.jsp" %> --%>
<div class="top" align="center">
	<%-- <c:choose>
			<c:when test="${sessionScope.id eq id && id ne null}">
				<a onclick="goSchedule()">일정등록&nbsp;</a>
			</c:when>
			<c:otherwise>
				<a onclick="goLoginForm()">일정등록&nbsp;</a>
			</c:otherwise>
	</c:choose>
		<a onclick="goShareList()">공유글보기&nbsp;</a><br> --%>
	<table class="tabtop">
		<tr>
			<td class="menu">
				이미지&nbsp;&nbsp;&nbsp;
				<c:choose>
					<c:when test="${sessionScope.id eq id && id ne null}">
						<a onclick="goSchedule()" target="ppp" class="a2">일정등록&nbsp;</a>
					</c:when>
					<c:otherwise>
						<a onclick="goLoginForm()" target="ppp" class="a2">일정등록&nbsp;</a>
					</c:otherwise>
				</c:choose>
				<a onclick="goShareList()" target="ppp" class="a2">공유글보기&nbsp;</a><br>
			</td>
			<td class="dropdown">
				<ul>
					<li style="list-style-type: none;"><a href="#" class="a2">
						<img src="/img/person.png"></a>
						<ul>
							<c:choose>
								<c:when test="${sessionScope.id eq id && id ne null}">
									<li><a onclick="logout()" class="a1">로그아웃&nbsp;</a></li>
									<li><br><a onclick="goEditMember()" class="a1">회원정보수정&nbsp;</a></li>
										<c:if test="${type eq 'm'}">
											<li><br><a onclick="goAdminPage()" class="a1">관리자페이지&nbsp;</a></li>
										</c:if>
								</c:when>
								<c:otherwise>
									<li><a onclick="login()" class="a1">&nbsp;LOGIN&nbsp;</a></li>
									<li><br><a onclick="goJoin()" class="a1">&nbsp;SIGN UP&nbsp;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</li>
				</ul>
			</td>
		</tr>
	</table>
</div>
<div class="search" align="center" style="margin-top: 10px;">
<table>
	<tr>
		<td>
			<select id="search_box">
				<option value="1">제목</option>
				<option value="2">작성자</option>
				<option value="3">글번호</option>
			</select>
		</td>
		<td>
			<input type="text" id="searchText" onkeypress="if(event.keyCode==13) {search1();}else{return showKeyCode(event)}">
		</td>
		<td>
			<input type="button" value="검색" onclick="search1()">
		</td>
	</tr>
</table>

<!-- <select id="search_box">
	<option value="1">제목</option>
	<option value="2">작성자</option>
	<option value="3">글번호</option>
</select>
<input type="text" id="searchText" onkeypress="if(event.keyCode==13) {search1();}else{return showKeyCode(event)}">
<input type="button" value="검색" onclick="search1()"> -->
<br>
<%-- <table border="1" style="margin-top: 20px;text-align: center" >
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
</table> --%>
</div>
<div id="div4">
	<iframe name="ppp" frameborder="0" width="100%" height="100%"></iframe>
</div>
</body>
</html>