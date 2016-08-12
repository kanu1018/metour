<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function main(){
		location.href="${pageContext.request.contextPath}/member/main.do";
	}
</script>
<style type="text/css">
	INPUT[type=submit]{
		border-style: none;
		background-color: transparent;
		width: 500px;
		height: 500px;
		position: fixed;left: 35%;top: 30%;
	}
	
	#div1{
		width: 100%;
		height: 100%;
		position: absolute;
	}	
	#div2{
		width: 100%;
		height: 100%;
		position: absolute;
	}	
	
	#div1 img {
		width: 100%;
		height: 100%;
		position: absolute;
	}
	
	#div2 img {
		width: 100%;
		height: 100%;
		position: absolute;
	}
	
	#div1 > #i1 {
		opacity: 0;
		transition: opacity 1s;
	}
	#div1:hover > #i1 {
		opacity: 1;
	}
	
	
</style>
<title>:::HOME:::</title>
</head>
<body>
<div id="div1">
	<img id="i1" src="${pageContext.request.contextPath}/resources/img/main03.jpg">
	<img id="i2" src="${pageContext.request.contextPath}/resources/img/main03.jpg">
</div>
<div id="div2">
	<img src="${pageContext.request.contextPath}/resources/img/main03.jpg" onclick="main()" onmouseover="this.src='${pageContext.request.contextPath}/resources/img/main03.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/resources/img/main03.jpg'">
</div>

</body>
</html>