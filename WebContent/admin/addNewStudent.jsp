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
<title>Add New Student</title>
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
<script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.8.3.min.js"></script>
<script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">
</head>
<body>
<div class="loader"></div>
	<div class="box">
	<center><font class="bodyText" color="#E9967A">Add New Student</font></center>
	<form class=".form-basic" action="addStudent.jsp" method="POST">
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Student Name</font><br><input type="text" name="studentName"  required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">NRC</font><br><input type="text" name="NRC"  required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Roll Number</font><br><input type="text" name="studentRollNumber"  required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 1 Mark</font><br><input type="text" name="subject1Mark"  required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 2 Mark</font><br><input type="text" name="subject2Mark"  required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 3 Mark</font><br><input type="text" name="subject3Mark"  required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 4 Mark</font><br><input type="text" name="subject4Mark"  required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 5 Mark</font><br><input type="text" name="subject5Mark"  required></div>
	<div class="s-12 m-6 l-4 margin-bottom"><font color="#FFDEAD">Subject 6 Mark</font><br><input type="text" name="subject6Mark"  required></div>
	
	<div class="s-12 m-6 l-4 margin-bottom">
	<font color="#FFDEAD">Gender</font><br>
	<select name="Gender" required>
	<option value="m">Male</option>
	<option value="f">Female</option>
	</select>
	</div>
	
	<div class="s-12 m-6 l-8 margin-bottom">
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
	</div>
	
	<input type="submit" value="POST" id="input-submit">
	</form>
	</div>
		 <script type="text/javascript">
         jQuery(document).ready(function($) {	
        	$(".loader").fadeOut("slow");
         });
         </script>
</body>
</html>