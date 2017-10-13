<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="allocate.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rejected Students</title>
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/components.css">
<link rel="stylesheet" href="http://localhost:8080/UniversityAdmissionSystem/external/css/responsee.css">
<style>
table{border-spacing:8px;border-collapse:separate;}
td{padding:6px;}
</style>
</head>
<body class="size-1140">
<br>
<br>
<br>
<div class="line">
<br>
<br>
<br>
<center>

<table bgcolor="white" class="tablev1">
<tr><th><font color="chocolate" size="3px">Number</font></th><th><font color="chocolate" size="3px">University Name</font></th><th><font color="chocolate" size="3px">Minimum Mark</font></th><th><font color="chocolate" size="3px">Accept/Reject</font></th></tr>
<%
boolean admissibleUniversity = false;

String id = request.getParameter("studentId");
String tMark = request.getParameter("totalMark");
String gender = request.getParameter("gender");
String opt1 = request.getParameter("option1");
String opt2 = request.getParameter("option2");
String opt3 = request.getParameter("option3");
String opt4 = request.getParameter("option4");
String opt5 = request.getParameter("option5");
String opt6 = request.getParameter("option6");

int studentId = Integer.parseInt(id);
int totalMark = Integer.parseInt(tMark);
int option1 = Integer.parseInt(opt1);
int option2 = Integer.parseInt(opt2);
int option3 = Integer.parseInt(opt3);
int option4 = Integer.parseInt(opt4);
int option5 = Integer.parseInt(opt5);
int option6 = Integer.parseInt(opt6);


ForAdmin f = new ForAdmin();
f.getConnection();

//need to display universities and reason why he/she is rejected

String university1 = f.getSpecificUniversityName(option1);
String university2 = f.getSpecificUniversityName(option2);
String university3 = f.getSpecificUniversityName(option3);
String university4 = f.getSpecificUniversityName(option4);
String university5 = f.getSpecificUniversityName(option5);
String university6 = f.getSpecificUniversityName(option6);
%>
<tr><td>1</td><td><a href="displayUniversityDetail.jsp?id=<%= option1 %>"><%=university1 %></a></td><td><%= f.getMinMark(gender, option1) %></td>
<td>
<%
if(admissibleUniversity == false)
{
	String reason = f.acceptOrReject(studentId, option1);
	if(reason.equals("accept"))
	{
		%>
		Accept
		<% 
		admissibleUniversity = true;
	}
	else{
		%>
		Reject
		<%
	}
}
%>
</td>
</tr>
<tr><td>2</td><td><a href="displayUniversityDetail.jsp?id=<%= option2 %>"><%=university2 %></a></td><td><%= f.getMinMark(gender, option2) %></td>
<td>
<%
if(admissibleUniversity == false)
{
	String reason = f.acceptOrReject(studentId, option2);
	if(reason.equals("accept"))
	{
		%>
		Accept
		<% 
		admissibleUniversity = true;
	}
	else{
		%>
		Reject
		<%
	}
}
%>
</td>
</tr>
<tr><td>3</td><td><a href="displayUniversityDetail.jsp?id=<%= option3 %>"><%=university3 %></a></td><td><%= f.getMinMark(gender, option3) %></td>
<td>
<%
if(admissibleUniversity == false)
{
	String reason = f.acceptOrReject(studentId, option3);
	if(reason.equals("accept"))
	{
		%>
		Accept
		<% 
		admissibleUniversity = true;
	}
	else{
		%>
		Reject
		<%
	}
}
%>
</td>
</tr>
<tr><td>4</td><td><a href="displayUniversityDetail.jsp?id=<%= option4 %>"><%=university4 %></a></td><td><%= f.getMinMark(gender, option4) %></td>
<td>
<%
if(admissibleUniversity == false)
{
	String reason = f.acceptOrReject(studentId, option4);
	if(reason.equals("accept"))
	{
		%>
		Accept
		<% 
		admissibleUniversity = true;
	}
	else{
		%>
		Reject
		<%
	}
}
%>
</td>
</tr>
<tr><td>5</td><td><a href="displayUniversityDetail.jsp?id=<%= option5 %>"><%=university5 %></a></td><td><%= f.getMinMark(gender, option5) %></td>
<td>
<%
if(admissibleUniversity == false)
{
	String reason = f.acceptOrReject(studentId, option5);
	if(reason.equals("accept"))
	{
		%>
		Accept
		<% 
		admissibleUniversity = true;
	}
	else{
		%>
		Reject
		<%
	}
}
%>
</td>
</tr>
<tr><td>6</td><td><a href="displayUniversityDetail.jsp?id=<%= option6 %>"><%=university6 %></a></td><td><%= f.getMinMark(gender, option6) %></td>
<td>
<%
if(admissibleUniversity == false)
{
	String reason = f.acceptOrReject(studentId, option6);
	if(reason.equals("accept"))
	{
		%>
		Accept
		<% 
		admissibleUniversity = true;
	}
	else{
		%>
		Reject
		<%
	}
}
%>
</td>
</tr>

</table>
</center>
<br>
<br>
</div>
</body>
</html>