<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kitri.meto.subplan.SubPlanList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<% request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
ArrayList<Integer> flag = (ArrayList)request.getAttribute("index"); %>

<flags>
<% for(int i : flag){
	%>
	<flag><%=i %></flag>
<%}%>
</flags>
