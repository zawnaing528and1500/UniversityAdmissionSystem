<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="allocate.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editing student Name</title>
</head>
<body>
<%
String id = request.getParameter("id");
int studentId = Integer.parseInt(id);

ForAdmin f = new ForAdmin();
f.getConnection();
%>
<form action="processEditStudentName.jsp">
<input type="text" name="studentName" value="<%= f.getStudentName(studentId)%>">
<input type="hidden" name = "id" value =<%=studentId %>>
<input type="hidden" name = "oldName" value="<%=f.getStudentName(studentId) %>">
<input type="submit" value="CHANGE">
</form>
</body>
</html>