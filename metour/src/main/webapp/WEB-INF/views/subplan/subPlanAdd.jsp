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
table, tr, th, td{
 border-collapse: collapse;
/*   border: 1px;
 border-color: #808080;
 border-style: solid;  */
}

table{
	width: 500px;
}

th{
 text-indent: 5px;
 width: 50px;
}

td{
 text-indent: 5px;
 text-align: center;
 height: 50px;
}

input[type="text"]{
  line-height: normal;
  width: 350px;
  height: 30px;
}

 INPUT[type="button"]{
		width: 200px;
		height: 30px;
		font-size: 11pt;
		border: solid 2px;
		border-radius:7px;
		background-color:#1ABC9C;
		text-align:center;
		color: #FFFFFF;
} 
select {
	width: 100px;
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
    newWindow = window.open("${pageContext.request.contextPath}/subplan/place.do", "newWindow", "height=800, width=800, resizable=yes");        
}

/* --------------add kimdaeyang-------------------*/
var time_index = "<c:out value='${index}'/>";
	function subPlanAdd(){
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
	
	function subPlanCancel(num){
		if(confirm("이전페이지로 돌아가시겠습니까?") == true){
			location.href="${pageContext.request.contextPath}/subplan/list.do?main_num="+num;
		} else{
			if(confirm("입력된 정보를 모두 삭제하시겠습니까?") == true){
				document.f.sub_title.value = "";
				document.f.place.value = "";
				document.f.memo.value = "";				
			} else{
				return;
			}
		}
	}
	
	function timeSet(){
		var time = document.f.start_time.value;
		var time_hour = time.substring(0,2);
		var time_mi = time.substring(3,5);
		
		if(time_hour == 24){
			document.f.end_time.value = "01:" + time_mi;
		}else if(time_hour == 12){
			document.f.end_time.value = "13:" + time_mi;
		}else if(time_hour > 0 && time_hour < 9){
			var tmp = time_hour*1 + 1;
			document.f.end_time.value = "0" + tmp + ":" + time_mi;
		}else {
			var tmp = time_hour*1 + 1;
			document.f.end_time.value = tmp + ":" + time_mi;
		}
		
		//종료시간이 시작시간보다 빠를때 처리아직 못함.
		/* var sel_obj = document.getElementById("end_time");
		for(var i = sel_obj.selectedIndex; i >= 0 ; i--){
			sel_obj.remove(sel_obj.i);
		} */
	}
	
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
	}
	function addphoto() {
		location.href="${pageContext.request.contextPath}/subplan/addphoto.do";
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
			timeSet();
		} else if(a==c){
			if(b>d){
				alert("시간이 선택이 잘못되었습니다. 다시 선택하세요.");
				timeSet();
			}
		}
	}
</script>
<title>세부 계획 등록</title>
</head>
<body>
<div class="bodytable" align="center">
<form action="${pageContext.request.contextPath}/subplan/addok.do" name="f" method="post" >

<input type="hidden" name="llh_x" />
<input type="hidden" name="llh_y" />
<input type="hidden" name="main_num" value="${main_num}"/>
<input type="hidden" name="mission_yn" value="0"/>

	<table>
		<tr>
			<th colspan="4" style="height: 70px; text-align: left; text-indent: 20px; font-size: 20px;">일정</th>
		</tr>
		<tr>
			<td colspan="4" style="height: 50px; text-align: left; text-indent: 20px;">세부 일정을 등록하세요.</td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="text" name="sub_title" placeholder="일정을 입력하세요." style="width: 95%;"/></td>
		</tr>
		<tr>
			<th colspan="4" style="text-indent: 20px; text-align: left; width: 250px;">
				시작
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				종료
			</th>
		</tr>
		<tr>
			<td colspan="4" style="text-align: left; text-indent: 20px;">
				<select name="start_time"onchange="timeSet()" style="width: 200px; height: 30px;">
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
				<select name="end_time" onchange="duple()" style="width: 200px; height: 30px;">
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
				</select>
			</td>
		</tr>
		<tr>
			<th><img src="${pageContext.request.contextPath}/resources/img/map01.png"></th>
			<td colspan="2">
				<%-- <img src="${pageContext.request.contextPath}/resources/img/map01.png">&nbsp; --%>
				<input type="text" name="place" style="width: 85%;" placeholder="장소">&nbsp;&nbsp;
				<img class="search" src="${pageContext.request.contextPath}/resources/img/search.png" onclick="openNewWindow()">
				<!-- <input type="button" value="돋보기" onclick="openNewWindow()" style="width: 50px;"/> -->
			</td>
		</tr>
		<tr>
			<th><img src="${pageContext.request.contextPath}/resources/img/mission.png"></th>
			<td colspan="2">
				<%-- <img src="${pageContext.request.contextPath}/resources/img/mission.png">&nbsp; --%>
				<select name="mission" style="width: 95%;">
					<option value="n" >미션 선택안함</option>
					<option value="g" >명소 찾아가기</option>
					<option value="p" >명소 사진찍기</option>
				</select>
			</td>
		</tr>
		<tr>
			<th><img src="${pageContext.request.contextPath}/resources/img/memo.png"></th>
			<td colspan="2">
				<%-- <img src="${pageContext.request.contextPath}/resources/img/memo.png">&nbsp; --%>
				<textarea name="memo" style="width: 95%; height: 100px;" placeholder="메모"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="등록" onclick="subPlanAdd()"/>&nbsp;
				<input type="button" value="취소" onclick="subPlanCancel(${main_num})"/>
			</td>
		</tr>
	</table>
	
	
</form>
</div>
</body>
</html>