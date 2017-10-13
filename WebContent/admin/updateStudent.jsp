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
<title>Updating student</title>
<script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.8.3.min.js"></script>
<script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">

</head>
<body>
<%
String id1 = session.getAttribute("id").toString();
int id = Integer.parseInt(id1);

String studentName = request.getParameter("studentName");
String NRC = request.getParameter("NRC");
String Gender = request.getParameter("Gender");
String studentRollNumber = request.getParameter("studentRollNumber");
String subjectTypeId = request.getParameter("subjectType");
int subjectType = Integer.parseInt(subjectTypeId);

String subject1Mark1 = request.getParameter("subject1Mark");
int subject1Mark = Integer.parseInt(subject1Mark1);

String subject2Mark2= request.getParameter("subject2Mark");
int subject2Mark = Integer.parseInt(subject2Mark2);

String subject3Mark3= request.getParameter("subject3Mark");
int subject3Mark = Integer.parseInt(subject3Mark3);

String subject4Mark4= request.getParameter("subject4Mark");
int subject4Mark = Integer.parseInt(subject4Mark4);

String subject5Mark5= request.getParameter("subject5Mark");
int subject5Mark = Integer.parseInt(subject5Mark5);

String subject6Mark6= request.getParameter("subject6Mark");
int subject6Mark = Integer.parseInt(subject6Mark6);

MakeApplying m = new MakeApplying();
m.getConnection();
m.updateStudent(id, studentName, NRC, studentRollNumber, subjectType, subject1Mark, subject2Mark, subject3Mark, subject4Mark, subject5Mark, subject6Mark);

String url = session.getAttribute("url").toString();
session.removeAttribute("url");
%>
<script>
swal(
		  'You have successfully updated a new Student!',
		  'updated',
		  'success'
		)
	setTimeout(function() {
			document.location = "<%= url %>"; }, 1500);	   
				
</script>
</body>
</html>