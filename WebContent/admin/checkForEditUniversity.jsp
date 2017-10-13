<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="allocate.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checking for Edit University</title>
</head>
<body>
<%
String id1 = request.getParameter("id");
int id = Integer.parseInt(id1);
session.setAttribute("id", id);

ForAdmin f = new ForAdmin();
f.getConnection();
String noGender = f.getNoGender(id);

if(noGender.equals("yes"))
{
	response.sendRedirect("editUniversityWthNoGenderYes.jsp");
}
else
{
	response.sendRedirect("editUniversity.jsp");	
}
%>
</body>
</html>