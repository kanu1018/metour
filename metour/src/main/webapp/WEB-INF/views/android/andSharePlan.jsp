<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kitri.meto.JoinDTO.JoinDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int sNum, sWriter, sPointNum, sMetoo, sPoint;
	String sTitle, sLoc, sId;
	JoinDTO s = (JoinDTO)request.getAttribute("s");
	
%>

<shareplans>
	<%
		sNum = s.getShare_num();
		sTitle = s.getShare_title();
		sWriter = s.getWriter();
		sLoc = s.getLocation();
		sMetoo = s.getMetoo();
		sPointNum = s.getPoint_num();
		sId = s.getId();
		sPoint = s.getPoint();
	%>
	<shareplan>
		<sNum><%=sNum %></sNum>
		<sTitle><%=sTitle %></sTitle>
		<sWriter><%=sWriter %></sWriter>
		<sLoc><%=sLoc %></sLoc>
		<sMetoo><%=sMetoo %></sMetoo>
		<sPointNum><%=sPointNum %></sPointNum>
		<sId><%=sId %></sId >	
		<sPoint><%=sPoint %></sPoint>	
	</shareplan>
</shareplans>
