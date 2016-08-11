<%@page import="com.kitri.meto.schedule.Schedule"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>


			<schedule>
				<main_num>${schedule.main_num}</main_num>
				<main_title>${schedule.main_title}</main_title>
				<main_writer>${schedule.main_writer}</main_writer>
				<point_num>${schedule.point_num}</point_num>
				<year>${schedule.year}</year>
				<month>${schedule.month}</month>
				<day>${schedule.day}</day>
			</schedule>
