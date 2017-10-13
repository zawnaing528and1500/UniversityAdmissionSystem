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
ResultSet rs = m.getStudentDetail(3);
while(rs.next())
{
	String studentName = rs.getString("studentName");
	int studentId =rs.getInt("studentId");
	
	MakeApplying m1 = new MakeApplying();
	m1.getConnection();
	ResultSet rs1 = m1.getStudentApply();
	while(rs1.next())
	{
		int studentId1 =rs1.getInt(1);
		if(studentId1 == studentId)
		{
		int option1 = rs1.getInt(2);
		int option2 = rs1.getInt(3);
		int option3 = rs1.getInt(4);
		int option4 = rs1.getInt(5);
		int option5 = rs1.getInt(6);
		int option6 = rs1.getInt(7);
		%>
		<tr><td><%= studentName %></td><td><%= option1 %></td><td><%= option2 %></td><td><%= option3 %></td><td><%= option4 %></td><td><%= option5 %></td><td><%= option6 %></td></tr>
		<% 
	}
	}
}
%>
</table>
</body>
</html>