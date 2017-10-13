<%@page import="report.*" %>
<%@ page import="java.lang.*"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report On Allocated students' list</title>
</head>
<body>
<table>
<tr><th>Student Name</th></tr>
<%
Report r = new Report();
r.getConnection();
ResultSet rs = r.getReportOnRejectedStudentList();
while(rs.next())
{
	int studentId = rs.getInt(1);
	
	Report r1 = new Report();
	r1.getConnection();
	
	String studentName = r1.getStudentName(studentId);
	%>
	<tr><td><%= studentName %></td></tr>
	<% 
}
%>
</table>
</body>
</html>