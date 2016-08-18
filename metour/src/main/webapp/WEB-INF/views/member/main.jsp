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
	.a1:link {text-decoration: none; color: #282832; background-color: #F4FAF9;}
	.a1:visited {text-decoration: none; color: #282832; background-color: #F4FAF9;}
	.a1:active {text-decoration: none; color: #282832; background-color: #F4FAF9;}
	.a1:hover {text-decoration: none; color: #282832; background-color: #F4FAF9;}
	
	a.a2{font-size: 15px;}
	.a2:link {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}
	.a2:visited {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}
	.a2:active {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}
	.a2:hover {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}

	div.top{
		height: 80px;
		background-color: #1ABC9C; 
		color: #ffffff;
		padding: 0px;
		
	}
	
	table.tabtop{
		width: 100%;
	}
	
	/* td.menu {
		text-align: left;
	} */
	
	td.dropdown{
		text-align: right;
		padding-top: 5px;
	}

	.dropdown li ul {
		background-color: #F4FAF9;
		display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
		height:30px;
		padding:0px;
		margin:0px;
		border:0px;
		position: absolute;right: 0;top: 60px;
		width:80px;
		height: 60px;
		z-index:200;
		list-style-type: none;
		float: right;
		text-align: left;
		font-size: 40px;
		color: #000000;
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
	}
	.dropdown li:hover ul {
		display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
		clear: both;
		margin-right: 20px;
		background-color: #F4FAF9;
	}
	 
	td.menu{
		text-align: right;
		padding-top: 5px;
	}

	.menu ul li ul {
		background-color: #F4FAF9;
		display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
		height:30px;
		padding:0px;
		margin:0px;
		border:0px;
		position: absolute;left: 15px;top:65px;
		width:100px;
		height: 100px;
		z-index:200;
		list-style-type: none;
		float: right;
		text-align: left;
		font-size: 50px;
		color: #000000;
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;		
	
	}
	.menu li:hover ul {
		display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
		clear: both;
		margin-right: 20px;
		background: #F4FAF9;
	} 
	
	img.person{
		width: 25px;
		height: 25px;
	}
	img.search{
		width: 25px;
		height: 25px;
	}
	
	INPUT[type=text]{
		font-size: 12pt;
		border:1px;
		border-color: #808080;
		border-style: solid;
		background-color: #ffffff;
		width: 300px;
		font-family: 맑은 고딕;
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
	/* function search1(){
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
	} */
	
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
	
	function backList(){
		location.href="${pageContext.request.contextPath}/share/list.do";
	}
	function bestList(){
		location.href="${pageContext.request.contextPath}/share/best.do";
	}
	function placeList(){
		newWindow = window.open("${pageContext.request.contextPath}/share/place.do", "newWindow", "height=200, width=400, resizable=yes"); 
	}
	function genderList(){
		newWindow = window.open("${pageContext.request.contextPath}/share/gender.do", "newWindow", "height=200, width=400, resizable=yes"); 
	}
	function ageList(){
		newWindow = window.open("${pageContext.request.contextPath}/share/age.do", "newWindow", "height=200, width=400, resizable=yes");
	}
</script>
<title>:::MAIN:::</title>
</head>
<body>
<div class="top" align="center">
	<table class="tabtop" >
		<tr>
			<td align="left" style="width: 33%; padding-left: 5px;" class="menu">
				<a href="${pageContext.request.contextPath }/share/list.do" target="ppp" class="a2">
					<ul>
						<li style="list-style-type: none;">
							<a href="#" class="a1">
								<img src="${pageContext.request.contextPath}/resources/img/menu01.png" style="width: 50px; height: 50px; position: absolute;left: 10px; top: 15px;">
							</a>
							<ul style="text-align: left; padding-left: 10px; padding-top: 7px; padding-bottom: 7px;">
								<li><a href="${pageContext.request.contextPath}/share/list.do" class="a1" target="ppp">&nbsp;ALL&nbsp;</a></li>
								<li><a href="${pageContext.request.contextPath}/share/best.do" class="a1" target="ppp">&nbsp;BEST&nbsp;</a></li>
								<li><a onclick="placeList()" class="a1" target="ppp">&nbsp;LOCATION&nbsp;</a></li>
								<li><a onclick="genderList()" class="a1" target="ppp">&nbsp;GENDER&nbsp;</a></li>
								<li><a onclick="ageList()" class="a1" target="ppp">&nbsp;AGE&nbsp;</a></li>
							</ul>
						</li>
					</ul>
				</a>
				<div style="position: absolute;left: 70px;top:30px;">
					<c:choose>
						<c:when test="${sessionScope.id eq id && id ne null}">
							<a href="${pageContext.request.contextPath }/schedule/schedule.do" target="ppp" class="a2">일정등록&nbsp;</a>
						</c:when>
						<c:otherwise>
							<a onclick="goLoginForm()" target="ppp" class="a2">일정등록&nbsp;</a>
						</c:otherwise>
					</c:choose>
				</div>
			</td>
			<td align="center" style="width: 33%;">
				<a href="${pageContext.request.contextPath }/share/list.do" target="ppp" class="a2">
					<img src="${pageContext.request.contextPath}/resources/img/metos.png">
				</a>
			</td>
			<td class="dropdown" align="right" style="width: 33%;">
				<ul>
					<li style="list-style-type: none;">
						<a href="#" class="a2">
							<img src="${pageContext.request.contextPath}/resources/img/person.png" style="position: absolute;right: 10px; top: 15px;">
						</a>
						<ul style="text-align: right; padding-right: 10px; padding-top: 5px; padding-bottom: 5px;">
							<c:choose>
								<c:when test="${sessionScope.id eq id && id ne null}">
									<li><a onclick="logout()" class="a1">&nbsp;LOGOUT&nbsp;</a></li>
									<li><a onclick="goEditMember()" class="a1">&nbsp;MODIFY&nbsp;</a></li>
										<c:if test="${type eq 'm'}">
											<li><a href="${pageContext.request.contextPath }/admin/adminForm.do" class="a1" target="ppp">&nbsp;ADMIN&nbsp;</a></li>
										</c:if>
								</c:when>
								<c:otherwise>
									<li><a onclick="login()" class="a1">&nbsp;LOGIN&nbsp;</a></li>
									<li><a onclick="goJoin()" class="a1">&nbsp;SIGN UP&nbsp;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</li>
				</ul>
			</td>
		</tr>
	</table>
</div>
<div id="div4">
	<iframe name="ppp" frameborder="0" width="100%" height="800px;" src="${pageContext.request.contextPath }/share/list.do"></iframe>
</div>
</body>
</html>