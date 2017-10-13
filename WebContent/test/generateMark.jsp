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
 <link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/components.css">
 <link rel="stylesheet" href="http://localhost:8080/BuyNsell/external/css/responsee.css">
  <script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/jquery-1.8.3.min.js"></script>
 <script type="text/javascript" src="http://localhost:8080/BuyNsell/external/js/jquery-ui.min.js"></script> 
</head>
<body>
<div class="loader"></div>
				<br>
				<br>
				<br>
<center>
<table bgcolor="white">
<%
for(int i = 0 ; i < 7800 ; i++)
{
GenerateMark g = new GenerateMark();
int sub1 = g.generate();
int sub2	= g.generate();
int sub3	= g.generate();
int sub4	= g.generate();
int sub5	= g.generate();
int sub6	= g.generate();
int total = sub1+sub2+sub3+sub4+sub5+sub6;
%>
<tr><td><%= sub1 %></td><td><%= sub2 %></td><td><%= sub3 %></td><td><%= sub4 %></td><td><%= sub5 %></td><td><%= sub6 %></td><td><%= total %></td></tr>
<%
}
%>
</table>
</center>
</body>
</html>