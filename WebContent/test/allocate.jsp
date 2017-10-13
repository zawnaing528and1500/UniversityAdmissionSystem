<%@page import="allocate.*" %>
<%@page import="allAgent.*" %>
<%@ page import="java.lang.*"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Allocate</title>
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

<%
AllocateOption6 opt1 = new AllocateOption6();
opt1.allocate();
%>

</body>
</html>