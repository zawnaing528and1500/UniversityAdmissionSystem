<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="allocate.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>medical universities</title>

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
<div class="line">
<%
String universityName;
int minMarkForMale, minMarkForFemale, maleCapacity, femaleCapacity, totalCapacity, currentMaleCapacity, currentFemaleCapacity, currentTotalCapacity;
int i = 1,numberOfApplyStudent = 0, numberOfAcceptedStudent = 0;
int universityId;
//Retrieve all universities where noGender = no, and then display it
ForAdmin f = new ForAdmin();
f.getConnection();
ResultSet rs = f.getTechnologicalUniversity();
%>
<center>
<table bgcolor="white">
<tr><th><font color="chocolate" size="3px">Number</font></th><th><font color="chocolate" size="3px">University Name</font></th><th><font color="chocolate" size="3px">Number of Applied Student</font></th><th><font color="chocolate" size="3px">Number of Accepted Student</font></th></tr>
<%
while(rs.next())
{
	universityId = rs.getInt("specificUniversityId");
	System.out.println(universityId);
	universityName = rs.getString("universityName");
	minMarkForMale = rs.getInt("minMarkForMale");
	minMarkForFemale = rs.getInt("minMarkForFemale");
	maleCapacity = rs.getInt("maleCapacity");//Limited Male Capacity
	femaleCapacity = rs.getInt("femaleCapacity");//Limited Female Capacity
	totalCapacity = rs.getInt("totalCapacity");//Limited Total Capacity
	currentMaleCapacity = rs.getInt("currentMaleCapacity");
	currentFemaleCapacity = rs.getInt("currentFemaleCapacity");
	currentTotalCapacity = rs.getInt("currentTotalCapacity");
	
	ForAdmin f1 = new ForAdmin();
	f1.getConnection();
	numberOfApplyStudent = f1.getNumberOfApplyStudent(universityId);
	numberOfAcceptedStudent = f1.getNumberOfAcceptedStudent(universityId);
	%>
	<tr><td><%=i %></td><td><%=universityName %></td><td><a href="getApplyStudent.jsp?id=<%= universityId %>"><%=numberOfApplyStudent %></a></td><td><a href="getAcceptedStudent.jsp?id=<%= universityId %>"><%=numberOfAcceptedStudent %></a></td></tr>
	<% 
	i++;
}
%>
</table>
</center>
<br>
</div>
<% 
//Retrieve all universities where noGender = yes, and then display it
%>
</body>
</html>