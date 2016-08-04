<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
<script type="text/javascript">
	var flag=false;
	function idCheck() {
		var params = "id1="+document.f.id1.value+"&id2="+document.f.id2.value+"&email="+document.f.email.value;
		sendRequest("${pageContext.request.contextPath}/member/idCheck.do", params, checkResult,'POST');
	}
	function checkResult() {
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				flag=true;
				var str = httpRequest.responseText;
				var o = eval("("+str+")");
				var myDiv = document.getElementById("checkMsg");
				var html = "";
				var id1=document.f.id1.value;
				var id2=document.f.id2.value;
				if(id1==""){
					alert("아이디를 입력해주세요");
				}else if(id2==""){
					alert("도메인을 입력해주세요");
				}
				else{
					if(o.flag){
						html = "사용가능한아이디";
					}
					else{
						html = "사용불가능한아이디";
					}
					myDiv.innerHTML = html;
				}
			}
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
	function join() {
		var id1=document.f.id1.value;
		var id2=document.f.id2.value;
		var pwd=document.f.pwd.value;
		var pwdch = document.f.pwd_chk.value;
		var name=document.f.name.value;
		var birth=document.f.birth.value;
		var phone=document.f.phone.value;
		
		if(id1==""){
			alert("id를 입력해주세요");
			document.f.id1.focus();
			return;
		}else if(id2==""){
			alert("도메인값 입력해주세요");
			document.f.id2.focus();
			return;
		}else if(pwd==""){
			alert("비밀번호를 입력해주세요");
			document.f.pwd.focus();
			return;
		}else if(pwdch==""){
			alert("비밀번호확인을 입력해주세요");
			document.f.pwd_chk.focus();
			return;
		}else if(name==""){
			alert("이름을 입력해주세요");
			document.f.name.focus();
			return;
		}else if(birth==""){
			alert("생년월일을 입력해주세요");
			document.f.birth.focus();
			return;
		}else if(phone==""){
			alert("전화번호을 입력해주세요");
			document.f.phone.focus();
			return;
		}else if(document.f.gender[0].checked == false && document.f.gender[1].checked == false){
			 var num_temp = document.f.gender.length; 
			 for (i=0;i<num_temp ;i++) { 
			  if (document.f.gender[i].checked == true) { 
			  	break; 
			  }
			 }
			 if (i == num_temp) 
			 { 
			  alert("성별을 선택하세요"); 
			  return;
			 }
			}
		if(flag){
			document.f.submit();
		}else{
			alert("중복체크를 해주십시오.");
		}
	}
	function select() {
		var email = document.f.email.value;
		if(email){
			document.getElementById("id2").value = email;
			if(email==" "){
				document.getElementById("id2").value = "";
			}
		}else{
			document.getElementById("selbox").style.visibility = "hidden";
			document.getElementById("id2").value = "";
			document.getElementById("id2").readOnly = false;
		}
	}
</script>
</head>
<body>
<div style="height: 100px"></div>
<div align="center">
<div style="background-color: #F7F7F7; width: 600px">
<form action="${pageContext.request.contextPath}/member/join.do" method="post" name="f">
<br>
<h1 align="center"><a href="${pageContext.request.contextPath}/" style="width: 400px; font-size: 25px;text-decoration:none;">Oops</a></h1>
<br>
<div align="left" style="width: 380px; height: 40px; background-color: #FFFFFF; padding: 10px; border: 1px solid black; border-bottom-color: white">
<input type="text" name="id1" id="id1" placeholder="이메일형식 ID" align="left">@
<input type="text" name="id2" id="id2" align="left" readonly="readonly">
<select name="email" onclick="select()" id="selbox">
	<option value=" ">이메일선택</option>
    <option value="naver.com">naver.com</option>
    <option value="google.com">google.com</option>
    <option value="daum.net">daum.net</option>
    <option value="daeyang.com">daeyang.com</option>
    <option value="">직접쓰기</option>
</select>
<a onclick="idCheck()" style="height: 30px; width: 80px; background-color: #F7F7F7;">중복체크</a><br>
<span id="checkMsg" style="color: red"></span>
</div>
<div align="left" style="width: 380px; height: 40px; background-color: #FFFFFF; padding: 10px; border: 1px solid black; border-bottom-color: white">
<input type="password" name="pwd" placeholder="비밀번호" style="height: 25px; width: 200px">
<input type="password" name="pwd_chk" onkeyup="pwdchk()" placeholder="비밀번호확인" style="height: 25px; width: 200px">
<span id="pwdcheckMsg" style="color: red"></span>
</div>
<div align="left" style="width: 380px; height: 40px; background-color: #FFFFFF; padding: 10px; border: 1px solid black;border-bottom-color: white">
<input type="text" name="name" placeholder="이름" style="height: 25px; width: 300px">
</div>
<div align="left" style="width: 380px; height: 30px; background-color: #FFFFFF; padding: 10px; border: 1px solid black;border-bottom-color: white">
<input type="date" name="birth" placeholder="생일" style="height: 25px; width: 300px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
</div>
<div align="left" style="width: 380px; height: 40px; background-color: #FFFFFF; padding: 10px; border: 1px solid black;border-bottom-color: white">
<input type=text name="phone" placeholder="전화번호" style="height: 25px; width: 375px;">
</div>
<div align="left" style="width: 380px; height: 40px; background-color: #FFFFFF; padding: 10px; border: 1px solid black;border-bottom-color: white">
<input type="radio" name="gender" value="m">남
<input type="radio" name="gender" value="f">여
</div>
<div align="center" style="width: 400px; height: 35px; margin-top: 20px; color: white; font-size: 20px; background-color: #1fbc02; padding-top: 15px"><a onclick="join()">가입하기</a></div>
<div style="height:50px"></div>
</form>
</div>
</div>
</body>
</html>