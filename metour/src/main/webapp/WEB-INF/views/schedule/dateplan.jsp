<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<table border='0' width='330' cellpadding='0' cellspacing='0'>
  <tr>
     <td width='90' align='center' valign='middle'>
         <a href="${pageContext.request.contextPath}/schedule/dateplan.do?year=${L_Year}&month=${L_Month}&day=${L_Day}">
             <font size="2">${L_Month}월 ${L_Day}일</font>
         </a>
     </td>
     <td width='130' align='center' valign='middle'> 
			     
         <b>${Year}년 ${Month}월 ${Day}일</b>
     </td>
     <td width='90'align='center' valign='middle'>
         <a href="${pageContext.request.contextPath}/schedule/dateplan.do?year=${N_Year}&month=${N_Month}&day=${N_Day}">
             <font size="2">${N_Month}월 ${N_Day}일</font>
         </a>
    </td>
  </tr>
</table>

</body>
</html>