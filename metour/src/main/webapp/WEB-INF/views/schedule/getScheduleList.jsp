<%@page import="com.kitri.meto.schedule.Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<schedules>
	<c:forEach items="${schedules}" var="s">
			<schedule>
				<main_num>${s.main_num}</main_num>
				<main_title>${s.main_title}</main_title>
				<main_writer>${s.main_writer}</main_writer>
				<point_num>${s.point_num}</point_num>
				<year>${s.year}</year>
				<month>${s.month}</month>
				<day>${s.day}</day>
			</schedule>
		</c:forEach>
</schedules>