<%@page import="allocate.*" %>
<%@page import="distribute.*" %>
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
String id1 = session.getAttribute("id").toString();	
int id = Integer.parseInt(id1);
session.removeAttribute("id");
String universityName = request.getParameter("universityName");
String city = request.getParameter("city");
String region = request.getParameter("region");

String minMarkForMale1 = request.getParameter("minMarkForMale");
int minMarkForMale = Integer.parseInt(minMarkForMale1);

String minMarkForFemale1 = request.getParameter("minMarkForFemale");
int minMarkForFemale = Integer.parseInt(minMarkForFemale1);

String maleCapacity1 = request.getParameter("maleCapacity");
int maleCapacity = Integer.parseInt(maleCapacity1);

String femaleCapacity1 = request.getParameter("femaleCapacity");
int femaleCapacity = Integer.parseInt(femaleCapacity1);

int totalCapacity = maleCapacity + femaleCapacity;
String description = request.getParameter("description");

OtherUas m = new OtherUas();
m.getConnection();
m.updateUniversityInOtherUas(id, universityName, city, region, minMarkForMale, minMarkForFemale, maleCapacity, femaleCapacity, description);
response.sendRedirect("index.jsp");
%>
</body>
</html>