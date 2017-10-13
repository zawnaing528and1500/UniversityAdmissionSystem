<%@page import="com.DB.*" %>
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
<title>Edit Student</title>
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
</head>
<body>
<%
String id1 = request.getParameter("id");
int id = Integer.parseInt(id1);
session.setAttribute("id", id);
MakeApplying m = new MakeApplying();
m.getConnection();
ResultSet rs1 = m.getStudentById(id);
while(rs1.next())
{
	String studentName = rs1.getString("studentName");
	String NRC = rs1.getString("NRC");
	String studentRollNumber = rs1.getString("studentRollNumber");
	int subjectTypeId = rs1.getInt("subjectType");
	int subject1Mark = rs1.getInt("subject1Mark");
	int subject2Mark = rs1.getInt("subject2Mark");
	int subject3Mark = rs1.getInt("subject3Mark");
	int subject4Mark = rs1.getInt("subject4Mark");
	int subject5Mark = rs1.getInt("subject5Mark");
	int subject6Mark = rs1.getInt("subject6Mark");
	int totalMark = rs1.getInt("totalMark");
	%>
	<div class="box">
	<center><font class="bodyText" color="#E9967A">Edit Student</font></center>
	<form class=".form-basic" action="updateStudent.jsp" method="POST">
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Student Name</font><br><input type="text" name="studentName" value="<%=studentName %>" required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">NRC</font><br><input type="text" name="NRC" value="<%=NRC %>" required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Roll Number</font><br><input type="text" name="studentRollNumber" value="<%=studentRollNumber %>" required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 1 Mark</font><br><input type="text" name="subject1Mark" value="<%=subject1Mark %>" required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 2 Mark</font><br><input type="text" name="subject2Mark" value="<%=subject2Mark %>" required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 3 Mark</font><br><input type="text" name="subject3Mark" value="<%=subject3Mark %>" required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 4 Mark</font><br><input type="text" name="subject4Mark" value="<%=subject4Mark %>" required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 5 Mark</font><br><input type="text" name="subject5Mark" value="<%=subject5Mark %>" required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 6 Mark</font><br><input type="text" name="subject6Mark" value="<%=subject6Mark %>" required></div>
		<font color="#FFDEAD">SubjectType</font><br>
			<select name="subjectType" required>
			<option value="1">economics/physics/chemistry</option>
			<option value="2">economics/history/geology</option>
			<option value="3">geology/history/myanma</option>
			<option value="4">history/economics/myanmar</option>
			<option value="5">history/physics/chemistry</option>
			<option value="6">myanmar/physics/chemistry</option>
			<option value="7">physics/chemistry/biology</option>
			<option value="8">geology/physics/chemistry</option>
			</select>

	<input type="submit" value="POST" id="input-submit">
	</form>
	</div>
	<% 
}
%>
</body>
</html>