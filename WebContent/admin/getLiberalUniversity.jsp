<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="allocate.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Liberal universities</title>

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
int i = 1;
int universityId;

ForAdmin f = new ForAdmin();
f.getConnection();
ResultSet rs = f.getLiberalUniversity();
%>
<center>
<table bgcolor="white">
<tr><th><font color="chocolate" size="3px">Number</font></th><th><font color="chocolate" size="3px">University Name</font></th></tr>
<%
while(rs.next())
{
	universityId = rs.getInt("universityId");
	universityName = rs.getString("name");
	%>
	<tr><td><%=i %></td><td><a href="getAppliedMajor.jsp?universityName=<%= universityName %>"><%=universityName %></a></td></tr>
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