<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
*,body{
 font-family: "맑은 고딕";
 margin:0px;
 padding:0px;
 font-size:14px;
}

table{
 border-collapse: collapse;
 margin-left:10px;
}

th{
 padding:5px;
}

td{
 padding:5px;
}

div.menu{
	margin:20px;
}

.menu a:link {color: #000000; font-size: 18px; }
.menu a:visited {text-decoration: none; color: #000000;}
.menu a:active {text-decoration: none; color: #000000;}
.menu a:hover {text-decoration: none; color: #1DABB9;}

a:link {color: #000000;}
a:visited {text-decoration: none; color: #000000;}
a:active {text-decoration: none; color: #000000;}
a:hover {text-decoration: none; color: #ffffff;}

</style>
<title>세부 계획 목록</title>
</head>

<body>
<div class="menu" align="center">

</div>

<div align="center">
<table style="width: 1000px;">
<tr>
<%-- <td><a href="${pageContext.request.contextPath}/schedule/schedule.do">날짜 선택 다시하기</a></td> --%>
<td style="text-align: right; padding-right: 10px;">일정등록<a href="${pageContext.request.contextPath}/subplan/add.do?main_num=${main_num}"><img src="${pageContext.request.contextPath}/resources/img/add_sub.png" style="width: 50px;"></a></td>
</tr>
</table>
<table>
	<tr>
		<td>
			<table border="1" style="width: 1000px;">
				<tr>
					<th style="width: 100px;">시간</th>	
					<th style="width: 350px;">제목</th>
					<th style="width: 250px;">장소</th>
					<th style="width: 100px;">미션</th>
					<th style="width: 100px;">미션성공</th>
					<th style="width: 100px;">사진 등록</th>
				</tr>
				<c:set var="rowCnt" value="0" />
				<c:forEach var="splist" items="${splist}">
				<c:set var="rowNum" value="${splist.row}"/>
				<tr>
					<th>${splist.time }</th>
					<c:choose>
					<c:when test="${splist.row eq 0 or splist.row eq 1 }">					
					<!-- 0, 1칸일때 -->						
						<td rowspan="${splist.row}"<c:if test="${splist.title ne ''}">style="background-color: #1ABC9C;" </c:if>>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/subplan/listview.do?sub_num=${splist.sub_num}">${splist.title}</a>&nbsp;&nbsp;</td>
						<td rowspan="${splist.row}"<c:if test="${splist.title ne ''}">style="background-color: #1ABC9C;" </c:if>>${splist.place }</td>
						<td rowspan="${splist.row}"<c:if test="${splist.title ne ''}">style="background-color: #1ABC9C;" </c:if>><c:if test="${splist.mission == 'g' }">명소 찾아가기</c:if><c:if test="${splist.mission == 'p'}">명소 사진찍기</c:if></td>
						<td rowspan="${splist.row}"<c:if test="${splist.title ne ''}">style="background-color: #1ABC9C;" </c:if>><c:if test="${splist.mission_yn == '0'}"></c:if><c:if test="${splist.mission_yn == '1'}">사진 완료 & GPS 실패</c:if>
						<c:if test="${splist.mission_yn == '2'}">성공</c:if><c:if test="${splist.mission_yn == '3'}">성공</c:if>
						</td>
						<td rowspan="${splist.row}"<c:if test="${splist.title ne ''}">style="background-color: #1ABC9C;" </c:if>> &nbsp;&nbsp;<c:if test="${splist.title ne ''}"><a href="${pageContext.request.contextPath}/subplan/addphoto.do?sub_num=${splist.sub_num}">사진등록</a></c:if>&nbsp;&nbsp;</td>
						<c:set var="rowCnt" value="0" />
					</c:when>
					<c:when test="${splist.row gt 1 }">
					<!--  1칸 이상일때 -->
						<%-- <c:choose> --%>
						<c:if test="${rowCnt eq 0}">
							<td rowspan="${splist.row}"<c:if test="${splist.title ne ''}">style="background-color: #1ABC9C;" </c:if>>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/subplan/listview.do?sub_num=${splist.sub_num}">${splist.title}</a>&nbsp;&nbsp;</td>
							<td rowspan="${splist.row}"<c:if test="${splist.title ne ''}">style="background-color: #1ABC9C;" </c:if>>${splist.place }</td>
							<td rowspan="${splist.row}"<c:if test="${splist.title ne ''}">style="background-color: #1ABC9C;" </c:if>><c:if test="${splist.mission == 'g' }">명소 찾아가기</c:if><c:if test="${splist.mission == 'p'}">명소 사진찍기</c:if></td>
							<td rowspan="${splist.row}"<c:if test="${splist.title ne ''}">style="background-color: #1ABC9C;" </c:if>><c:if test="${splist.mission_yn == '0'}"></c:if><c:if test="${splist.mission_yn == '1'}">사진 완료 & GPS 실패</c:if>
								<c:if test="${splist.mission_yn == '2'}">성공</c:if><c:if test="${splist.mission_yn == '3'}">성공</c:if>
							</td>
							<td rowspan="${splist.row}"<c:if test="${splist.title ne ''}">style="background-color: #1ABC9C;" </c:if>> &nbsp;&nbsp;<c:if test="${splist.title ne ''}"><a href="${pageContext.request.contextPath}/subplan/addphoto.do?sub_num=${splist.sub_num}">사진등록</a></c:if>&nbsp;&nbsp;</td>
							<c:set var="rowCnt" value="${rowCnt+1}" />
						</c:if>
						<c:if test="${rowCnt eq rowNum}">
							<c:set var="rowCnt" value="0" />
						</c:if>
						<c:if test="${rowCnt ne 0 and rowCnt ne rowNum }">
							<c:set var="rowCnt" value="${rowCnt+1}" />
						</c:if>
						<%-- </c:choose> --%>
					</c:when>
					</c:choose>					
				</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
</table>
</div>
</body>
</html>