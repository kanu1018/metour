<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
	var newWindow;
	
	function goLoginForm(){
		if(confirm("로그인이 필요한 서비스 입니다. \n로그인 하시겠습니까?")==true){
			location.href = "${pageContext.request.contextPath}/member/loginForm.do"
		}else{
			return;
		}
	}
</script>
<style type="text/css">
	table, tr, th, td{
		border-collapse: collapse;
		border: 1px;
		border-color: #808080;
		border-style: solid;
	}
	table {
		width: 650px;
		text-align: center;
	}
	img {
		width: 25px;
		height: 25px;
	}
	INPUT[type="button"]{
		width: 50px;
		height: 30px;
		font-size: 11pt;
		border: solid 2px;
		border-radius:7px;
		background-color:#1ABC9C;
		text-align:center;
		color: #FFFFFF;
	} 
	INPUT[type="submit"]{
		width: 110px;
		height: 30px;
		font-size: 11pt;
		border: solid 2px;
		border-radius:7px;
		background-color:#1ABC9C;
		text-align:center;
		color: #FFFFFF;
	} 
 	#tab1 table, tr, th, td{
		border-collapse: collapse;
		border: 0px;
		border-color: #808080;
		border-style: solid;
	} 
</style>
<title>:::ShareView:::</title>
</head>
<body>
<div align="center">
<table>
	<tr>
		<td colspan="4">
			 <c:if test="${s.content ne null }">${s.content }</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4" style="height: 30px; text-align: left; text-indent: 10px;">
			${s.id }
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:left; text-indent: 5px; height: 30px;">
			<img src="${pageContext.request.contextPath}/resources/img/like02.png" onclick="goLoginForm()">&nbsp;
			${s.metoo }&nbsp;
			<img src="${pageContext.request.contextPath}/resources/img/bubble01.png">&nbsp;
			${rCnt }
		</td>
		<td colspan="2" align="right">
			<img src="${pageContext.request.contextPath}/resources/img/singo02.png" onclick="goLoginForm()">&nbsp;
		</td>
	</tr>
</table>
<table id="tab1" style="width: 650px;">
	<tr>
		<td colspan="2" style="width: 600px; height: 40px;">
			<input type="text" id="rep" name="rep_content" style="width: 95%; height: 20px;">
		</td>
		<td colspan="2" style="width: 50px; text-align: right;">
			<input type="button" id="add" value="등록" onclick="goLoginForm()">
		</td>			
	</tr>
</table>

<table style="width: 650px;">
	<c:forEach var="reps" items="${list }">
		<input type="hidden" name="share_num" value="${s.share_num }">
		<input type="hidden" name="rep_num" value="${reps.rep_num}">
		<tr>
			<th style="width: 50px; height: 40px;">&nbsp;&nbsp;${reps.id}</th>
			<td style="width:450px; height: 40px; text-align: left; text-indent: 10px;">${reps.rep_content }</td>
		</tr>
	</c:forEach>
</table>
</div>
</body>
</html>
