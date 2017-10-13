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
<title>Insert title here</title>
<script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.8.3.min.js"></script>
<script src="http://localhost:8080/UniversityAdmissionSystem/external/js/sweetalert-dev.js"></script>
 <link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/shake/sweetalert.css">

</head>
<body>
<%
String id1 = request.getParameter("id");
int id = Integer.parseInt(id1);
MakeApplying m = new MakeApplying();
m.getConnection();
m.deleteStudent(id);

String url = session.getAttribute("url").toString();
session.removeAttribute("url");
%>
<script>
swal(
		  'You have successfully deleted a new Student!',
		  'deleted',
		  'success'
		)
	setTimeout(function() {
			document.location = "<%= url %>"; }, 1500);	   
				
</script>
</body>
</html>