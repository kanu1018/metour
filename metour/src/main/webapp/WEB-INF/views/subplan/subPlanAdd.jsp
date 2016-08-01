<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function subPlanAdd(){
		var tmp = 0;
		for(i = 0; i < document.f.start_ampm.length; i++){
			if(document.f.start_ampm[i].checked){
				tmp++;
			}
		}
		var tmp2 = 0;
		for(i = 0; i < document.f.end_ampm.length; i++){
			if(document.f.end_ampm[i].checked){
				tmp2++;
			}
		}
		
		if(document.f.sub_title.value == ""){
			alert("제목을 입력해주세요.");
			document.f.sub_title.focus();
		}else if(tmp == 0){
			alert("오전/오후를 선택해주세요.");
			document.f.start_ampm.focus();
		}else if(tmp2 == 0){
			alert("오전/오후를 선택해주세요.");
			document.f.end_ampm.focus();
		}else if((document.f.start_time.value == document.f.end_time.value) && (document.f.start_ampm.value == document.f.end_ampm.value)){
			alert("시작시간과 종료시간이 같습니다. 다시 설정해주세요!");
			document.f.end_time.focus();
		}else if(document.f.place.value == ""){
			alert("장소를 입력해주세요.");
			document.f.place.focus();
		}else{
			document.f.submit();
		}
		
		
	}
	
	function subPlanCancel(){
		if(confirm("이전페이지로 돌아가시겠습니까?") == true){
			location.href="${pageContext.request.contextPath}/subplan/list.do";
		} else{
			if(confirm("입력된 정보를 모두 삭제하시겠습니까?") == true){
				document.f.sub_title.value = "";
				document.f.place.value = "";
				document.f.memo.value = "";
				for(i = 0; i < document.f.start_ampm.length; i++){
					if(document.f.start_ampm[i].checked){
						document.f.start_ampm[i].checked = false;
					}
				}
				for(i = 0; i < document.f.end_ampm.length; i++){
					if(document.f.end_ampm[i].checked){
						document.f.end_ampm[i].checked = false;
					}
				}
				
			} else{
				return;
			}
		}
	}
</script>
<title>세부 계획 등록</title>
</head>
<body>
<h3>세부 계획 등록</h3>
<form action="${pageContext.request.contextPath}/subplan/addok.do" name="f" method="post" >
<input type="hidden" name="llh_x" value="1"/>
<input type="hidden" name="llh_y" value="1"/>
<input type="hidden" name="main_num" value="1"/>
<input type="hidden" name="mission_yn" value="0"/>

	<table border="1">
		<tr>
			<th>제목</th>
			<td colspan="3"><input type="text" name="sub_title"/></td>
		</tr>
		<tr>
			<th>시작시간</th>
			<td>
				<input type="radio" name="start_ampm" value="am">오전
				<input type="radio" name="start_ampm" value="pm">오후
				<select name="start_time">
					<option value="12:00">12:00</option>
					<option value="12:30">12:30</option>
				    <option value="01:00">1:00</option>
				    <option value="01:30">1:30</option>
				    <option value="02:00">2:00</option>
				    <option value="02:30">2:30</option>
				    <option value="03:00">3:00</option>
				    <option value="03:30">3:30</option>
				    <option value="04:00">4:00</option>
				    <option value="04:30">4:30</option>
				    <option value="05:00">5:00</option>
				    <option value="05:30">5:30</option>
				    <option value="06:00">6:00</option>
				    <option value="06:30">6:30</option>
				    <option value="07:00">7:00</option>
				    <option value="07:30">7:30</option>
				    <option value="08:00">8:00</option>
				    <option value="08:30">8:30</option>
				    <option value="09:00">9:00</option>
				    <option value="09:30">9:30</option>
				    <option value="10:00">10:00</option>
				    <option value="10:30">10:30</option>
				    <option value="11:00">11:00</option>
				    <option value="11:30">11:30</option>
				</select> ~ </td>
			<th>종료시간</th>
			<td>
				<input type="radio" name="end_ampm" value="am">오전
				<input type="radio" name="end_ampm" value="pm">오후
				<select name="end_time">
					<option value="12:00">12:00</option>
					<option value="12:30">12:30</option>
				    <option value="01:00">1:00</option>
				    <option value="01:30">1:30</option>
				    <option value="02:00">2:00</option>
				    <option value="02:30">2:30</option>
				    <option value="03:00">3:00</option>
				    <option value="03:30">3:30</option>
				    <option value="04:00">4:00</option>
				    <option value="04:30">4:30</option>
				    <option value="05:00">5:00</option>
				    <option value="05:30">5:30</option>
				    <option value="06:00">6:00</option>
				    <option value="06:30">6:30</option>
				    <option value="07:00">7:00</option>
				    <option value="07:30">7:30</option>
				    <option value="08:00">8:00</option>
				    <option value="08:30">8:30</option>
				    <option value="09:00">9:00</option>
				    <option value="09:30">9:30</option>
				    <option value="10:00">10:00</option>
				    <option value="10:30">10:30</option>
				    <option value="11:00">11:00</option>
				    <option value="11:30">11:30</option>
				</select></td>
		</tr>
		<tr>
			<th colspan="1">장소검색</th>
			<td colspan="3"><input type="text" name="place"><input type="button" value="돋보기이미지"/></td>
		</tr>
		<tr>
			<th colspan="1">미션</th>
			<td colspan="3">
				<select name="mission">
					<option value="g" >장소 찾아가기</option>
					<option value="p" >사진 찍기</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>설명</th>
			<td colspan="3"><textarea name="memo"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="등록" onclick="subPlanAdd()"/></td>
			<td colspan="2"><input type="button" value="취소" onclick="subPlanCancel()"/></td>
		</tr>
	</table>
	
	
</form>
</body>
</html>