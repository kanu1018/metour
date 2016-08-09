<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kitri.meto.shareplan.SharePlan" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int sNum, sWriter, sPoint, sMetoo;
	String sTitle, sLoc;
	SharePlan s = (SharePlan)request.getAttribute("s");
	
%>

<shareplans>
	<%
		sNum = s.getShare_num();
		sTitle = s.getShare_title();
		sWriter = s.getWriter();
		sLoc = s.getLocation();
		sMetoo = s.getMetoo();
		sPoint = s.getPoint_num();
	%>
	<shareplan>
		<sNum><%=sNum %></sNum>
		<sTitle><%=sTitle %></sTitle>
		<sWriter><%=sWriter %></sWriter>
		<sLoc><%=sLoc %></sLoc>
		<sMetoo><%=sMetoo %></sMetoo>
		<sPoint><%=sPoint %></sPoint>
	</shareplan>
</shareplans>
