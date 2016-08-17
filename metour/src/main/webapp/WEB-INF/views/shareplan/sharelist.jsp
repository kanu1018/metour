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
<br>
<div align="center">
	<form method="post" name="f ">
		<table class="tabs" align="center" style="width: 400px;">
			<tr>
				<td style="height: 40px; padding-left: 5px; padding-right: 5px;" align="center">
					<select id="search_box">
						<option value="1">제목</option>
						<option value="2">작성자</option>
						<option value="3">글번호</option>
					</select>
				</td>
				<td style="height: 40px; padding-left: 5px; padding-right: 5px;" align="center">
					<input type="text" id="searchText" onkeypress="if(event.keyCode==13) {search1();}else{return showKeyCode(event)}">
				</td>
				<td style="height: 40px; padding-left: 5px; padding-right: 5px;" align="center">
					<img class="search" src="${pageContext.request.contextPath}/resources/img/search.png" onclick="search1()">
					<!-- <input type="button" value="검색" onclick="search1()"> -->
				</td>
			</tr>
		</table>
	</form>
</div>
<br>
<div align="center">
<div class="container">
<c:forEach var="s" items="${list }">
  <span class="row" style="height: 350px;">
    <span class="col-sm-3" style="width: 380px; ">
      <div class="panel panel-primary" style="width: 320px; border-width: 0px; border-style: none; border-color: #ffffff;">
        <div class="panel-heading" style="background-color: #ffffff; border-width: 1px; border-style: solid; border-color: #808080; padding-left: 7px;">
       		<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">
				<img src="${s.share_photo}" style="width: 300px; height: 300px;">
			</a><br>
       </div>
       <div class="panel-body" style="width: 320px; background-color: #ffffff; border-width: 1px; border-style: solid; border-top-color: #ffffff; border-left-color: #808080; border-right-color: #808080; border-bottom-color: #808080; ">
        	<table>
        		<tr>
        			<td style="width:160px; text-align: left; text-indent: 5px;">
        				<a href="${pageContext.request.contextPath}/share/view.do?share_num=${s.share_num }">${s.share_title}</a>
        			</td>
        			<td style=" width:160px; text-align: right; text-indent: 5px;">
        				<img class="like" src="${pageContext.request.contextPath}/resources/img/like01.png">&nbsp;${s.metoo }
        			</td>
        		</tr>
        	</table>
       </div>
      </div>
    </span>
  </span>
  </c:forEach>
</div>
</div>
</body>
</html>