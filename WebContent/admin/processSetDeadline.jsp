<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="allocate.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Process setting deadline</title>

 <script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">
</head>
<body>
<%

String hour = request.getParameter("hour");
String minute = request.getParameter("minute");
String second = request.getParameter("second");


int intHour = Integer.parseInt(hour);
int intMinute = Integer.parseInt(minute);
int intSecond = Integer.parseInt(second);

if(intHour > 12)
{
	intHour = intHour - 12;
}

ForAdmin forDeadline = new ForAdmin();
forDeadline.getConnection();
forDeadline.insertTimeForDeadline(2017, 4, 27, intHour, intMinute, intSecond);
%>
<script>
swal(
		  'You have successfully set Deadline.',
		  'Success',
		  'success'
		)
		
setTimeout(function() {
document.location = "http://localhost:8080/UniversityAdmissionSystem/admin/admin.jsp"; }, 2000);	   
		
</script>
<%
System.out.println(" ");
%>

</body>
</html>