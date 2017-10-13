<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="allocate.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserting student name</title>
</head>
<body>
<%
String id = request.getParameter("id");
System.out.println("Student Id is"+ id);
int studentId = Integer.parseInt(id);
String oldName = request.getParameter("oldName");
String studentName = request.getParameter("studentName");
ForAdmin f = new ForAdmin();
f.getConnection();
f.updateStudentName(studentName, studentId, oldName);
%>
</body>
</html>