<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="allocate.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
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
Date d = new Date();
int yearNow = d.getYear();
int monthNow = d.getMonth();
int dayNow = d.getDay();
int secondNow = d.getSeconds();
int minuteNow = d.getMinutes();
int hourNow = d.getHours();
%>
<%
String id1 = session.getAttribute("currentUserId").toString();
int id = Integer.parseInt(id1);

GetUniversityWithSubjectType g = new GetUniversityWithSubjectType();
g.getConnection();

int setYear = g.getYear();
int setMonth = g.getMonth();
int setDay = g.getDay();
int setHour = g.getHour();
int setMinute = g.getMinute();
int setSecond = g.getSecond();

boolean check = g.checkApplyList(id);
if(check == true)
{
//Compare two Date
if((setYear == yearNow && setMonth == monthNow && setDay == dayNow && setHour == hourNow) || setMinute >= minuteNow) //|| setSecond <= secondNow)
{
	%>
	<div class="line">
	<div class="box">
	<br>
	<br>
	<center><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/no-result.png"></center>
	<center><font size="6px" color="lightyellow">You are allowed to edit Application Form.</font></center>
	<center><font size="5px" color="lightyellow">Because Deadline is already reached.</font></center>
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
	response.sendRedirect("editApplicationForm.jsp");
}
}
else
{
	%>
	<div class="line">
	<div class="box">
	<br>
	<br>
	<center><img src="http://localhost:8080/UniversityAdmissionSystem/external/img/no-result.png"></center>
	<center><font size="6px" color="lightyellow">Application Form is not found.</font></center>
	<center><font size="5px" color="lightyellow">Please apply universities first.</font></center>
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
%>
</body>
</html>