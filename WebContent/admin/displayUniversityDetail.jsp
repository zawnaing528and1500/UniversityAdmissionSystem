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
<br>
<br>
<%
String id = request.getParameter("id");
int universityId = Integer.parseInt(id);

ForAdmin f = new ForAdmin();
f.getConnection();
ResultSet rs = f.getUniversities(universityId);
if(rs.next())
{
	String universityName = rs.getString("universityName");
	String minMarkForMale = rs.getString("minMarkForMale");
	String minMarkForFemale = rs.getString("minMarkForFemale");
	String noGender = rs.getString("noGender");
	int maleCapacity = rs.getInt("maleCapacity");
	int femaleCapacity = rs.getInt("femaleCapacity");
	int totalCapacity = rs.getInt("totalCapacity");
	int currentMaleCapacity = rs.getInt("currentMaleCapacity");
	int currentFemaleCapacity = rs.getInt("currentFemaleCapacity");
	int currentTotalCapacity = rs.getInt("currentTotalCapacity");
	
	if(noGender.equals("no"))
	{
%>
<center>
<table bgcolor="white" class="tablev1">
<tr><th colspan="2"><font color="chocolate" size="6px"><%=universityName %></font></th></tr>
<tr><td><font color="chocolate" size="4px">Minimum Mark For Male</font></td><td><%=minMarkForMale %></td></tr>
<tr><td><font color="chocolate" size="4px">Minimum Mark For Female</font></td><td><%=minMarkForFemale %></td></tr>
<tr><td><font color="chocolate" size="4px">Limited Male Capacity</font></td><td><%=maleCapacity %></td></tr>
<tr><td><font color="chocolate" size="4px">Limited Female Capacity</font></td><td><%=femaleCapacity %></td></tr>
<tr><td><font color="chocolate" size="4px">Current Male Capacity</font></td><td><%=currentMaleCapacity %></td></tr>
<tr><td><font color="chocolate" size="4px">Current Female Capacity</font></td><td><%=currentFemaleCapacity %></td></tr>
</table>
</center>
<%
}
	else
	{
		%>
		<center>
		<table bgcolor="white" class="tablev1">
		<tr><th colspan="2"><font color="chocolate" size="6px"><%=universityName %></font></th></tr>
		<tr><td><font color="chocolate" size="4px">Minimum Mark</font></td><td><%=minMarkForMale %></td></tr>
		<tr><td><font color="chocolate" size="4px">Limited Capacity</font></td><td><%=totalCapacity %></td></tr>
		<tr><td><font color="chocolate" size="4px">Current Capacity</font></td><td><%=currentTotalCapacity %></td></tr>
		</table>
		</center>
		<% 
	}
}
%>
<br>
<br>
</div>
</body>
</html>