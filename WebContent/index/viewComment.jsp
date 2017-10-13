<%@page import="com.DB.*" %>
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

<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
 <link href="http://localhost:8080/UniversityAdmissionSystem/external/css/hover.css" rel="stylesheet" media="all">
 <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/plus.js"></script>
 <script type="text/javascript" src="http://localhost:8080/UniversityAdmissionSystem/external/js/jquery-1.8.3.min.js"></script>
 <script src='http://localhost:8080/UniversityAdmissionSystem/external/js/buttons.js'></script>
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/buttons.css">
 
 
</head>
<body class="size-960">
<div class="loader"></div>
<br>
<br>
<center>
<div class="line">
<div class="">
<%
String p;
String   id1 = request.getParameter("id");
int id = Integer.parseInt(id1);
String title = request.getParameter("title");
searchUniversity dbObj=new searchUniversity();
dbObj.getConnection();
ResultSet rs1 = dbObj.getComment(id);

%>	


<form>
<table bgColor="white">
	<tr>
	<td colspan="2">
	<font color="#009788" class="bodyHeadText">
	<center>
	<%= title %>
	</center>
	</font>
	</td>
	</tr>
	<tr>
	<td colspan="2">
	<img class="hvr-shadow-radial" src="printImage.jsp?name=<%= title %>">
	</td>
	</tr>
	<%
	while(rs1.next())
	{
		String comment = rs1.getString(2);
		String rollNumber = rs1.getString(3);
	%>
	<tr>
	<td><font color="blue"><%= rollNumber %></font></td>
	<td><font color="orange"><%= comment %></font></td>
	</tr>
	<%
	}
	%>
</table>
</form>
</div>
</div>
</center>
		 <script type="text/javascript">
 	 
         jQuery(document).ready(function($) {	
        	$(".loader").fadeOut("slow");
         });
         </script>
</body>
</html>