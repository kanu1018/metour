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

	function metoo(share_num, type) {
		location.href = "${pageContext.request.contextPath }/metoo/metoo.do?share_num="+share_num+"&type="+type;
	}

	function focusOn(rep_num, content) {
		var text = document.getElementById("rep");
		text.value = content;
		text.focus();
		document.getElementById("add").value = '댓글수정';
		document.getElementById("f").action = '${pageContext.request.contextPath}/rep/edit.do?rep_num='+rep_num;
	}
	function repEdit(rep_num, share_num) {
		location.href = "${pageContext.request.contextPath }/rep/edit.do?rep_num="+rep_num+"&share_num="+share_num;
	}
	function repDel(rep_num, share_num) {
		location.href = "${pageContext.request.contextPath }/rep/del.do?rep_num="+rep_num+"&share_num="+share_num;
	}
	function singo() {
		/* if(type.equals("s")){
			newWindow = window.open("${pageContext.request.contextPath}/singo/popup.do?num="+num+"&type="+type, "newWindow", "height=200, width=400, resizable=yes");
		} else if(type.equals("r")){
			newWindow = window.open("${pageContext.request.contextPath}/singo/popup.do?num="+num+"&type="+type, "newWindow", "height=200, width=400, resizable=yes");
		} */
		newWindow = window.open("${pageContext.request.contextPath}/singo/popup.do", "newWindow", "height=800, width=800, resizable=yes");
	}
	function singoRep(num, kind) {
		document.fs.share_num.value = num;
		document.fs.singo_kind.value = kind;
		singo();
	}
</script>
<title>:::ShareView:::</title>
</head>
<body>
<table border="1">
	<tr>
		<th>share_num</th>
		<td>${s.share_num }</td>
		<th>writer</th>
		<td>${s.writer }</td>
	</tr>
	<tr>
		<th colspan="2">content</th>
		<td colspan="2">
			 <c:if test="${s.content ne null }">${s.content }</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4"><input type="text" id="metoo" value="${s.metoo }" readonly="readonly">
			<c:choose>
				<c:when test="${me.metoo_yn eq 'n'}">
					<input type="button" value="metoo" onclick="metoo(${s.share_num },1)" style="background-color: #B2EBF4;">
				</c:when>
				<c:when test="${me.metoo_yn eq 'y'}">
					<input type="button" value="metoo" onclick="metoo(${s.share_num },2)" style="background-color: #FFA7A7;">
				</c:when>
			</c:choose>
			<form action="${pageContext.request.contextPath}/singo" method="post" name="fs">
				<input type="hidden" name="share_num" value="${s.share_num }">
				<input type="hidden" name="singo_kind" value="s">
				<input type="button" value="신고11" onclick="singo()">
			</form>
		</td>
	</tr>
</table>
	<form action="${pageContext.request.contextPath}/rep/add.do" method="post" id="f">
	<input type="hidden" name="share_num" value="${s.share_num }">
	<table id="tab1">
		<tr>
			<td>
				<input type="text" id="rep" name="rep_content">
			</td>
			<td colspan="2">
				<input type="submit" id="add" value="댓글작성">
			</td>			
		</tr>
	</form>
	<c:forEach var="reps" items="${list }">
		<input type="hidden" name="share_num" value="${s.share_num }">
		<input type="hidden" name="rep_num" value="${reps.rep_num}">
		<tr>
			<td>${reps.rep_content }</td>
			<td>${reps.rep_writer }</td>
			<td>
				<input type="button" value="신고" onclick="singoRep(${reps.rep_num}, 'r')">
			</td>
			<c:forEach var="r" items="${r }">
				<c:if test="${reps.rep_num eq r.rep_num && reps.rep_writer eq r.rep_writer }">
					<td>
						<input type="button" value="수정" onclick="focusOn(${reps.rep_num}, '${reps.rep_content }', ${s.share_num })">
						<input type="button" value="삭제" onclick="repDel(${reps.rep_num}, ${s.share_num })">	
					</td>
				</c:if>
			</c:forEach>
		</tr>
	</c:forEach>
	</table>
</body>
</html>
