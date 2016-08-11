<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kitri.meto.member.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int mNum;
	String mId, mPwd, mName, mPhone, mGender, mBirth, mStatus;
	Member m = (Member)request.getAttribute("m");
	
%>

<members>
	<%
		mNum = m.getMem_num();
		mId = m.getId();
		mName = m.getName();
		mPhone = m.getPhone();
		mGender = m.getGender();
		mBirth = m.getBirth();
		mStatus = m.getMem_status();
	%>
	<member>
		<mNum><%=mNum %></mNum>
		<mId><%=mId %></mId>
		<mName><%=mName %></mName>
		<mPhone><%=mPhone %></mPhone>
		<mGender><%=mGender %></mGender>
		<mBirth><%=mBirth %></mBirth>
		<mStatus><%=mStatus %></mStatus>
	</member>
</members>
