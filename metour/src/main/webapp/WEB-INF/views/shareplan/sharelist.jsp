<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
	
	table.tabs {
		border: 1px;
		border-color: #1ABC9C;
		border-style: solid;
		width: 430px;
		padding: 5px;
	}
	
/* 	.navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    footer {
    	text-align: left;
    	background-color: #ffffff;
    	padding: 25px;
    } */

</style>
<title>:::ShareList:::</title>
</head>
<body style="font-family: 맑은 고딕;">
<%-- <table class="ca">
	<tr>
		<td>
			<img src="${pageContext.request.contextPath}/resources/img/all01.png" onclick="backList()" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/all02.png'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/all01.png'">&nbsp;&nbsp;
			<img src="${pageContext.request.contextPath}/resources/img/best01.png" onclick="bestList()" onclick="backList()" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/best02.png'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/best01.png'">&nbsp;&nbsp;
			<img src="${pageContext.request.contextPath}/resources/img/map01.png" onclick="placeList()" onclick="backList()" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/map02.png'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/map01.png'">&nbsp;&nbsp;
			<img src="${pageContext.request.contextPath}/resources/img/gender01.png" onclick="genderList()" onclick="backList()" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/gender02.png'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/gender01.png'">&nbsp;&nbsp;
			<img src="${pageContext.request.contextPath}/resources/img/age01.png"  onclick="ageList()" onclick="backList()" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/age02.png'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/age01.png'">&nbsp;&nbsp;
		</td>
	</tr>
</table> --%>
<br>
<div align="center">
	<form method="post" name="f ">
		<table class="tabs" align="center" style="width: 400px; ">
			<tr>
				<td style="height: 30px; padding-left: 5px; padding-right: 5px;" align="center">
					<select id="search_box">
						<option value="1">제목</option>
						<option value="2">작성자</option>
						<option value="3">글번호</option>
					</select>
				</td>
				<td style="height: 30px; padding-left: 5px; padding-right: 5px;" align="center">
					<input type="text" id="searchText" onkeypress="if(event.keyCode==13) {search1();}else{return showKeyCode(event)}">
				</td>
				<td style="height: 30px; padding-left: 5px; padding-right: 5px;" align="center">
					<img class="search" src="${pageContext.request.contextPath}/resources/img/search.png" onclick="search1()">
					<!-- <input type="button" value="검색" onclick="search1()"> -->
				</td>
			</tr>
		</table>
	</form>
</div>
<br>
<%-- <table class="tabp" align="center" style="border-style: solid; border-width: 1px; border-color: #808080; border-collapse: collapse;">
	<c:forEach var="s" items="${list }">
		<tr class="tr1" style="border-collapse: collapse; width:500px; height: 500px; ">
			<td colspan="2" style="width:300px; border-style: solid; border-width: 1px; border-color: #808080; border-collapse: collapse;">
				<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">
				이미지
					<img src="/img/${s.photo}" align="middle" style="width: 500px; height: 500px;">
				</a>
			</td>
		</tr>
		<tr style="border-collapse: collapse; width: 500px; height: 50px;">
			<td>
				<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">${s.share_title}</a>
			</td>
			<td>${s.writer }</td>
			<td>${s.metoo }</td>
			<td align="left" style="width:450px;  text-indent: 5px; font-size: 15px;">
				${s.share_title}
			</td>
			<td style="width:50px; font-size: 15px;">
				&nbsp;
				<img class="like" src="${pageContext.request.contextPath}/resources/img/like01.png">&nbsp;${s.metoo }
			</td>
		</tr>
	</c:forEach>
</table> --%>
<div align="center">
<%-- <table>
<c:set var="j" value="0"/>
<c:set var="row" value="0"/>
	<c:forEach begin="0" end="${cnt }" var="s" items="${list }">
		<tr>	
			<c:forEach begin="1" end="3">
				<c:if test="${j eq 2 or row eq 1}">
					<td style="width: 300px; height: 300px;">
						<c:forEach var="s" items="${list }">
							<table class="tabp" align="center" style="border-style: solid; border-width: 1px; border-color: #808080; border-collapse: collapse;">
								<tr class="tr1" style="border-collapse: collapse; width:300px; height: 300px; ">
									<td colspan="2" style="width:300px; border-style: solid; border-width: 1px; border-color: #808080; border-collapse: collapse;">
										<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">
											<img src="${s.photo}" align="middle" style="width: 300px; height: 300px;">
										</a>
									</td>
								</tr>
								<tr style="border-collapse: collapse; width: 300px; height: 50px;">
									<td>
										<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">${s.share_title}</a>
									</td>
									<td style="width:50px; font-size: 15px;">
										&nbsp;
										<img class="like" src="${pageContext.request.contextPath}/resources/img/like01.png">&nbsp;${s.metoo }
									</td>
								</tr>
							</table>
						</c:forEach>
					</td>
					<c:set var="row" value="0"/>
				</c:if>
			</c:forEach>
				<c:if test="${j le 3}">
					<c:set var="j" value="${j+1}" />
				</c:if>
				<c:if test="${j eq 3}">
				<c:set var="row" value="1"/>
					<c:set var="j" value="0" />
				</c:if>
		</tr>
	</c:forEach>
</table> --%>
<%-- <table>
	<c:forEach begin="0" end="${cnt }" varStatus="i" var="s" items="${list }">
		<tr>
			<c:forEach begin="0" end="2" varStatus="j">
				<c:if test="${i.index mod 3 eq j.index }">
				<td style="width: 300px; height: 300px;">
					<table class="tabp" align="center" style="border-style: solid; border-width: 1px; border-color: #808080; border-collapse: collapse;">
								<tr class="tr1" style="border-collapse: collapse; width:300px; height: 300px; ">
									<td colspan="2" style="width:300px; border-style: solid; border-width: 1px; border-color: #808080; border-collapse: collapse;">
										<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">
											<img src="${s.share_photo}" align="middle" style="width: 300px; height: 300px;">
										</a>
									</td>
								</tr>
								<tr style="border-collapse: collapse; width: 300px; height: 50px;">
									<td>
										<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">${s.share_title}</a>
									</td>
									<td style="width:50px; font-size: 15px;">
										&nbsp;
										<img class="like" src="${pageContext.request.contextPath}/resources/img/like01.png">&nbsp;${s.metoo }
									</td>
								</tr>
							</table>
				</td>
				</c:if>
			</c:forEach>
		</tr>
	</c:forEach>
</table> --%>
<div class="container">
<c:forEach var="s" items="${list }">
  <span class="row" style="height: 350px;">
    <span class="col-sm-3" style="width: 300px; ">
      <div class="panel panel-primary">
        <div class="panel-heading" style="background-color: #ffffff; border-style: none; border: 0px; border-color: #ffffff;">
       		<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">
				<img src="${s.share_photo}" align="middle" style="width: 300px; height: 300px;">
			</a><br>
			<%-- <a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">${s.share_title}</a>&nbsp;
        	<img class="like" src="${pageContext.request.contextPath}/resources/img/like01.png">&nbsp;${s.metoo } --%>
       </div>
       <div class="panel-body" style="background-color: #ffffff; border-style: none; border: 0px;">
       		<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">${s.share_title}</a>&nbsp;
        	<img class="like" src="${pageContext.request.contextPath}/resources/img/like01.png">&nbsp;${s.metoo }
       </div>
      </div>
    </span>
  </span>
  </c:forEach>
</div>
</div>
</body>
</html>