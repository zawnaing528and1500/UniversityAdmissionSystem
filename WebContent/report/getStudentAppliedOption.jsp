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
<%int minMark = 0,capacity = 0,limitCapacity = 0;%>
<%!String u1,u2,u3,u4,u5,u6; %>
<div class="loader"></div>
				<br>
				<br>
				<br>
<table>
<tr><td>Student Name</td><td>Apply Option1</td><td>Apply Option2</td><td>Apply Option3</td><td>Apply Option4</td><td>Apply Option5</td><td>Apply Option6</td></tr>
		<%
		MakeApplying m = new MakeApplying();
		//first Connection
		m.getConnection();
		ResultSet rs = m.getStudentApplyForAllocate();
		while(rs.next())
		{
			int studentId =rs.getInt("studentId");
			int option1 = rs.getInt(2);
			int option2 = rs.getInt(3);
			int option3 = rs.getInt(4);
			int option4 = rs.getInt(5);
			int option5 = rs.getInt(6);
			int option6 = rs.getInt(7);
			
			String studentName = rs.getString("studentName");
			int markForCurrentStudent = rs.getInt("totalMark");
			String genderForCurrentStudent = rs.getString("gender");
			
			MakeApplying m1 = new MakeApplying();
			//second connection
			m1.getConnection();
			ResultSet rs1 = m1.getAppliedUniversities(option1);
			while(rs1.next())
			{
				u1 = rs1.getString("universityName");	
			}
			ResultSet rs2 = m1.getAppliedUniversities(option2);
			while(rs2.next())
			{
				u2 = rs2.getString("universityName");	
			}
			ResultSet rs3 = m1.getAppliedUniversities(option3);
			while(rs3.next())
			{
				u3 = rs3.getString("universityName");	
			}
			ResultSet rs4 = m1.getAppliedUniversities(option4);
			while(rs4.next())
			{
				u4 = rs4.getString("universityName");	
			}
			ResultSet rs5 = m1.getAppliedUniversities(option5);
			while(rs5.next())
			{
				u5 = rs5.getString("universityName");	
			}
			ResultSet rs6 = m1.getAppliedUniversities(option6);
			while(rs6.next())
			{
				u6 = rs6.getString("universityName");	
			}
			%>
			<tr><td><%= studentName %></td><td><%= u1 %></td><td><%= u2 %></td><td><%= u3 %></td><td><%= u4 %></td><td><%= u5 %></td><td><%= u6 %></td></tr>
			<%
		}
%>
</table>
</body>
</html>