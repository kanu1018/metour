<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kitri.meto.shareplan.SharePlan" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int sNum, sWriter, sPoint;
	String stitle, sCont, sLoc, sMetoo;
	ArrayList<SharePlan> list = (ArrayList)request.getAttribute("list");
	
%>

<shareplans>
<%
	for(SharePlan dto : list){
		sNum = dto.getShare_num();
		stitle = dto.getShare_title();
		sCont = dto.getContent();
		sWriter = dto.getWriter();
		sLoc = dto.getLocation();
		sMetoo = dto.getMetoo();
		sPoint = dto.getPoint_num();
		%>
	<shareplan>
		<sNum><%=sNum %></sNum>
		<stitle><%=stitle %></stitle>
		<sCont><%=sCont %></sCont>
		<sWriter><%=sWriter %></sWriter>
		<sLoc><%=sLoc %></sLoc>
		<sMetoo><%=sMetoo %></sMetoo>
		<sPoint><%=sPoint %></sPoint>
	</shareplan>
	<%}%>
</shareplans>
