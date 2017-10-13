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
<tr><td>Student Name</td><td>Total Mark</td><td>Gender</td><td>Apply Option1</td><td>Apply Option2</td><td>Apply Option3</td><td>Apply Option4</td><td>Apply Option5</td><td>Apply Option6</td></tr>
		<%
		MakeApplying m = new MakeApplying();
		m.getConnection();
		ResultSet rs = m.getStudentApply();
		while(rs.next())
		{
				int option1 = rs.getInt(2);
				int option2 = rs.getInt(3);
				int option3 = rs.getInt(4);
				int option4 = rs.getInt(5);
				int option5 = rs.getInt(6);
				int option6 = rs.getInt(7);
				String studentName = rs.getString("studentName");
				int markForCurrentStudent = rs.getInt("totalMark");
				String genderForCurrentStudent = rs.getString("gender");
				%>
				<tr><td><%= studentName %></td><td><%= markForCurrentStudent %></td><td><%= genderForCurrentStudent %></td><td><%= option1 %></td><td><%= option2 %></td><td><%= option3 %></td><td><%= option4 %></td><td><%= option5 %></td><td><%= option6 %></td></tr>
				<% 
			}
%>
</table>
</body>
</html>