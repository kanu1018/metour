<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kitri.meto.rep.Rep" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int rNum, rWriter, rShare;
	String rContent;
	ArrayList<Rep> list = (ArrayList)request.getAttribute("list");
	
%>

<reps>
	<%
		for(Rep dto : list){
			rNum = dto.getRep_num();
			rContent = dto.getRep_content();
			rWriter = dto.getRep_writer();
			rShare = dto.getShare_num();
	%>
	<rep>
		<rNum><%=rNum %></rNum>
		<rContent><%=rContent %></rContent>
		<rWriter><%=rWriter %></rWriter>
		<rShare><%=rShare %></rShare>
	</rep>
	<%}%>
</reps>
