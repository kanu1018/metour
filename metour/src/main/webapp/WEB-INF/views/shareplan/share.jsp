<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>

<script type="text/javascript">
	function share(elClicked) {
		// 에디터의 내용을 에디터 생성시에 사용했던 textarea에 넣어 줍니다.
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		frm.submit();
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	} 
</script>
<meta charset="UTF-8">
<title>:::SHARE:::</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/share/add.do"  method="post" id="frm">
	<input type="hidden" name="share_title" value="${j.main_title }">
    <textarea name="content" id="content" rows="10" cols="300" style="width:766px; height:412px;">
    	<table border="1">
    		<c:if test="${j ne null }">
    			<tr>
	    			<th>main_title</th>
	    			<td colspan="2">${j.main_title }</td>
	    			<th>point</th>
	    			<td colspan="3">${j.point }</td>
    			</tr>
    		</c:if>
    		<c:forEach var="s" items="${s}">
    			<tr>
    				<th>start_time</th>
    				<td colspan="2">${s.start_time}</td>
    				<th>end_time</th>
    				<td colspan="3">${s.end_time }</td>
    			</tr>
				<tr style="height: 150px">
    				<th>sub_title</th>
    				<td colspan="2">${s.sub_title }</td>
    				<th>place</th>
    				<td>${s.place}</td>
    				<td rowspan="2" style="width: 150px; height: 150px">${s.photo }</td>
    			</tr>
    		</c:forEach>
    	</table>
    </textarea>
    <input type="button" id="savebutton" value="공유하기" onclick="share(this)"/>
    <%-- <input type="hidden" name="writer" value=" ${sessionScope.id }" >  --%>
    <%-- <input type="hidden" name="writer" value="1" >--%>
    <input type="hidden" name="point_num" value="<c:if test='${j ne null }'>${j.point_num }</c:if>" /> 
</form>
    <script type="text/javascript">
		 	var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "content",
				//SmartEditor2Skin.html 파일이 존재하는 경로
				sSkinURI: "${pageContext.request.contextPath}/resources/smarteditor/SmartEditor2Skin.html",	
				 htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : false,				
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : false,		
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : false,			
					fOnBeforeUnload : function(){
						
					}
				}, 
				fOnAppLoad : function(){
				}, 
				fCreator: "createSEditor2"
			}); 
	</script>
</body>
</html>