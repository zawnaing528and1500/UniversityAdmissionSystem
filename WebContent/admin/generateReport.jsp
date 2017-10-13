<%@page import="com.DB.*" %>
<%@ page import="java.lang.*"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>report</title>
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
</head>
<body>
<%

String keyword = session.getAttribute("keyword").toString();
String searchType = session.getAttribute("searchType").toString();


if(searchType == null)
{
	searchType = "K";
}
if(keyword == null)
{
	keyword = "a";
}

searchUniversity s = new searchUniversity();
s.getConnection();
ResultSet rs1 = s.searchThreeTypeForReport(searchType, keyword);
%>

<center>
<table bgcolor="white">
<tr>
<th><font color="chocolate">Number</font></th><th><font color="chocolate">Name</font></th><th><font color="chocolate">Region</font></th><th><font color="chocolate">Min Mark For Male</font></th><th><font color="chocolate">Min Mark For Female</font></th><th><font color="chocolate">Limited Male Capacity</font></th><th><font color="chocolate">Limited Female Capacity</font></th><th><font color="chocolate">Current Male Capacity</font></th><th><font color="chocolate">Current Female Capacity</font></th></tr>
</tr>
<% 
int i = 1;
while(rs1.next())
{
	int id = rs1.getInt("specificUniversityId");
	String universityName = rs1.getString("universityName");
	String city = rs1.getString("city");
	String region = rs1.getString("region");
	int minMarkForMale = rs1.getInt("minMarkForMale");
	int minMarkForFemale = rs1.getInt("minMarkForFemale");
	int maleCapacity = rs1.getInt("maleCapacity");
	int femaleCapacity = rs1.getInt("femaleCapacity");
	int totalCapacity = rs1.getInt("totalCapacity");
	int currentMaleCapacity = rs1.getInt("currentMaleCapacity");
	int currentFemaleCapacity = rs1.getInt("currentFemaleCapacity");
	int currentTotalCapacity = rs1.getInt("currentTotalCapacity");
	%>
	<tr><td><%= i %></td><td><%= universityName %></td><td><%= region %></td><td><%= minMarkForMale %></td><td><%= minMarkForFemale %></td><td><%= maleCapacity %></td><td><%= femaleCapacity %></td><td><%= currentMaleCapacity %></td><td><%= currentFemaleCapacity %></td></tr>
<%	
i++;
}
%>
<tr><td colspan="9"><center><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/print.png" onclick="window.print()"></center></td></tr>
</table>
</center>
</body>
</html>