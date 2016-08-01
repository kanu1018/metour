<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="text/javascript">

	window.onload=function(){
		document.getElementById("id").focus();
	}
	
	function a(){
		document.f.submit();
	}
	function b(){
		location.href="${pageContext.request.contextPath }/member/joinForm.do";
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
<form action="${pageContext.request.contextPath}/member/login.do" method="post" name="f">
<p><input type="text" id="id" name="id" placeholder="아이디" onkeypress="hitEnterKey(event)" ><br>
<input type="text" id="pwd" name="pwd" placeholder="패스워드" onkeypress="hitEnterKey1(event)" ></p>
<a onclick="a()">로그인&nbsp;</a> <a onclick="b()">&nbsp;회원가입</a></p>

</form>
</body>
</html>