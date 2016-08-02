<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="com.kitri.meto.schedule.Schedule"%>
<%@page import="com.kitri.meto.schedule.isDate"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
int action = 0; //up(1) down(0)
int currYear = 0;
int currMonth = 0;

Calendar c = Calendar.getInstance();
Calendar cal = Calendar.getInstance();

if(request.getParameter("action") == null) {
    
     currMonth = c.get(Calendar.MONTH);
     currYear = c.get(Calendar.YEAR);
     cal.set(currYear,currMonth,1);
    
} else {
    
     if(request.getParameter("action") != null){
         
          currMonth = Integer.parseInt(request.getParameter("month"));
          currYear = Integer.parseInt(request.getParameter("year"));
         
          if(Integer.parseInt(request.getParameter("action"))==1) {

               cal.set(currYear, currMonth, 1);
               cal.add(Calendar.MONTH, 1); //다음달
               currMonth = cal.get(Calendar.MONTH);
               currYear = cal.get(Calendar.YEAR);
              
          } else {              
               cal.set(currYear, currMonth, 1);
               cal.add(Calendar.MONTH, -1); //이전달
               currMonth = cal.get(Calendar.MONTH);
               currYear = cal.get(Calendar.YEAR);         
          }
         
     }
}
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Calendar</title>


<style> 
    #calendarTable, #calendarTable th, #calendarTable td{
        border-collapse: collapse;             
    } 
    #calendarTable {
        border:2px solid #000;
        width:519px;
    }
    
    #calendarTable th, #calendarTable td {
        width: 70px;
        border:1px solid #000;        
        border-collapse: collapse;
        padding: 5px;        
    }
   
    #calendarTable th {        
        background-color: #666;
        color: #ffffff;  
    }    
    #calendarTable td {        
        height: 70px;
        text-align : left;            
    }
    #calendarTable td.empty {
        background-color: #DFDCD8;
    }  
    #calendarTable td.toDayColor {
        background-color: #6C7EAA;
    }  
</style>
</head>
<body bgcolor='white'>

<table border='0' width='521' celpadding='0' cellspacing='0'>
  <tr>
     <td width='150' align='right' valign='middle'>
         <a href="${pageContext.request.contextPath }/schedule.do?month=${Month}&year=${Year}&action=0">
             <font size="2">이전달</font>
         </a>
     </td>
     <td width='260' align='center' valign='middle'>
         <b>${Year}년 ${Month+1}월</b>
     </td>
     <td width='173' align='left' valign='middle'>
         <a href="${pageContext.request.contextPath }/schedule.do?month=${Month}&year=${Year}&action=1">
             <font size="2">다음달</font>
         </a>
    </td>
  </tr>
</table>
<table>
  <tr>         
  <td width="100%" >
    <table id="calendarTable">
	<tr>
              <th>일</th>
              <th>월</th>
              <th>화</th>
              <th>수</th>
              <th>목</th>
              <th>금</th>
              <th>토</th>                      
       </tr>
	<c:forEach items="${DayFlag}" var="d">
			<c:if test="${((d.index+1) mod 7) eq 1 }">
				<tr>
			</c:if>
				<c:if test="${DOW gt d.week_num}">
					<td class="empty">&nbsp;</td>
				</c:if>	
				<c:if test="${DOW le d.week_num}">
					<c:if test="${d.flag ne 0}">
						<c:if test="${d.flag eq 2}">
							<td class="toDayColor">${d.day}</td>
						</c:if>
						<c:if test="${d.flag eq 1}">
							<td>${d.day}</td>
						</c:if>
					</c:if>
					<c:if test="${d.flag eq 0}">
					<td class="empty">&nbsp;</td>
					</c:if>
				</c:if>
			<c:if test="${((d.index+1) mod 7) eq 0 }">
				</tr>
			</c:if>
	</c:forEach>
</table>
     </td>
     </tr>
  </table>


  
${Year} ${Month}<br>
<c:forEach items="${schedules}" var="s">
${s.main_title} ${s.main_writer} ${s.year} ${s.month} ${s.day}<br>
</c:forEach>
 
  
</body>
</html>