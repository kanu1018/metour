<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kitri.meto.shareplan.SharePlan2" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
	int sNum, sWriter, sPoint, sMetoo;
	String sTitle, sLoc,sId,sPhoto;
	ArrayList<SharePlan2> dtoL = (ArrayList)request.getAttribute("s");

	%>
	   
<shareplans>
	
	<%
	for(SharePlan2 s : dtoL){
		sNum = s.getShare_num();
		sTitle = s.getShare_title();
		sWriter = s.getWriter();
		sLoc = s.getLocation();
		sMetoo = s.getMetoo();
		sPoint = s.getPoint_num();
		sId = s.getId();
		sPhoto = s.getSub_num();
	%>
	<shareplan>
		<sNum><%=sNum %></sNum>
		<sTitle><%=sTitle %></sTitle>
		<sWriter><%=sWriter %></sWriter>
		<sLoc><%=sLoc %></sLoc>
		<sMetoo><%=sMetoo %></sMetoo>
		<sPoint><%=sPoint %></sPoint>
			<sId><%=sId%></sId>
			<sPhoto><%=sPhoto%></sPhoto>
	</shareplan>
	<%} %>
	

	
</shareplans>
