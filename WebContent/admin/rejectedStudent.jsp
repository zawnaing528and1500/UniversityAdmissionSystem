<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="allocate.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rejected Students</title>
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
<style>
table{border-spacing:8px;border-collapse:separate;}
td{padding:6px;}
</style>
</head>
<body class="size-1140">
<br>
<br>
<br>
<div class="line">
<br>
<center>
<table bgcolor="white" class="tablev1">
<tr><th><font color="chocolate" size="3px">Number</font></th><th><font color="chocolate" size="3px">Student Name</font></th><th><font color="chocolate" size="3px">Total Mark</font></th><th><font color="chocolate" size="3px">Applied Universities</font></th></tr>
<%
int i = 1;

ForAdmin f = new ForAdmin();
f.getConnection();
ResultSet rs = f.getRejectedStudent();
while(rs.next())
{
	int studentId = rs.getInt("studentId");
	String studentName = rs.getString("studentName");
	int totalMark = rs.getInt("totalMark");
	int option1 = rs.getInt("option1");
	int option2 = rs.getInt("option2");
	int option3 = rs.getInt("option3");
	int option4 = rs.getInt("option4");
	int option5 = rs.getInt("option5");
	int option6 = rs.getInt("option6");
	String gender = rs.getString("gender");
%>
<tr><td><%=i %></td><td><%=studentName %></td><td><%=totalMark %></td><td><a href="getAppliedUniversity.jsp?studentId=<%= studentId %>&totalMark=<%= totalMark %>&gender=<%= gender %>&option1=<%= option1 %>&option2=<%= option2 %>&option3=<%= option3 %>&option4=<%= option4 %>&option5=<%= option5 %>&option6=<%= option6 %>">Click here to see.</a>
</td></tr>
<%
i++;
}
%>
</table>
</center>
<br>
<br>
</div>
</body>
</html>