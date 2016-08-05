<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/pwdchstyle.css">
<script type="text/javascript">
	function back() {
		    window.history.back();
	}
	function a(){
		var id=document.f.id.value;
		var pwd=document.f.pwd.value;
		if(id==""){
			alert("ID를 입력해주세요");
			return;
		}else if(pwd==""){
			alert("PWD를 입력해주세요");
			return;
		}else{
			document.f.submit();	
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/member/pwdchk_ok.do" method="post" id="f" name="f">
<fieldset>
<table>
<tr><td colspan="2"><h3>Password Check</h3></td></tr>
<tr><td colspan="2"><input type="text" id="id" name="id" value="${sessionScope.id } "readonly="readonly"></td></tr>
<tr><td colspan="2"><input type="password" id="pwd" name="pwd" placeholder="패스워드"></td></tr>
<tr><td><input type="button" value="확인" onclick="a()"/>
<input type="button" value="취소" onclick="back()"/></td></tr>
</table>
</fieldset>
</form>
</body>
</html>