<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/subplan/addphoto_ok.do?sub_num=${sub_num}" method="post" enctype="multipart/form-data">
	<%-- sub_num : <input type="text" name="sub_num" value="${sub_num}"/><br/> --%>
	사진파일 : <input type="file" name="imgfile"/><br/>
	<c:if test="${photo ne null }">
		<img src="${photo}" style="width:200px;height:200px"/>
	</c:if>
	<input type="submit" value="확인">
</form>
</body>
</html>