<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kitri.meto.subplan.SubPlanList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<% request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String time, sub_num, title, place, mission, mission_yn, row, llh_x, llh_y;
ArrayList<SubPlanList> splist = (ArrayList)request.getAttribute("splist"); %>

<subplans>
<% for(SubPlanList s : splist){
	time = s.getTime();
	sub_num = String.valueOf(s.getSub_num());
	title = s.getTitle();
	place = s.getPlace();
	mission = s.getMission();
	mission_yn = s.getMission_yn();
	row = String.valueOf(s.getRow());
	llh_x = s.getLlh_x();
	llh_y = s.getLlh_y();
	%>
	<subplan>
		<time><%=time %></time>
		<sub_num><%=sub_num %></sub_num>
		<title><%=title %></title>
		<place><%=place %></place>
		<mission><%=mission %></mission>
		<mission_yn><%=mission_yn %></mission_yn>
		<row><%=row %></row>
		<llh_x><%=llh_x %></llh_x>
		<llh_y><%=llh_y %></llh_y>
	</subplan>
<%}%>
</subplans>
