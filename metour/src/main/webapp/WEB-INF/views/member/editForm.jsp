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
<form action="${pageContext.request.contextPath}/member/edit.do" id="f" method="post" name="f">
<fieldset>
<table>
<tr><td colspan="3">
<h3>Edit Member</h3>
<br>
</td></tr>
<tr>
<td>
<input type="text" name="id" value="${join.id}" readonly="readonly">
</td>
</tr>
<tr>
<td>
<input type="password" name="pwd"  placeholder="비밀번호">
<input type="password" name="pwd_chk" onkeyup="pwdchk()" placeholder="비밀번호확인" >
<span id="pwdcheckMsg" style="color: red"></span>
</td>
</tr>
<tr>
<td>
<input type="text" name="name" value="${join.name}">
</td>
</tr>
<tr>
<td>
<input type="date" name="birth" value="${join.birth }">
</td>
</tr>
<tr>
<td>
<input type=text name="phone" value="${join.phone }">
</td>
</tr>
<tr>
<td>
<input type="button" onclick="ok()" value="수정">
<input type="button" onclick="out()" value="탈퇴">
<input type="button" onclick="c()" value="취소">
</td>
</tr>
</table>
</fieldset>
</form>


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