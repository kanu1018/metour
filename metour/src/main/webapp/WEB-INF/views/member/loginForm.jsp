<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/loginstyle.css">
<script type="text/javascript">

	window.onload=function(){
		document.getElementById("id").focus();
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
	function b(){
		location.href="${pageContext.request.contextPath }/member/joinForm.do";
	}
	function c(){
		 window.history.back();
	}
	function hitEnterKey(e){
		  if(e.keyCode == 13){
		    document.getElementById("pwd").focus();
		  }else{
		   e.keyCode == 0;
		  return;
		  }
	} 
	
	function hitEnterKey1(e){
		  if(e.keyCode == 13){
			  a();
		  }else{
		   e.keyCode == 0;
		  return;
		  }
	} 
</script>
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/member/login.do" method="post" id="f" name="f">
<fieldset>
<table>
<tr><td colspan="3"><h3>login</h3></td></tr>
<tr><td colspan="3"><input type="text" id="id" name="id" placeholder="이메일" onkeypress="hitEnterKey(event)"></td></tr>
<tr><td colspan="3"><input type="password" id="pwd" name="pwd" placeholder="패스워드" onkeypress="hitEnterKey1(event)" ></td></tr>
<tr><td><input type="button" onclick="a()" value="로그인" style="margin-right: 8px"></td><td><input type="button" onclick="b()" value="회원가입" style="margin-right: 8px"></td><td><input type="button" onclick="c()" value="취소" style="margin-right: 8px"></td></tr>

</table>
</fieldset>
</form>
</body>
</html>