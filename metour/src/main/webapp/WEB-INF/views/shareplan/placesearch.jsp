<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function placeSearch(){
		var url = "${pageContext.request.contextPath}/share/placelist.do?place="+document.getElementById("place").value;
		window.opener.location.href = url;
		window.close();
	}
	
	function hitEnterKey(e){
		  if(e.keyCode == 13){
			  placeSearch();
		  }else{
		   	e.keyCode == 0;
		  return;
		  }
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
		width: 50px;
}
input[type="text"]{
  line-height: normal;
  width: 250px;
  height: 30px;
}

</style>
<title>::PLACE SEARCH::</title>
</head>
<body>
<div align="center">
<h3>검색하고 싶은 장소를 검색하세요.</h3>
<table>
	<tr>
		<td><input type="text" id="place" placeholder="장소를 입력하세요." onkeypress="hitEnterKey(event)"></td>
		<td><input type="button" value="검색" onclick="placeSearch()"></td>
	</tr>
</table>
</div>
</body>
</html>