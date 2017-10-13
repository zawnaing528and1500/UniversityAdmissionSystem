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
<title>Testing nested result set</title>
 <link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/components.css">
 <link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/responsee.css">
 <script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/jquery-1.8.3.min.js"></script>
 <script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/jquery-ui.min.js"></script> 
</head>
<body>
<div class="loader"></div>
				<br>
				<br>
				<br>

<table>
<%
MakeApplying m = new MakeApplying();
m.getConnection();
ResultSet rs = m.getStudentApply();
while(rs.next())
{
	int studentId =rs.getInt(1);
	int opt1 = rs.getInt(2);
	int opt2 = rs.getInt(3);
	int opt3 = rs.getInt(4);
	int opt4 = rs.getInt(5);
	int opt5 = rs.getInt(6);
	int opt6 = rs.getInt(7);
	String studentName = rs.getString("studentName");
	int markForCurrentStudent = rs.getInt("totalMark");
	String genderForCurrentStudent = rs.getString("gender");
	
	MakeApplying m2 = new MakeApplying();
	m2.getConnection();
	String universityName1 = m2.getAppliedUniversities(opt1).toString();
	String universityName2 = m2.getAppliedUniversities(opt2).toString();
	String universityName3 = m2.getAppliedUniversities(opt3).toString();
	String universityName4 = m2.getAppliedUniversities(opt4).toString();
	String universityName5 = m2.getAppliedUniversities(opt5).toString();
	String universityName6 = m2.getAppliedUniversities(opt6).toString();
	%>
	<tr><td><%= studentName %></td><td><%= markForCurrentStudent %></td><td><%= genderForCurrentStudent %></td><td><%= universityName1 %></td><td><%= universityName2 %></td><td><%= universityName3 %></td><td><%= universityName4 %></td><td><%= universityName5 %></td><td><%= universityName6 %></td></tr>
	<%
}
%>
</table>
</body>
</html>