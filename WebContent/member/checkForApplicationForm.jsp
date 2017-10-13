<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="allocate.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>checking for Application Form</title>
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">

</head>
<body>
<%
String id1 = session.getAttribute("currentUserId").toString();
int id = Integer.parseInt(id1);
		
GetUniversityWithSubjectType g = new GetUniversityWithSubjectType();
g.getConnection();
boolean check = g.checkApplyList(id);
if(check == true)
{
	%>
	<div class="line">
	<div class="box">
	<br>
	<br>
	<center><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/no-result.png"></center>
	<center><font size="6px" color="lightyellow">You are allowed to apply universities only one time.</font></center>
	<center><font size="5px" color="lightyellow">You have already applied universities.</font></center>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	</div>
	</div>
	<%
}
else
{
	response.sendRedirect("applicationFormFont2.jsp");
}
%>
</body>
</html>