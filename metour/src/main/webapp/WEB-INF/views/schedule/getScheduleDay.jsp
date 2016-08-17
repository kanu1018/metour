<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kitri.meto.schedule.Schedule" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<% request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
ArrayList<Schedule> times = (ArrayList)request.getAttribute("times");%>
<times>
<% for(Schedule time : times){
	%>
	<time>
	<main_date><%=time.getMain_date() %></main_date>
	<main_num><%=time.getMain_num() %></main_num>
	<main_title><%=time.getMain_title() %></main_title>
	<main_writer><%=time.getMain_writer() %></main_writer>
	</time>
<%}%>
</times>
