<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.a1:link {text-decoration: none; color: #FFFFFF; background-color: #282832;}
	.a1:visited {text-decoration: none; color: #FFFFFF; background-color: #282832;}
	.a1:active {text-decoration: none; color: #FFFFFF; background-color: #282832;}
	.a1:hover {text-decoration: none; color: #FFFFFF; background-color: #282832;}
	
	.a2:link {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}
	.a2:visited {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}
	.a2:active {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}
	.a2:hover {text-decoration: none; color: #FFFFFF; background-color: #1ABC9C;}
	
	div.menubar {
		height: 30px;
		width: 100%; 
		background-color: #1ABC9C; 
		text-align: right; 
		color: #ffffff;
	}
	.menubar li ul {
		background: rgb(109,109,109);
		display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
		height:auto;
		padding:0px;
		margin:0px;
		border:0px;
		position:relative;
		width:200px;
		z-index:200;
		list-style-type: none;
		float: right;
	}
	.menubar li:hover ul {
		display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
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
function goJoin() {
	location.href="${pageContext.request.contextPath }/member/joinForm.do";
}

</script>
<title>:::Include:::</title>
</head>
<body>
<div class="menubar" align="right">
	<ul>
		<li><a href="#" class="a2">user</a>
			<ul>
				<c:choose>
					<c:when test="${sessionScope.id eq id && id ne null}">
						<li><a onclick="logout()" class="a1">로그아웃&nbsp;</a></li>
						<li><a onclick="goEditMember()" class="a1">회원정보수정&nbsp;</a></li>
							<c:if test="${type eq 'm'}">
								<li><a onclick="goAdminPage()" class="a1">관리자페이지&nbsp;</a></li>
							</c:if>
					</c:when>
					<c:otherwise>
						<li><a onclick="login()" class="a1">로그인&nbsp;</a></li>
						<li><a onclick="goJoin()" class="a1">회원가입&nbsp;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</li>
	</ul>
	<%-- <c:choose>
		<c:when test="${sessionScope.id eq id && id ne null}">
			<a onclick="logout()" class="a1">로그아웃&nbsp;</a>
			<a onclick="goEditMember()" class="a1">회원정보수정&nbsp;</a>
				<c:if test="${type eq 'm'}">
				<a onclick="goAdminPage()" class="a1">관리자페이지&nbsp;</a>
				</c:if>
		</c:when>
		<c:otherwise>
			<a onclick="login()" class="a1">로그인&nbsp;</a>
			<a onclick="goJoin()" class="a1">회원가입&nbsp;</a>
		</c:otherwise>
	</c:choose> --%>
</div>
<br>
</body>
</html>