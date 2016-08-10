<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kitri.meto.subplan.SubPlan" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<% request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
SubPlan subplan = (SubPlan)request.getAttribute("subplan"); %>

<subplan>
	<sub_num><%=subplan.getSub_num() %></sub_num>
	<sub_title><%=subplan.getSub_title() %></sub_title>
	<start_time><%=subplan.getStart_time() %></start_time>
	<end_time><%=subplan.getEnd_time() %></end_time>
	<place><%=subplan.getPlace() %></place>
	<llh_x><%=subplan.getLlh_x() %></llh_x>
	<llh_y><%=subplan.getLlh_y() %></llh_y>
	<mission><%=subplan.getMission() %></mission>
	<memo><%=subplan.getMemo() %></memo>
	<mission_yn><%=subplan.getMission_yn() %></mission_yn>
	<photo><%=subplan.getPhoto() %></photo>
	<main_num><%=subplan.getMain_num() %></main_num>
</subplan>
