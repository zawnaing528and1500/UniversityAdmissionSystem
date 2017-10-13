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
<title>Updating</title>
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
<script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.8.3.min.js"></script>
<script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">

</head>
<body>
<%

String studentId1 = request.getParameter("studentId");
int studentId = Integer.parseInt(studentId1);

String totalMark1 = request.getParameter("totalMark");
int totalMark = Integer.parseInt(totalMark1);

String city = request.getParameter("city");

MakeApplying m = new MakeApplying();
m.getConnection();

int universityId = m.getUniversityIdByRandom(totalMark, city);

m.allocate(studentId, universityId);
m.deleteOption(studentId);
response.sendRedirect("rejectedStudentWithAllocateFunction.jsp");
%>  
</body>
</html>