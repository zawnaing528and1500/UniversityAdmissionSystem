<%@page import="com.DB.*" %>
<%@ page import="java.lang.*"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<%@page import="org.apache.catalina.Session" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="http://localhost:8080/BuyNsell/external/js/sweetalert-dev.js"></script>
<link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/shake/sweetalert.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String currentUserId1 = session.getAttribute("currentUserId").toString();
int currentUserId = Integer.parseInt(currentUserId1);
String id1 = request.getParameter("id");
int id = Integer.parseInt(id1);
String comment = request.getParameter("comment");

searchStudent s = new searchStudent();
s.getConnection();
String rollNumber = s.getStudentRollNumberById(currentUserId);

CommentAds c = new CommentAds();
c.getConnection();
c.comment(id, comment, rollNumber);
String url = session.getAttribute("url").toString();
session.removeAttribute("url");

response.sendRedirect(url);
%>
</body>
</html>