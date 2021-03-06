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
caption{
background: url(images/title_event.png) no-repeat center center;
 width:700px;
 height:50px;
}
caption span{
 display:none;
}
table{
 border-collapse: collapse;
 width: 500px;
}

th{
 padding:5px;
}

td{
 padding:5px;
}

input[type="text"]{
  line-height: normal;
  width: 430px;
  height: 30px;
}
input[type="file"]{
  line-height: normal;
  width: 430px;
  height: 30px;
}


 INPUT[type="button"]{
		width: 155px;
		height: 30px;
		font-size: 11pt;
		border: solid 2px;
		border-radius:7px;
		background-color:#1ABC9C;
		text-align:center;
		color: #FFFFFF;
} 
select {
	width:120px;
	height: 30px;
    position: relative;
    border: 1px solid #E9DDDD;
}

div.bodytable{
	margin: 50px;

}
/*  IE 10, 11의 네이티브 화살표 숨기기 */
select::-ms-expand { 
  display: none;
} 
img.search{
		width: 20px;
		height: 20px;
	}
img {
	width: 30px;
	height: 30px;

}

</style>
<script type="text/javascript">
var newWindow;

function openNewWindow(){
    newWindow = window.open("${pageContext.request.contextPath}/subplan/place.do", "newWindow", "height=800, width=1200, resizable=yes");        
}

/* --------------add kimdaeyang-------------------*/

var start_time = "<c:out value='${subplan.start_time}'/>";
var end_time = "<c:out value='${subplan.end_time}'/>";
var mission = "<c:out value='${subplan.mission}'/>";
var time_index = "<c:out value='${index}'/>";
	
	window.onload = function(){
		var t_index = time_index.substring(1, time_index.length-1);
		var index = t_index.split(", ");
		
		var sel_obj = document.getElementsByName("start_time")[0];
		var sel_obj2 = document.getElementsByName("end_time")[0];
		var j=-1;
		for(var i = 0 ; i < index.length; i++){
			j++;
			if(index[i] == 0){
				sel_obj.remove(j);
				sel_obj2.remove(j);
				j=j-1;
			}
		}
		
		document.f.start_time.value = start_time;
		document.f.end_time.value = end_time;
		document.f.mission.value = mission;
	}
	
	function subplanEdit(){
		if(document.f.sub_title.value == ""){
			alert("제목을 입력해주세요.");
			document.f.sub_title.focus();
		}else if(document.f.start_time.value == document.f.end_time.value){
			alert("시작시간과 종료시간이 같습니다. 다시 설정해주세요!");
			document.f.end_time.focus();
		}else if(document.f.place.value == ""){
			alert("장소를 입력해주세요.");
			document.f.place.focus();
		}else{
			document.f.submit();
		}
	}
	
	function editCancel(num){
		if(confirm("이전페이지로 돌아가시겠습니까?") == true){
			location.href="${pageContext.request.contextPath}/subplan/list.do?main_num="+num;
		} else{
			return;
		}
	}
	
	function subplanDel(num,mainnum){
		if(confirm("계획을 삭제하시겠습니까?") == true){
			location.href="${pageContext.request.contextPath}/subplan/del.do?subnum="+num+"&mainnum="+mainnum;
		} else{
			return;
		}
	}
	
function duple() {
		
		var sel_obj = document.getElementsByName("start_time")[0];
		var sel_obj1 = document.getElementsByName("end_time")[0];
		var val;
		var val1;
		for (i = 0; i < sel_obj.options.length; i++) {
			if (sel_obj.options[i].selected == true) {
				val = sel_obj.options[i].value;
				break;
			}
		}
		for (i = 0; i < sel_obj1.options.length; i++) {
			if (sel_obj1.options[i].selected == true) {
				val1 = sel_obj1.options[i].value;
				break;
			}
		}
		var spilt1 = val.split(":");
		var spilt2 = val1.split(":");
		var a = parseInt(spilt1[0]);
		var b = parseInt(spilt1[1]);
		var c = parseInt(spilt2[0]);
		var d = parseInt(spilt2[1]);
		if(a>c){
			alert("시간이 선택이 잘못되었습니다. 다시 선택하세요.");
		} else if(a==c){
			if(b>d){
				alert("시간이 선택이 잘못되었습니다. 다시 선택하세요.");
			}
		}
	}
</script>

<title>세부 계획 상세보기</title>
</head>
<body>
<div class="bodytable" align="center">
<form action="${pageContext.request.contextPath}/subplan/edit.do" name="f" method="post" enctype="multipart/form-data">
<input type="hidden" name="llh_x" value="${subplan.llh_x}"/>
<input type="hidden" name="llh_y" value="${subplan.llh_y}"/>
<input type="hidden" name="main_num" value="${subplan.main_num}"/>
<input type="hidden" name="mission_yn" value="${subplan.mission_yn}"/>
<input type="hidden" name="sub_num" value="${subplan.sub_num}"/>
	<table>
		<tr>
			<th colspan="4" style="height: 50px; text-align: left; text-indent: 20px; font-size: 20px;">일정 수정</th>
		</tr>
		<tr>
			<td colspan="4" style="height: 50px; text-align: left; text-indent: 20px;">세부 일정을 수정 및 삭제하세요.</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><input type="text" name="sub_title" value="${subplan.sub_title}"/></td>
		</tr>
		<tr>
			<th colspan="4" style="text-indent: 10px; text-align: left; width: 250px;">
				시작
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				종료
			</th>
		</tr>
		<tr>
			<td colspan="4" style="text-align: left; text-indent: 20px;">
				<select name="start_time"onchange="timeSet()" style="width: 210px; height: 30px;">
					<option value="00:00">오전 12:00</option>
					<option value="00:30">오전 12:30</option>
				    <option value="01:00">오전 1:00</option>
				    <option value="01:30">오전 1:30</option>
				    <option value="02:00">오전 2:00</option>
				    <option value="02:30">오전 2:30</option>
				    <option value="03:00">오전 3:00</option>
				    <option value="03:30">오전 3:30</option>
				    <option value="04:00">오전 4:00</option>
				    <option value="04:30">오전 4:30</option>
				    <option value="05:00">오전 5:00</option>
				    <option value="05:30">오전 5:30</option>
				    <option value="06:00">오전 6:00</option>
				    <option value="06:30">오전 6:30</option>
				    <option value="07:00">오전 7:00</option>
				    <option value="07:30">오전 7:30</option>
				    <option value="08:00">오전 8:00</option>
				    <option value="08:30">오전 8:30</option>
				    <option value="09:00">오전 9:00</option>
				    <option value="09:30">오전 9:30</option>
				    <option value="10:00">오전 10:00</option>
				    <option value="10:30">오전 10:30</option>
				    <option value="11:00">오전 11:00</option>
				    <option value="11:30">오전 11:30</option>
				    <option value="12:00">오후 12:00</option>
					<option value="12:30">오후 12:30</option>
				    <option value="13:00">오후 1:00</option>
				    <option value="13:30">오후 1:30</option>
				    <option value="14:00">오후 2:00</option>
				    <option value="14:30">오후 2:30</option>
				    <option value="15:00">오후 3:00</option>
				    <option value="15:30">오후 3:30</option>
				    <option value="16:00">오후 4:00</option>
				    <option value="16:30">오후 4:30</option>
				    <option value="17:00">오후 5:00</option>
				    <option value="17:30">오후 5:30</option>
				    <option value="18:00">오후 6:00</option>
				    <option value="18:30">오후 6:30</option>
				    <option value="19:00">오후 7:00</option>
				    <option value="19:30">오후 7:30</option>
				    <option value="20:00">오후 8:00</option>
				    <option value="20:30">오후 8:30</option>
				    <option value="21:00">오후 9:00</option>
				    <option value="21:30">오후 9:30</option>
				    <option value="22:00">오후 10:00</option>
				    <option value="22:30">오후 10:30</option>
				    <option value="23:00">오후 11:00</option>
				    <option value="23:30">오후 11:30</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="end_time" onchange="duple()" style="width: 210px; height: 30px;">
					<option value="00:00">오전 12:00</option>
					<option value="00:30">오전 12:30</option>
				    <option value="01:00">오전 1:00</option>
				    <option value="01:30">오전 1:30</option>
				    <option value="02:00">오전 2:00</option>
				    <option value="02:30">오전 2:30</option>
				    <option value="03:00">오전 3:00</option>
				    <option value="03:30">오전 3:30</option>
				    <option value="04:00">오전 4:00</option>
				    <option value="04:30">오전 4:30</option>
				    <option value="05:00">오전 5:00</option>
				    <option value="05:30">오전 5:30</option>
				    <option value="06:00">오전 6:00</option>
				    <option value="06:30">오전 6:30</option>
				    <option value="07:00">오전 7:00</option>
				    <option value="07:30">오전 7:30</option>
				    <option value="08:00">오전 8:00</option>
				    <option value="08:30">오전 8:30</option>
				    <option value="09:00">오전 9:00</option>
				    <option value="09:30">오전 9:30</option>
				    <option value="10:00">오전 10:00</option>
				    <option value="10:30">오전 10:30</option>
				    <option value="11:00">오전 11:00</option>
				    <option value="11:30">오전 11:30</option>
				    <option value="12:00">오후 12:00</option>
					<option value="12:30">오후 12:30</option>
				    <option value="13:00">오후 1:00</option>
				    <option value="13:30">오후 1:30</option>
				    <option value="14:00">오후 2:00</option>
				    <option value="14:30">오후 2:30</option>
				    <option value="15:00">오후 3:00</option>
				    <option value="15:30">오후 3:30</option>
				    <option value="16:00">오후 4:00</option>
				    <option value="16:30">오후 4:30</option>
				    <option value="17:00">오후 5:00</option>
				    <option value="17:30">오후 5:30</option>
				    <option value="18:00">오후 6:00</option>
				    <option value="18:30">오후 6:30</option>
				    <option value="19:00">오후 7:00</option>
				    <option value="19:30">오후 7:30</option>
				    <option value="20:00">오후 8:00</option>
				    <option value="20:30">오후 8:30</option>
				    <option value="21:00">오후 9:00</option>
				    <option value="21:30">오후 9:30</option>
				    <option value="22:00">오후 10:00</option>
				    <option value="22:30">오후 10:30</option>
				    <option value="23:00">오후 11:00</option>
				    <option value="23:30">오후 11:30</option>
			</select></td>
		</tr>
		<tr>
			<th><img src="${pageContext.request.contextPath}/resources/img/map01.png"></th>
			<td colspan="2">
				<input type="text" name="place" value="${subplan.place}" style="width: 85%;"/>
				<img class="search" src="${pageContext.request.contextPath}/resources/img/search.png" onclick="openNewWindow()">
			</td>
		</tr>
		<tr>
			<th><img src="${pageContext.request.contextPath}/resources/img/mission.png"></th>
			<td colspan="2">
				<select name="mission" style="width: 95%;">
						<option value="n" >미션 선택안함</option>
						<option value="g">명소 찾아가기</option>
						<option value="p">명소 사진찍기</option>
				</select>
			</td>
		</tr>
		<c:if test="${photo ne null }">
		<tr>
			<td colspan="4"><img src="${photo}" style="width:200px;height:200px"/></td>
		</tr>
		</c:if>
		<tr>
			<th><img src="${pageContext.request.contextPath}/resources/img/add_img.png"></th>
			<td colspan="3"><input type="file" value="카메라이미지" name="imgfile"></td>
		</tr>
		<tr>
			<th><img src="${pageContext.request.contextPath}/resources/img/memo.png"></th>
			<td colspan="2">
				<textarea name="memo" style="width: 95%; height: 100px;">${subplan.memo}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="수정" onclick="subplanEdit()">
				<input type="button" value="취소" onclick="editCancel(${subplan.main_num})">
				<input type="button" value="삭제" onclick="subplanDel(${subplan.sub_num}, ${subplan.main_num})">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>