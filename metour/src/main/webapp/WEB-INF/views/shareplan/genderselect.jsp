<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function genderM(){
		var url = "${pageContext.request.contextPath}/share/genderlist.do?gender=m";
		   window.opener.location.href = url;
		   window.close();
	}
	function genderF(){
		var url = "${pageContext.request.contextPath}/share/genderlist.do?gender=f";
		   window.opener.location.href = url;
		   window.close();
	}

</script>
<style type="text/css">
*,body{
 font-family: "맑은 고딕";
 margin-top:20px;
 padding:0px;
}

 INPUT[type="button"]{
		height: 30px;
		border: solid 2px;
		border-radius:7px;
		background-color:#1ABC9C;
		text-align:center;
		color: #FFFFFF;
		width: 100px;
}

</style>
<title>::GENDER SELECT::</title>
</head>
<body>
<div align="center">
<h3>검색하고 싶은 성별을 선택하세요.</h3>
<input type="button" value="남자" onclick="genderM()">&nbsp;&nbsp;&nbsp;<input type="button" value="여자" onclick="genderF()">
</div>
</body>
</html>