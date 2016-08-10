<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kitri.meto.metoo.Metoo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int meNum, meShare, meMem;
	String meYn;
	Metoo me = (Metoo)request.getAttribute("me");
	
%>

<metoos>
	<%
		meNum = me.getMetoo_num();
		meShare = me.getShare_num();
		meMem = me.getMem_num();
		meYn = me.getMetoo_yn();
	%>
	<metoo>
		<meNum><%=meNum %></meNum>
		<meShare><%=meShare %></meShare>
		<meMem><%=meMem %></meMem>
		<meYn><%=meYn %></meYn>
	</metoo>
</metoos>
