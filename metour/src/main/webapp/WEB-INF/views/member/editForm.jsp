<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/editstyle.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<script type="text/javascript">
	function c() {
		history.back(-1);
	}
	function ok(){
		if(gongchk()){
			if(confirm("수정하시겠습니까?")==true){
				document.f.submit();
			   }else{
			      return;
			   }
		}
	}
	function out(){
		if(confirm("정말 탈퇴하시겠습니까?")==true){
			location.href = "${pageContext.request.contextPath }/member/out.do";
		   } else{
		      return;
		   }
	}
	function gongchk() {
	var flag=false;
	var pwd=document.f.pwd.value;
	var name=document.f.name.value;
	var birth=document.f.birth.value;
	var phone=document.f.phone.value;
	var pwd_chk=document.f.pwd_chk.value;
		if(pwd==""){
			alert("비밀번호를 입력해주세요");
			document.f.pwd.focus();
			return flag;
		}else if(pwd_chk==""){
			alert("비밀번호확인을 입력해주세요");
			document.f.pwd_chk.focus();
			return flag;
		}else if(!(pwd == pwd_chk)){
			alert("비밀번호가 다릅니다");
			return flag;
		}else if(name==""){
			alert("이름을 입력해주세요");
			document.f.name.focus();
			return flag;
		}else if(birth==""){
			alert("생년월일을 입력해주세요");
			document.f.birth.focus();
			return flag;
		}else if(phone==""){
			alert("전화번호을 입력해주세요");
			document.f.phone.focus();
			return flag;
		}else{
			flag = true;
			return flag;
		}
	}
	function pwdchk(){
		var params = "pwd="+document.f.pwd.value+"&pwd_chk="+document.f.pwd_chk.value;
		sendRequest("${pageContext.request.contextPath}/member/pwdCheck.do", params, pwdResult,'POST');
	}
	function pwdResult() {
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				flag=true;
				var str = httpRequest.responseText;
				var o = eval("("+str+")");
				var myDiv = document.getElementById("pwdcheckMsg");
				var html = "";
				if(o.flag){
					html = "비밀번호일치!";
				}
				else{
					html = "비밀번호불일치!";
				}
				myDiv.innerHTML = html;
			}
		}
	}
</script>
</head>
<body>
<div style="height: 100px"></div>
<div align="center">
<div style="background-color: #F7F7F7; width: 600px">
<form action="${pageContext.request.contextPath}/member/edit.do" method="post" name="f">
<br>
<div align="left" style="width: 380px; height: 40px; background-color: #FFFFFF; padding: 10px; border: 1px solid black; border-bottom-color: white">
<input type="text" name="id" style="height: 25px; width: 300px" value="${join.id}" readonly>
</div>
<div align="left" style="width: 380px; height: 40px; background-color: #FFFFFF; padding: 10px; border: 1px solid black; border-bottom-color: white">
<input type="password" name="pwd" style="height: 25px; width: 300px" placeholder="비밀번호">
<input type="password" name="pwd_chk" onkeyup="pwdchk()" placeholder="비밀번호확인" style="height: 25px; width: 200px">
<span id="pwdcheckMsg" style="color: red"></span>
</div>
<div align="left" style="width: 380px; height: 40px; background-color: #FFFFFF; padding: 10px; border: 1px solid black;border-bottom-color: white">
<input type="text" name="name" style="height: 25px; width: 300px" value="${join.name}">
</div>
<div align="left" style="width: 380px; height: 30px; background-color: #FFFFFF; padding: 10px; border: 1px solid black;border-bottom-color: white">
<input type="date" name="birth" style="height: 25px; width: 300px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" value="${join.birth }">
</div>
<div align="left" style="width: 380px; height: 40px; background-color: #FFFFFF; padding: 10px; border: 1px solid black;border-bottom-color: white">
<input type=text name="phone" style="height: 25px; width: 375px;" value="${join.phone }">
</div>
<div align="left" style="text-align:center; width: 100px; height: 35px; margin-top: 20px; margin-left:120px; color: white; font-size: 20px; background-color: #1fbc02; padding-top: 10px; float: left;">
<a onclick="ok()">수정</a>
</div>
<div align="left" style="text-align:center; width: 100px; height: 35px; margin-top: 20px; margin-left:20px; color: white; font-size: 20px; background-color: #1fbc02; padding-top: 10px; float: left;">
<a onclick="out()">탈퇴</a>
</div>
<div align="left" style="text-align:center; width: 100px; height: 35px; margin-top: 20px; margin-left:20px; color: white; font-size: 20px; background-color: #1fbc02; padding-top: 10px; float: left;">
<a onclick="c()">취소</a>
</div>
<div style="height:50px"></div>
<div style="height:50px"></div>
</form>
</div>
</div>

<%-- <form action="${pageContext.request.contextPath}/member/edit.do" name="f" method="POST">
<table>
<tr><th>id</th><td><input type="text" name="id" value="${join.id}" readonly></td></tr>
<tr><th>pwd</th><td><input type="text" name="pwd" value="${join.pwd}"></td></tr>
<tr><th>name</th><td><input type="text" name="name" value="${join.name}"></td></tr>
<tr><th>birth</th><td><input type="date" name="birth" value="${join.birth }"></td></tr>
<tr><th>tel</th><td><input type="text" name="tel" value="${join.tel }"></td></tr>
<tr><th>email</th><td><input type="text" name="email" value="${join.email }"></td></tr>
<tr><th>address</th><td><input type="text" name="address" value="${join.address }"></td></tr>
<tr><td colspan="3"><input type="button" value="수정" onclick="ok()"><input type="button" value="탈퇴" onclick="out()"><input type="button" value="취소" onclick="c()"> </td></tr>
</table>
</form> --%>

</body>
</html>