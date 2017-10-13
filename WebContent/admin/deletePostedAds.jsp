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
</head>
<body>
<%
String id1 = session.getAttribute("id").toString();
session.removeAttribute("id");
int id = Integer.parseInt(id1);
MakeApplying m = new MakeApplying();
m.getConnection();
m.deleteUniversity(id);

String url = session.getAttribute("url").toString();
session.removeAttribute("url");

response.sendRedirect(url);
%>
</body>
</html>