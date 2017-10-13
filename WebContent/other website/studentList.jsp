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
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
</head>
<body>
<br>
<center>
<%
int i = 1;
Report r = new Report();
r.getConnection();
ResultSet rs = r.getReportOnAllocatedStudentListByUniversityId(1);
rs.beforeFirst();
if(rs.next())
{
	%>
	<table bgcolor="white">
<tr><th><font color="chocolate">Number</font></th><th><font color="chocolate">Student Name</font></th><th><font color="chocolate">University Name</font></th><th><font color="chocolate">Roll Number</font></th><th><font color="chocolate">NRC</font></th><th><font color="chocolate">Subject Type</font></th></tr>
	<% 
while(rs.next())
{
	int studentId = rs.getInt(1);
	int universityId = rs.getInt(2);
	
	Report r1 = new Report();
	r1.getConnection();
	
	String studentName = r1.getStudentName(studentId);
	String universityName = r1.getUniversityName(universityId);
	String studentRollNumber = r1.getStudentRollNumber(studentId);
	String NRC = r1.getStudentNRC(studentId);
	int subjectTypeId = r1.getSubjectType(studentId);
	String subjectTypeName = r1.getSubjectTypeName(subjectTypeId);
	%>
	<tr><td><%= i %></td><td><%= studentName %></td><td><%= universityName %></td><td><%= studentRollNumber %></td><td><%= NRC %></td><td><%= subjectTypeName %></td></tr>
	<% 
	i++;
}
}
else{
	%>
	<div class="line">
	<div class="box">
	<br>
	<br>
	<center><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/no-result.png"></center>
	<center><font size="6px" color="lightyellow">The system has not allocated university yet!</font></center>
	<center><font size="5px" color="lightyellow">The system will send email if it finish allocating.</font></center>
	<center><font size="5px" color="lightyellow">Admissible students will be announced here.</font></center>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</div>
	</div>
	<%
}
%>
</table>
</center>
</body>
</html>