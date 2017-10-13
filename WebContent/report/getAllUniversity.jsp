<%@page import="allocate.*" %>
<%@ page import="java.lang.*"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Universities</title>
</head>
<body>
<table>
<tr><th>Name</th><th>City</th><th>State/Region</th><th>Min Mark For Male</th><th>Min Mark For Female</th><th>Male Capacity</th><th>Female Capacity</th></tr>
<%
MakeApplying m = new MakeApplying();
m.getConnection();
ResultSet rs = m.getAllUniversities();
while(rs.next())
{
	String universityName = rs.getString("universityName");
	String city= rs.getString("city");
	String region= rs.getString("region");
	int minMarkForMale = rs.getInt("minMarkForMale");
	int minMarkForFemale = rs.getInt("minMarkForFeMale");
	int maleCapacity = rs.getInt("maleCapacity");
	int femaleCapacity = rs.getInt("femaleCapacity");
	int totalCapacity = rs.getInt("totalCapacity");
	%>
	<tr><td><%= universityName %></td><td><%= city %></td><td><%= region %></td><td><%= minMarkForMale %></td><td><%= minMarkForFemale %></td><td><%= maleCapacity %></td><td><%= femaleCapacity %></td><td><%= totalCapacity %></td></tr>
	<%
}
%>
</table>
</body>
</html>