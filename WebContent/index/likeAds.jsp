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
</head>
<body>
<%
String email = session.getAttribute("currentUser").toString();
String id1 = request.getParameter("id");
int id = Integer.parseInt(id1);
String title = request.getParameter("title");
LikeAds l = new LikeAds();
l.getConnection();

ResultSet rs = l.checkforDuplicate(email,title);

if(!(rs.next()))
{
	l.insertToLike(email, title);
	l.like(title);
}


String url = session.getAttribute("url").toString();
session.removeAttribute("url");

response.sendRedirect(url);
%>
</body>
</html>