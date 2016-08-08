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
<meta charset="UTF-8">
<style type="text/css">
	a:link {text-decoration: none; color: #333333;}
	a:visited {text-decoration: none; color: #333333;}
	a:active {text-decoration: none; color: #333333;}
	a:hover {text-decoration: underline; color: #333333;}

	INPUT[type=text]{
		font-size: 12pt;
		border:1px;
		border-color: #808080;
		border-style: solid;
		background-color: #ffffff;
		width: 300px;
		font-family: 맑은 고딕;
	}
	table.ca{
		width: 100%;
		margin-top: 15px;
		text-align: center;
	}
	
	img {
		width: 100px;
		height: 100px;
	}
	
	img.search{
		width: 25px;
		height: 25px;
	}
	
	img.like{
		width: 20px;
		height: 20px;
	}
	
</style>
<title>:::ShareList:::</title>
</head>
<body style="font-family: 맑은 고딕;">
<table class="ca">
	<tr>
		<!-- <td><input type="button" value="전체보기" onclick="backList()"></td>
		<td><input type="button" value="베스트글보기" onclick="bestList()"></td>
		<td><input type="button" value="지역별보기" onclick="placeList()"></td>
		<td><input type="button" value="성별보기" onclick="genderList()"></td>
		<td><input type="button" value="연령대별보기" onclick="ageList()"></td> -->
		<td>
			<img src="${pageContext.request.contextPath}/resources/img/all01.png" onclick="backList()" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/all02.png'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/all01.png'">&nbsp;&nbsp;
			<img src="${pageContext.request.contextPath}/resources/img/best01.png" onclick="bestList()" onclick="backList()" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/best02.png'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/best01.png'">&nbsp;&nbsp;
			<img src="${pageContext.request.contextPath}/resources/img/map01.png" onclick="placeList()" onclick="backList()" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/map02.png'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/map01.png'">&nbsp;&nbsp;
			<img src="${pageContext.request.contextPath}/resources/img/gender01.png" onclick="genderList()" onclick="backList()" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/gender02.png'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/gender01.png'">&nbsp;&nbsp;
			<img src="${pageContext.request.contextPath}/resources/img/age01.png"  onclick="ageList()" onclick="backList()" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/age02.png'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/age01.png'">&nbsp;&nbsp;
		</td>
	</tr>
</table>
<br>

<form action="${pageContext.request.contextPath}/share/search.do" method="post" name="f ">
	<!-- <input type="text" name="search">
	<img class="search" src="/img/search.png" onclick="shareplanSearch()"> -->
	<!-- <table class="tabs" align="center">
		<tr>
			<td><input type="text" name="search"></td>
			<td>&nbsp;
				<img class="search" src="/img/search.png" onclick="shareplanSearch()">
			</td>			
		</tr>
	</table> -->
	<table class="tabs" align="center">
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
			<td>&nbsp;
				<img class="search" src="${pageContext.request.contextPath}/resources/img/search.png" onclick="search1()">
				<!-- <input type="button" value="검색" onclick="search1()"> -->
			</td>
		</tr>
	</table>
</form>
<br>
<table class="tabp" align="center" style="border-style: solid; border-width: 1px; border-color: #808080; border-collapse: collapse;">
	<c:forEach var="s" items="${list }">
		<tr class="tr1" style="border-collapse: collapse; width:500px; height: 500px; ">
			<td colspan="2" style="width:300px; border-style: solid; border-width: 1px; border-color: #808080; border-collapse: collapse;">
				<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">
				이미지
					<%-- <img src="/img/${s.photo}" align="middle" style="width: 500px; height: 500px;"> --%>
				</a>
			</td>
		</tr>
		<tr style="border-collapse: collapse; width: 500px; height: 50px;">
			<%-- <td>
				<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">${s.share_title}</a>
			</td>
			<td>${s.writer }</td>
			<td>${s.metoo }</td> --%>
			<td align="left" style="width:450px;  text-indent: 5px; font-size: 15px;">
				${s.share_title}
			</td>
			<td style="width:50px; font-size: 15px;">
				&nbsp;
				<img class="like" src="${pageContext.request.contextPath}/resources/img/like01.png">&nbsp;${s.metoo }
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>