<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
input[type="file"]{
  line-height: normal;
  width: 300px;
  height: 20px;
}
 INPUT[type="submit"]{
		width: 300px;
		height: 30px;
		font-size: 11pt;
		border: solid 2px;
		border-radius:7px;
		background-color:#1dabb8;
		text-align:center;
		color: #FFFFFF;
}

th{
 padding:5px;
}

td{
 padding:5px;
}

div.bodytable{
	margin: 50px;

}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="bodytable">
<form name="f" action="${pageContext.request.contextPath}/subplan/addphoto_ok.do?sub_num=${sub_num}" method="post" enctype="multipart/form-data">
	<table>
	<tr><th>사진 등록</th></tr>
	<tr><td><input type="file" name="imgfile"/></td></tr>
	<c:if test="${photo ne null }">
		<tr><td>
		<img src="${photo}" style="width:200px;height:200px"/>
		</td></tr>
	</c:if>
	<tr><td><input type="submit" value="확인" onclick="addOK(${sub_num})"></td></tr>
	</table>
</form>
</div>
</body>
</html>